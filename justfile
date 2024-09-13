# List all recipes
just:
	just --list --unsorted

# Install dependencies and build via eask
build:
	emacs --version
	eask install-deps --dev
	eask package

# Test
test:
	eask compile
	eask emacs --batch -L . -L test -l test/all-tests.el -f ert-run-tests-batch-and-exit
