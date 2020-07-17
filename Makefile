###############################################################################
# Make file to setup and test a rust project.
#
# Author: Alexander Willner
# License : Whatever. Use at your own risk.
# Todo:
#   - A lot
###############################################################################

# Config
TARGET=target/debug/
TARGET_HTML=html

.PHONY: help license copyright

help: ## Print help for each target
	$(info Rust Makefile)
	$(info =============)
	$(info )
	$(info Consider to use 'cargo' instead.)
	$(info )
	$(info Available commands:)
	$(info )
	@grep '^[[:alnum:]_-]*:.* ##' $(MAKEFILE_LIST) \
        | sort | awk 'BEGIN {FS=":.* ## "}; {printf "%-25s %s\n", $$1, $$2};'
	
compile: check-setup ## Run compiler
	@cargo build

run: ## Run example code
	@RUST_BACKTRACE=full RUST_LOG=info cargo run

clean: ## Run cleanup
	@rm -rf "$(TARGET_HTML)"
	@cargo clean

check-setup:
	@type rustup >/dev/null 2>&1 || (echo "Run 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh' first." >&2 ; exit 1)
	@type rustc >/dev/null 2>&1 || (echo "Run 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh' first." >&2 ; exit 1)

coverage: ## Run code coverage generation
	@type grcov >/dev/null 2>&1 || (echo "Run 'cargo install grcov' first." >&2 ; exit 1)
	@CARGO_INCREMENTAL=0 RUSTFLAGS="-Zprofile -Ccodegen-units=1 -Copt-level=0 -Clink-dead-code -Coverflow-checks=off -Zpanic_abort_tests -Cpanic=abort" cargo build
	@CARGO_INCREMENTAL=0 RUSTFLAGS="-Zprofile -Ccodegen-units=1 -Copt-level=0 -Clink-dead-code -Coverflow-checks=off -Zpanic_abort_tests -Cpanic=abort" cargo test
	@grcov $(TARGET) -t $(TARGET_HTML)
	@echo "Result saved to the '$(TARGET_HTML)' folder"

test: ## Run dynamic tests
	@cargo test

license: ## Run analyzis of used licenses
	@type cargo-license >/dev/null 2>&1 || (echo "Run 'cargo install cargo-license' first." >&2 ; exit 1)
	@cargo-license

lint: ## Run static tests
	@cargo fix
	@cargo clippy --fix -Z unstable-options
	@cargo clippy --all-targets --all-features -- -D warnings

test-fuzzy: ## Run fuzzy tests
	$(info Todo: setup cargo-fuzz)
	@true

style: ## Run style code
	@cargo fmt

doc: ## Generate documentation
	@cargo doc --target-dir docs

copyright: ## Add copyright information to each file
	@find . -iname "*.rs" -exec bash -c "if ! grep -q Copyright "{}"; then cat COPYRIGHT {} > {}.new && mv {}.new {} ; fi" \;
