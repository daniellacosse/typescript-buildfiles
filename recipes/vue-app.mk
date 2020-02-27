ifeq ($(RECIPE),vue-app)

ifdef ENTRY

ENTRY_DIRECTORY:=$(shell dirname $(ENTRY))
ENTRY_FILES:=$(shell find $(ENTRY_DIRECTORY) -not \( -path $(ENTRY_DIRECTORY)/node_modules -prune \) -type f -name '*')

VUE_APP_ARTIFACT_FOLDER=$(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)
VUE_APP_ARTIFACT_INDEX=$(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)/index.html

# -- artifact --
ifeq ($(TASK),artifact)

default:
	@make $(VUE_APP_ARTIFACT_INDEX) \
		ENTRY=$(ENTRY) \
		TASK=artifact \
		RECIPE=vue-app

$(VUE_APP_ARTIFACT_INDEX): $(ENTRY_FILES)
	@rm -rf $(VUE_APP_ARTIFACT_FOLDER) ;\
	 mkdir -p $(VUE_APP_ARTIFACT_FOLDER) ;\
	 yarn vue-cli-service build $(ENTRY) \
		--dest $(VUE_APP_ARTIFACT_FOLDER) \
		--report \
		--modern

endif

# -- check --
ifeq ($(TASK),check)

default:
	@yarn vue-cli-service build $(ENTRY) --dest $(VUE_APP_ARTIFACT_FOLDER) --modern

endif

# -- server --
ifeq ($(TASK),server)

default:
	@yarn vue-cli-service serve --open $(ENTRY)

endif

endif

endif
