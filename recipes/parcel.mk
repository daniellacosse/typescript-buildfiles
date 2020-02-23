ifeq ($(RECIPE),parcel)

ifeq ($(TASK),artifact)

ifdef ENTRY

ENTRY_DIRECTORY:=$(shell dirname $(ENTRY))
ENTRY_FILES:=$(shell find $(ENTRY_DIRECTORY) -not \( -path $(ENTRY_DIRECTORY)/node_modules -prune \) -type f -name '*')

PARCEL_ARTIFACT_FOLDER=$(ARTIFACT_FOLDER)/$(ENTRY_DIRECTORY)
PARCEL_ARTIFACT_INDEX=$(ARTIFACT_FOLDER)/$(ENTRY)

default:
	@make $(PARCEL_ARTIFACT_INDEX) \
		ENTRY=$(ENTRY) \
		TASK=artifact \
		RECIPE=parcel

$(PARCEL_ARTIFACT_INDEX): $(ENTRY_FILES)
	@rm -rf $(PARCEL_ARTIFACT_FOLDER) ;\
	 mkdir -p $(PARCEL_ARTIFACT_FOLDER) ;\
	 yarn parcel build $(ENTRY) \
		--out-dir $(PARCEL_ARTIFACT_FOLDER) \
		--target node

endif

endif

endif
