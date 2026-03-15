pub use dom_query as dom;
use dom_query::Selection;

/// Generates all of the boilerplate required to interface the backend server, namely:
/// FFIArray: A deconstructed vec of CStrings converted to pointers (*const *mut c_char)
/// extract: pub fn that takes raw html and selects ingredients from the page
/// deinit: frees the FFIArray yielded by extract
///
/// This macro frees the consumer from the burden of correctly implementing these aspects
/// of the library, enabling them to define the extractor function that extract will use.
/// The extractor function takes the form of:
/// ```rust
/// use dom_query::Document;
///
/// fn foo(doc: &Document) -> impl Iterator<Item = String> {
///    todo!("traverse the document tree and yield elements of interest");
/// }
/// ```
///
/// With the newly implemented extractor function in hand, consumers then provide the function
/// to this macro along with a domain (the domain that the extractor knows how to handle):
/// ```rust
/// extractor!(c"allrecipes.com", foo);
/// ```
/// Upon building the crate as "cdylib", the resulting shared library will
/// be functional in the backend server.
#[macro_export]
macro_rules! extractor {
    ($domain:literal, $extractor:ident) => {
        use std::ffi::{CStr, CString, c_char};

        #[repr(C)]
        pub struct FFIArray {
            items: *const *mut c_char,
            len: usize,
        }

        #[unsafe(no_mangle)]
        pub extern "C" fn domain() -> *const c_char {
            $domain.as_ptr()
        }

        #[unsafe(no_mangle)]
        pub extern "C" fn extract(body_ptr: *const c_char) -> FFIArray {
            if body_ptr.is_null() {
                panic!("Bad string");
            }

            let body: &str = unsafe {
                CStr::from_ptr(body_ptr)
                    .to_str()
                    .expect("invalid *const c_char -> &str conversion")
            };

            let doc = Document::from(body);
            let output = crate::$extractor(&doc);

            let mut array: Vec<CString> = vec![];
            for fragment in output {
                array.push(
                    CString::new(fragment)
                        .expect("invalid conversion to CString when creating FFIArray"),
                );
            }

            array.shrink_to_fit();
            let pointers: Vec<*mut c_char> = array.into_iter().map(|s| s.into_raw()).collect();

            let ffi_array = FFIArray {
                items: pointers.as_ptr(),
                len: pointers.len(),
            };

            std::mem::forget(pointers);
            ffi_array
        }

        #[unsafe(no_mangle)]
        pub extern "C" fn deinit(array: FFIArray) {
            if array.items.is_null() {
                return;
            }

            unsafe {
                Vec::from_raw_parts(*array.items, array.len, array.len);
            }
        }
    };
}

/// Wraps up all typical steps taken to process a given text fragment into a standard
/// ingredient format.
pub fn standard_processing(input: Selection<'_>) -> String {
    let text = input.text().to_string();
    let stripped = alnum(text);
    let title = title_case(stripped);
    title
}

/// Converts each "word" of an ingredient to title case:
/// "vanilla extract" -> "Vanilla Extract"
fn title_case(input: String) -> String {
    use std::iter::{chain, once};

    input
        .split_whitespace()
        .flat_map(|s: &str| {
            //capitalize the first character
            let first = s
                .chars()
                .next()
                .map(|c| c.to_uppercase())
                .and_then(|mut uppers| uppers.next())
                .expect("invalid char in title_case");
            //and keep the rest of the part as-is
            let rest = s.chars().skip(1);

            //create an iterator comprised of the newly capitalized character, the original characters,
            //and a trailing space (to return the input string back to the original form).
            chain(once(first), rest).chain(once(' '))
        })
        .take(input.len()) //strip the trailing ' ' from the output
        .collect()
}

/// Convenience method to strip characters from strings that are neither letters nor digits
/// Intended to be used as a step during the extraction function implementation's processing.
pub fn alnum(mut input: String) -> String {
    // char::is_alphanumeric is Unicode aware and will respect non-English letters and numbers
    input.retain(|c| c.is_alphanumeric() || c.is_whitespace());
    input
}
