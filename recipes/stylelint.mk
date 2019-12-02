ifeq ($(RECIPE),stylelint)

.PHONY: $(RECIPE) check

FILES_CHANGED:=$(shell ../helpers/files-changed.sh) 

$(RECIPE):
	@yarn stylelint $(ENTRY)

check:
	@yarn stylelint $(FILES_CHANGED)

endif
