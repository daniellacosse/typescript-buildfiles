-include .env

.DELETE_ON_ERROR:

SHELL:=/bin/bash

IF_ENV=$(if ifeq ($(NODE_ENV),$(1)),$(2))
IF_PRODUCTION=$(call IF_ENV,production,$(1))

# -- proxy targets --

PROXY_FOLDER=.make

$(PROXY_FOLDER):
	mkdir -p $(PROXY_FOLDER)

PROJECT_DEPENDENCY_PROXY_TARGETS = \
	$(PROXY_FOLDER)/Brewfile \
	$(PROXY_FOLDER)/yarn.lock \
	$(PROXY_FOLDER)/vscode-extensions.json

$(PROXY_FOLDER)/Brewfile: Brewfile
	$(call IF_PRODUCTION,exit 0) ;\
	\
	brew bundle --force \
		> $(PROXY_FOLDER)/Brewfile

Brewfile: # watch this file

$(PROXY_FOLDER)/yarn.lock: yarn.lock
	yarn install \
		> $(PROXY_FOLDER)/yarn.lock

yarn.lock: # watch this file

$(PROXY_FOLDER)/vscode-extensions.json: .vscode/extensions.json
	$(call IF_PRODUCTION,exit 0) ;\
	\
	cat .vscode/extensions.json |\
		jq -r '.recommendations | .[]' |\
		xargs -L 1 code --install-extension \
			> $(PROXY_FOLDER)/vscode-extensions.json

.vscode/extensions.json: # watch this file

# -- reset! --

.PHONY: reset reset!

reset:
	@echo "Are you sure? - please run 'reset!' to confirm."

reset!:
	rm -rf $(PROXY_FOLDER)
