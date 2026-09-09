.PHONY: test test-db test-db-keep test-rust

test: test-db

test-db:
	bash tests/run.sh

test-db-keep:
	FABRIC_TEST_KEEP=1 bash tests/run.sh

test-rust:
	cargo test --workspace
