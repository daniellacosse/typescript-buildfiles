ifeq ($(RECIPE),vue)

.PHONY: artifact server

artifact:
	@make $(ARTIFACT_FOLDER)/$(1) ENTRY=$(1)

server:
	@yarn vue-cli-service serve $(1)

$(ARTIFACT_FOLDER)/$(ENTRY): $(shell find $(shell dirname $(ENTRY)) -type f -name '*')
	@yarn vue-cli-service build $(ENTRY) --dest $@

endif
