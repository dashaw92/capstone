use extractors_sys::extractor;

extractor!(allrecipes);

fn allrecipes(doc: &'_ Document) -> impl Iterator<Item = Selection<'_>> {
    let matcher = Matcher::new("span[data-ingredient-name]").unwrap();
    doc.select_matcher(&matcher).iter()
}
