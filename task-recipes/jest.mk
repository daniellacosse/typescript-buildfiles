ifeq ($(RECIPE),jest)

.PHONY: $(RECIPE) check server

FILES_CHANGED:=$(shell ../helpers/files-changed.sh) 

$(RECIPE):
	@yarn jest $(ENTRY) --output-dir $(COVERAGE_FOLDER)

check:
	@yarn jest --ci \
		--findRelatedTests $(FILES_CHANGED) \
		--collectCoverageFrom $(FILES_CHANGED)
		--passWithNoTests --bail

server: # TODO

endif
