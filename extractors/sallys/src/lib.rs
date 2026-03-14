use extractors_sys::extractor;

extractor!(sallys);

fn sallys(doc: &'_ Document) -> impl Iterator<Item = Selection<'_>> {
    let matcher = Matcher::new("div.tasty-recipes-ingredients-body strong").unwrap();
    doc.select_matcher(&matcher).iter()
}
