.PHONY: eslint

LINTER_REGEX=\.ts$$|\.vue$$
LINT_PROXY_TARGET=$(PROXY_FOLDER)/lint

eslint: $(PROXY_FOLDER)
	make $(LINT_PROXY_TARGET)

$(LINT_PROXY_TARGET): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES)
	yarn eslint $(bash ../helpers/files-changed | egrep $(LINTER_REGEX)) \
		> $(LINT_PROXY_TARGET)
