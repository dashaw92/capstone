use dom_query::Matcher;
use extractors_sys::extractor;

extractor!(allrecipes);

fn allrecipes(doc: &Document) -> impl Iterator<Item = String> {
    let matcher = Matcher::new("span[data-ingredient-name]").unwrap();
    doc.select_matcher(&matcher)
        .iter()
        .map(|s| s.text().to_string())
}
