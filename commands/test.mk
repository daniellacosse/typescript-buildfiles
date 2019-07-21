.PHONY: test

TEST_RESULTS=$(PROXY_FOLDER)/.jest-test-results.json

test: $(PROXY_FOLDER)
	make $(TEST_RESULTS)

# TODO: test only changed files
$(TEST_RESULTS): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn jest $(call IF_PRODUCTION,--ci --bail) --json --outputFile=$(TEST_RESULTS)
