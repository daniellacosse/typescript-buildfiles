-include main.mk

# checks/%:

.PHONY: jest

COVERAGE_FOLDER=$(PROXY_FOLDER)/coverage
COVERAGE_FILES:=$(shell find $(COVERAGE_FOLDER) -type f -name '*' 2>/dev/null)

test: $(PROXY_FOLDER)
	make $(COVERAGE_FILES)

# TODO: test only changed files
$(COVERAGE_FILES): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn jest --ci --bail \
		--findRelatedTests $(bash ../helpers/files-changed.sh) \
		--passWithNoTests

.PHONY: eslint

LINTER_REGEX=\.ts$$|\.vue$$
LINT_PROXY_TARGET=$(PROXY_FOLDER)/lint

eslint: $(PROXY_FOLDER)
	make $(LINT_PROXY_TARGET)

$(LINT_PROXY_TARGET): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn eslint $(bash ../helpers/files-changed | egrep $(LINTER_REGEX)) \
		> $(LINT_PROXY_TARGET)
