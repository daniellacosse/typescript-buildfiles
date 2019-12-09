ifeq ($(RECIPE),storybook)

override ENTRY=library/index.ts

STORYBOOK_COMMON_FLAGS=--quiet

# -- artifact --
ifeq ($(TASK),artifact)

ENTRY_DIRECTORY:=$(shell dirname $(ENTRY))
ENTRY_FILES:=$(shell find $(ENTRY_DIRECTORY) -type f -name '*')

STORYBOOK_ARTIFACT_FOLDER=$(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)
STORYBOOK_ARTIFACT_INDEX=$(STORYBOOK_ARTIFACT_FOLDER)/index.html

default:
	@make $(STORYBOOK_ARTIFACT_INDEX) \
		ENTRY=$(ENTRY) \
		TASK=artifact \
		RECIPE=storybook

$(STORYBOOK_ARTIFACT_INDEX): $(ENTRY_FILES)
	@yarn build-storybook $(STORYBOOK_COMMON_FLAGS) --output-dir $(STORYBOOK_ARTIFACT_FOLDER)

endif

# -- server --
ifeq ($(TASK),server)

default:
	@yarn start-storybook $(STORYBOOK_COMMON_FLAGS)

endif

endif
