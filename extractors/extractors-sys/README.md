## extractors-sys
This crate is intended to ease development of extractors written in Rust.
Without this crate, you must provide the required interface expected of
extractors by hand, which is both tedious and error-prone. With this crate,
the interface is implemented for you via a macro (`extractor!`). This enables
you to focus purely on the ingredient extraction logic.

In addition to the macro, several functions that "normalize" ingredients are
provided: `alnum`, `title_case`, and `standard_processing`.

`alnum` removes all characters from strings that aren't alphabetic, numeric, or
whitespace.
`title_case` fixes the casing of strings so the first letter of each word is
capitalized.
`standard_processing` combines these functions into a single step.

Finally, this crate re-exports the `dom_query` crate which provides DOM
traversal and filtering via CSS selectors.

### Example
The following code implements a fully functional extractor for the recipe site
[All Recipes](https://allrecipes.com).
```rust
use extractors_sys::{
  dom::{Document, Matcher}, // dom_query re-export
  extractor, standard_processing,
}

// The extractor macro takes care of implementing the FFI interface
// required for extractors to function. The first argument is the domain
// name of the recipe site this extractor is targetted at. The second argument
// is the function you'll implement to perform the actual extraction.
// Using this macro shaves about 60 lines of error-prone code off.
extractor!(c"allrecipes", allrecipes);

// Thanks to the macro, the actual logic of this extractor is two lines.
// The matcher is provided the CSS selector that matches the ingredients from
// All Recipes' website format.
// The `doc` argument is a `dom_query` Document representing the recipe
// provided to your extractor.
// Iterating over the output of the selection, each ingredient can then be
// normalized via the `standard_processing` helper function.
// The output of this function is an Iterator<Item = String>, which the macro
// will take care of to correctly provide it via the FFI interface.
fn allrecipes(doc: &Document) -> impl Iterator<Item = String> {
  let matcher = Matcher::new("span[data-ingredient-name]").unwrap();
  doc.select_matcher(&matcher).iter().map(standard_processing)
}
```
