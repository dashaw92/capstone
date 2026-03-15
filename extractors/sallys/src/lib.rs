use dom_query::Matcher;
use extractors_sys::{extractor, standard_processing};

extractor!(c"sallysbakingaddiction.com", sallys);

fn sallys(doc: &Document) -> impl Iterator<Item = String> {
    let matcher = Matcher::new("div.tasty-recipes-ingredients-body strong").unwrap();
    doc.select_matcher(&matcher).iter().map(standard_processing)
}
