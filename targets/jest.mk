# .PHONY: jest

# COVERAGE_FOLDER=$(PROXY_FOLDER)/coverage
# COVERAGE_FILES:=$(shell find $(COVERAGE_FOLDER) -type f -name '*' 2>/dev/null)

# test: $(PROXY_FOLDER)
# 	make $(COVERAGE_FILES)

# $(COVERAGE_FILES): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
# 	yarn jest --ci --bail \
# 		--findRelatedTests $(bash ../helpers/files-changed.sh) \
# 		--passWithNoTests
