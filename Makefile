LINTER = rubocop

all: lint test

lint:
	$(LINTER)

lint-files:
	$(LINTER) *.rb

clean:
	rm -rf tmp/* log/*

.PHONY: test

test:
	ruby -Ilib -rminitest/autorun test/test_hexlet_code.rb