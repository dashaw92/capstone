// This presents a minimal example of writing an extractor for the backend to use in C.
// Nothing useful actually happens in this code, it only returns dummy generated values
// for the backend to present to the client. This example can be used as a skeleton for
// writing a real extractor. However, I highly recommend implementing it in Rust via the
// `extractors_sys` crate I wrote which alleviates the tedium of writing all of this
// boilerplate. This is just to prove it can be done in C.

#include <stddef.h> //size_t
#include <stdio.h> //sprintf
#include <stdlib.h> //malloc + free
#include <string.h> //strlen

// The backend expects a struct with a string array and
// the length declared as follows:
typedef struct {
  //This array will contain the extracted ingredients from the HTML.
  char **items;
  // Declares the length of the items array. This must be accurate in order
  // to ensure proper freeing later.
  size_t len;
} FFIArray;

// Declares the domain this extractor supports.
// This function is called when the extractor is first loaded by the server.
// The client will display it in the "Extractors" page in a list.
extern const char *domain() {
  return "example.com";
}

// This function is responsible for traversing the HTML DOM (provided as a string)
// and extracting the ingredients from the page. A preliminary search yielded "libxml2" being
// a potentially helpful library for achieving this in C... but I'm only writing this example
// to test writing the extractor in C as opposed to Rust. I'd highly recommend just using Rust
// with the `dom_query` crate (re-exported by the `extractors_sys` crate I wrote).
// `extractors_sys` handles almost all of this boilerplate code and can help you write a functional
// extractor in about 15 lines of code or less.
extern FFIArray extract(const char *body) {
  // Dummy value, just to test if the extractor is actually working. No DOM traversal is happening here
  // obviously.
  size_t numEls = 100;
  // Allocate the array we'll be passing to the server.
  char **array = malloc(sizeof(char *) * numEls);

  // Generate dummy values in the array.
  for (size_t i = 0; i < numEls; i++) {
    // Generously allocate more than enough space for each dummy value.
    array[i] = malloc(sizeof(char) * strlen("Entry NNNN"));
    // Dynamic dummy entry via sprintf: i = 0 -> "Entry 1"
    sprintf(array[i], "Entry %zu", i + 1);
  }

  // Pass the array off to the server. The server will clone every entry
  // in the array before passing it back to us via deinit.
  return (FFIArray) {
    .items = array,
    .len = numEls,
  };
}

// Handle freeing the array we allocated before.
extern void deinit(FFIArray arr) {
  // The `len` variable must be accurate for this reason. Otherwise
  // we risk memory leaks.
  for(size_t i = 0; i < arr.len; i++) {
    free(arr.items[i]);
  }

  free(arr.items);
}
