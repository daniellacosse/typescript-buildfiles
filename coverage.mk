include main.mk

.PHONY: test

COVERAGE_FOLDER=$(PROXY_FOLDER)/coverage
COVERAGE_FILES:=$(shell find $(COVERAGE_FOLDER) -type f -name '*' 2>/dev/null)

coverage: $(PROXY_FOLDER)
	make $(COVERAGE_FOLDER)

$(COVERAGE_FOLDER): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn jest --coverage $(call IF_PRODUCTION,--ci) && mv ./coverage $(COVERAGE_FOLDER)
