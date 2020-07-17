// Copyright by Alexander Willner. See the LICENCE file for the license information.
//! Documentation

#![warn(
    missing_copy_implementations,
    missing_debug_implementations,
    missing_docs,
    trivial_numeric_casts,
    unsafe_code,
    unused_extern_crates,
    unused_import_braces,
    unused_qualifications
)]
#![cfg_attr(feature = "clippy", warn(cast_possible_truncation))]
#![cfg_attr(feature = "clippy", warn(cast_possible_wrap))]
#![cfg_attr(feature = "clippy", warn(cast_precision_loss))]
#![cfg_attr(feature = "clippy", warn(cast_sign_loss))]
#![cfg_attr(feature = "clippy", warn(missing_docs_in_private_items))]
#![cfg_attr(feature = "clippy", warn(mut_mut))]
#![cfg_attr(feature = "clippy", warn(print_stdout))]
#![cfg_attr(all(not(test), feature = "clippy"), warn(result_unwrap_used))]
#![cfg_attr(feature = "clippy", warn(unseparated_literal_suffix))]
#![cfg_attr(feature = "clippy", warn(wrong_pub_self_convention))]

use log;
use std::env;
use tmpl::foo;

pub fn main() {
    //! The main file

    env_logger::init();
    println!("Hello, {}!", foo::add(22, 1));
    let args: Vec<String> = env::args().collect();
    log::info!("Parameters: {}", args.len());
    let param: String = if args.len() > 1 {
        args[1].to_string()
    } else {
        "none".to_string()
    };
    println!("First Parameter: {}", param);
}
