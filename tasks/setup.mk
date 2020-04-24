HOMEBREW:=/usr/local/bin/brew
RUBY:=$(shell which ruby)

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
	@make $(PROJECT_DEPENDENCIES)

$(ARTIFACT_FOLDER):
	@mkdir -p $(ARTIFACT_FOLDER) 

$(ARTIFACT_FOLDER)/Brewfile: $(ARTIFACT_FOLDER) Brewfile
	@touch $(ARTIFACT_FOLDER)/Brewfile && \
		brew bundle --force |\
			tee $(ARTIFACT_FOLDER)/Brewfile

$(ARTIFACT_FOLDER)/yarn.lock: $(ARTIFACT_FOLDER) yarn.lock
	@touch $(ARTIFACT_FOLDER)/yarn.lock && \
		yarn install |\
			tee $(ARTIFACT_FOLDER)/yarn.lock

$(ARTIFACT_FOLDER)/vscode-extensions.json: $(ARTIFACT_FOLDER) .vscode/extensions.json
	@touch $(ARTIFACT_FOLDER)/vscode-extensions.json && \
		cat .vscode/extensions.json |\
			jq -r '.recommendations | .[]' |\
			xargs -L 1 code --install-extension |\
				tee $(ARTIFACT_FOLDER)/vscode-extensions.json

$(HOMEBREW):
	$(RUBY) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
