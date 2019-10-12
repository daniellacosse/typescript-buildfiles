.PHONY: ci

CI_CONFIG=.circleci/config.yml
LOCAL_CI_CONFIG=$(PROXY_FOLDER)/config.local.yml

# ci has no proxy target so you can run it multiple times w/ different jobs
ci: $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(LOCAL_CI_CONFIG) $(SOURCE_FILES)
	circleci local execute --job $(JOB) --config $(LOCAL_CI_CONFIG) \

$(LOCAL_CI_CONFIG): $(PROXY_FOLDER) $(CI_CONFIG)
	circleci config process $(CI_CONFIG) \
		> $(LOCAL_CI_CONFIG)

.PHONY: coverage

COVERAGE_FOLDER=$(PROXY_FOLDER)/coverage
COVERAGE_FILES:=$(shell find $(COVERAGE_FOLDER) -type f -name '*' 2>/dev/null)

coverage: $(PROXY_FOLDER)
	make $(COVERAGE_FOLDER)

$(COVERAGE_FOLDER): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn jest --coverage $(call IF_PRODUCTION,--ci) && mv ./coverage $(COVERAGE_FOLDER)

.PHONY: lint

LINTER_REGEX=\.ts$$|\.vue$$
LINT_PROXY_TARGET=$(PROXY_FOLDER)/lint

lint: $(PROXY_FOLDER)
	make $(LINT_PROXY_TARGET)

$(LINT_PROXY_TARGET): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	current_branch=$$(git rev-parse --abbrev-ref HEAD) ;\
	diff_target=master...$$current_branch ;\
	\
	changes=$$( \
		git diff --diff-filter=MA $$diff_target --name-only \
			| egrep '$(LINTER_REGEX)'\
	) ;\
	\
	if [[ $$changes ]] ;\
		then yarn eslint $$changes \
			> $(LINT_PROXY_TARGET) ;\
	fi

.PHONY: test

TEST_RESULTS=$(PROXY_FOLDER)/.jest-test-results.json

test: $(PROXY_FOLDER)
	make $(TEST_RESULTS)

# TODO: test only changed files
$(TEST_RESULTS): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn jest $(call IF_PRODUCTION,--ci --bail) --json --outputFile=$(TEST_RESULTS)
