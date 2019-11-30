ifeq ($(RECIPE),storybook)

STORYBOOK_COMMON_FLAGS=--quiet

.PHONY: artifact server

artifact:
	@yarn build-storybook $(STORYBOOK_COMMON_FLAGS) --output-dir $(OUTPUT)

# $(ARTIFACT_FOLDER)/%: $(shell find $(shell dirname $%) -type f -name '*')
# 	make $(TASK) ENTRY=$% OUTPUT=$@ RECIPE=$(RECIPE)

server:
	@yarn start-storybook $(STORYBOOK_COMMON_FLAGS)

endif
