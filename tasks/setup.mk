HOMEBREW:=/usr/local/bin/brew
RUBY:=/usr/bin/ruby

# TODO: archive files - for checks, also
# https://www.gnu.org/software/make/manual/make.html#Archives

ifeq ($(NODE_ENV),development)

PROJECT_DEPENDENCIES=\
	$(ARTIFACT_FOLDER)/Brewfile \
	$(ARTIFACT_FOLDER)/yarn.lock \
	$(ARTIFACT_FOLDER)/vscode-extensions.json

endif

ifeq ($(NODE_ENV),production)

PROJECT_DEPENDENCIES=$(ARTIFACT_FOLDER)/yarn.lock

endif

.PHONY: setup

setup: $(HOMEBREW)
	@cd $(BUILDFILE_FOLDER) && git pull ;\
	 cd .. && mkdir -p $(ARTIFACT_FOLDER) ;\
	 make $(PROJECT_DEPENDENCIES)

$(ARTIFACT_FOLDER)/Brewfile: Brewfile
	@brew bundle --force |\
		tee $(ARTIFACT_FOLDER)/Brewfile

$(ARTIFACT_FOLDER)/yarn.lock: yarn.lock
	@yarn install |\
		tee $(ARTIFACT_FOLDER)/yarn.lock

$(ARTIFACT_FOLDER)/vscode-extensions.json: .vscode/extensions.json
	@cat .vscode/extensions.json |\
		jq -r '.recommendations | .[]' |\
		xargs -L 1 code --install-extension |\
			tee $(ARTIFACT_FOLDER)/vscode-extensions.json

$(HOMEBREW):
	$(RUBY) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
