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
