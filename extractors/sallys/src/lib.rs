use dom_query::Matcher;
use extractors_sys::extractor;

extractor!(sallys);

fn sallys(doc: &Document) -> impl Iterator<Item = String> {
    let matcher = Matcher::new("div.tasty-recipes-ingredients-body strong").unwrap();
    doc.select_matcher(&matcher)
        .iter()
        .map(|s| s.text().to_string())
}
