ifeq ($(RECIPE),vue-ts)

# -- artifact --
ifeq ($(TASK),artifact)

ifdef ENTRY

ENTRY_DIRECTORY:=$(shell dirname $(ENTRY))
ENTRY_FILES:=$(shell find $(ENTRY_DIRECTORY) -not \( -path $(ENTRY_DIRECTORY)/node_modules -prune \) -type f -name '*')

VUE_TS_ARTIFACT_FOLDER=$(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)
VUE_TS_ARTIFACT_INDEX=$(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)/index.html

default:
	@make $(VUE_TS_ARTIFACT_INDEX) \
		ENTRY=$(ENTRY) \
		TASK=artifact \
		RECIPE=vue-ts

$(VUE_TS_ARTIFACT_INDEX): $(ENTRY_FILES)
	@rm -rf $(VUE_TS_ARTIFACT_FOLDER) ;\
	 mkdir -p $(VUE_TS_ARTIFACT_FOLDER) ;\
	 yarn vue-cli-service build $(ENTRY) --dest $(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)

endif

endif

# -- TODO: check --

# -- server --
ifeq ($(TASK),server)

default:
	@yarn vue-cli-service serve --open $(ENTRY)

endif

endif
