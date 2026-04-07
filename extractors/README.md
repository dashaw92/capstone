## Extractors
Extractors are shared libraries (dll, so, dylib) that extract ingredients from
recipe websites. Each extractor is responisble for functioning against one
recipe site.

### Interface
Each extractor must export the following interface (minimal C code):  
```c
// Name the struct whatever, but it must conform to this structure:
typedef struct {
  char **ingredients;
  size_t length;
} IngredientArray;

// This function returns the domain name this extractor knows how
// to extract ingredients from.
extern const char *domain() {
  return "recipewebsite.com";
}

// Perform the ingredient extraction. `body` is a
// string containing the HTML of the recipe to extract from.
extern IngredientArray extract(const char *body) {
  size_t n = 10; //example
  char **ingredients = malloc(sizeof(char *) * n);
  
  //do something with the ingredients array...

  return (IngredientArray) {
    .ingredients = ingredients,
    .length = n;
  };
}

// Deallocate the array as needed. Make sure the individual items
// you allocated are freed in addition to freeing the array as a whole.
extern void deinit(IngredientArray array) {
  free(array.items);
}
```
Any language capable of compiling code to match this interface can be used,
though I recommend using Rust in tandem with the `extractors-sys` crate in this
directory to cut down on boilerplate.

### Using Rust (recommended method)
To get started with a new extractor written in Rust, use the `new.sh` script in
this directory:
```sh
$ ./new.sh <extractor name>
```
That command will create a skeleton extractor project in the current directory.
From there, implementing the functioning extractor requires you to divine the
system your recipe website uses to mark ingredients. Check the `sallys` or
`allrecipes` example extractors for more information on creating a functional
extractor.

### Installation
Once you have compiled your extractor into a shared library, you can verify it
is correctly exporting the required interface via the following command:
```sh
$ nm -D --defined-only <libextractor.so>
```
If you implemented it correctly, you should see the three functions (`deinit`,
`domain`, and `extract`) listed.
Simply move the shared library (or symlink it) into the `extractors` directory
in the backend's directory. Upon server startup, you should see your extractor
load. Whenever the client submits a URL that matches the domain you provided,
your extractor will receive the request via the `extract` function. Once the
server has finished copying the ingredients you yielded via `extract` into
managed memory, your `deinit` function will be called.
