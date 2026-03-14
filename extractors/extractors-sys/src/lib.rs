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
/// to this macro:
/// ```rust
/// extractor!(foo);
/// ```
/// Upon building the crate as "cdylib", the resulting shared library will
/// be functional in the backend server.
#[macro_export]
macro_rules! extractor {
    ($extractor:ident) => {
        use dom_query::Document;
        use std::ffi::{CStr, CString, c_char};

        #[repr(C)]
        pub struct FFIArray {
            items: *const *mut c_char,
            len: usize,
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
