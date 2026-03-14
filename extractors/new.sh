#!/bin/sh
cargo new --lib "$1"
cd "$1"
cargo add dom_query
cargo add --path ../extractors-sys
cat << EOF >> Cargo.toml

[lib]
crate-type = ["cdylib"]
EOF

# Note: Intentionally overwriting the previous contents of lib.rs here
cat << EOF > src/lib.rs
use dom_query::Matcher;
use extractors_sys::extractor;

extractor!(extract_impl);

fn extract_impl(doc: &Document) -> impl Iterator<Item = String> {
  let matcher = Matcher::new("").unwrap();
  doc.select_matcher(&matcher).iter()
    .map(|s| s.text().to_string())
}
EOF
