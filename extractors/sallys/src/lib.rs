use extractors_sys::extractor;

extractor!(sallys);

fn sallys(doc: &'_ Document) -> impl Iterator<Item = Selection<'_>> {
    let matcher = Matcher::new("title").unwrap();
    doc.select_matcher(&matcher).iter()
}
