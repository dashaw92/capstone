use extractors_sys::{
    dom::{Document, Matcher},
    extractor, standard_processing,
};

extractor!(c"allrecipes.com", allrecipes);

fn allrecipes(doc: &Document) -> impl Iterator<Item = String> {
    let matcher = Matcher::new("span[data-ingredient-name]").unwrap();
    doc.select_matcher(&matcher).iter().map(standard_processing)
}
