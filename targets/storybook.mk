STORYBOOK_PATH=.storybook
STORYBOOK_FILES:=$(shell find $(PROXY_FOLDER)/$(STORYBOOK_PATH) -type f -name '*')
STORYBOOK_COMMON_FLAGS=--quiet

storybook/server:
	@yarn start-storybook $(STORYBOOK_COMMON_FLAGS)

storybook: $(STORYBOOK_FILES)
	@yarn build-storybook
