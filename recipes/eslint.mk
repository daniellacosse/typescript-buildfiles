ifeq ($(RECIPE),eslint)

.PHONY: $(RECIPE) check

FILES_CHANGED:=$(shell ../helpers/files-changed.sh) 

$(RECIPE):
	@yarn eslint $(ENTRY)

check:
	@yarn eslint $(FILES_CHANGED)

endif
