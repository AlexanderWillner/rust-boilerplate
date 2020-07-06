# Rust Boiler Plate

Simple rust boiler plate project. Main features:

* Main application with parameter parsing and logger (`env_logger`).
* Dynamic tests via unit tests and test coverage (`grcov`).
* Static tests (`clippy`).
* Requirements management.
* Basic make, .gitignore and other configuration files.

[![Build Status](https://github.com/alexanderwillner/rust-boilerplate/workflows/Build-Test/badge.svg)](https://github.com/AlexanderWillner/rust-boilerplate/actions) [![Build Status](https://travis-ci.org/AlexanderWillner/rust-boilerplate.svg?branch=master)](https://travis-ci.org/AlexanderWillner/rust-boilerplate) [![Coverage Status](https://coveralls.io/repos/github/AlexanderWillner/rust-boilerplate/badge.svg?branch=master)](https://coveralls.io/github/AlexanderWillner/rust-boilerplate?branch=master) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/AlexanderWillner/rust-boilerplate/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/AlexanderWillner/rust-boilerplate/?branch=master)

## Examples

```bash
$ make
Rust Makefile
=============

Consider to use 'cargo' instead.

Available commands:

check-setup               Run setup check (e.g. required binaries)
clean                     Run cleanup
compile                   Run compiler
coverage                  Run code coverage generation
doc                       Generate documentation
help                      Print help for each target
lint                      Run static tests
run                       Run example code
style                     Run style code
test-fuzzy                Run fuzzy tests
test                      Run dynamic tests
```

```bash
$ make run
    Finished dev [unoptimized + debuginfo] target(s) in 0.02s
     Running `target/debug/tmpl`
Hello, 23!
[2020-07-06T19:33:39Z INFO  tmpl] Parameters: 1
First Parameter: none
```
