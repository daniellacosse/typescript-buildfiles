.PHONY: setup

setup:
	cd $(BUILDFILE_FOLDER) && git pull ;\
	cd .. && mkdir -p $(PROXY_FOLDER) ;\
	make $(PROJECT_DEPENDENCY_PROXY_TARGETS)

PROJECT_DEPENDENCY_PROXY_TARGETS= \
	$(call IF_LOCAL,$(PROXY_FOLDER)/Brewfile) \
	$(PROXY_FOLDER)/yarn.lock \
	$(call IF_LOCAL,$(PROXY_FOLDER)/vscode-extensions.json)

$(PROXY_FOLDER)/Brewfile: Brewfile
	brew bundle --force |\
		tee $(PROXY_FOLDER)/Brewfile

$(PROXY_FOLDER)/yarn.lock: yarn.lock
	yarn install |\
		tee $(PROXY_FOLDER)/yarn.lock

$(PROXY_FOLDER)/vscode-extensions.json: .vscode/extensions.json
	cat .vscode/extensions.json |\
		jq -r '.recommendations | .[]' |\
		xargs -L 1 code --install-extension |\
			tee $(PROXY_FOLDER)/vscode-extensions.json
