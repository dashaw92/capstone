use std::ffi::{CStr, CString, c_char};

use dom_query::{Document, Matcher};

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
    let matcher = Matcher::new("title").unwrap();
    let paras = doc.select_matcher(&matcher);

    let mut array: Vec<CString> = vec![];
    for p in paras.iter() {
        array.push(
            CString::new(p.text().to_string())
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
