# TODO: release
# TOOD: documentation
# -- release! --

# RELEASE_PROXY_TARGET=$(PROXY_FOLDER)/release!

SOURCE_FOLDER=source
SOURCE_FILES:=$(shell find $(SOURCE_FOLDER) -type f -name '*')

CONFIG_FOLDER=configuration
CONFIG_FILES:=tsconfig.json $(shell find $(CONFIG_FOLDER) -type f -name '*')

PACKAGE_FOLDER=build
PACKAGE_ENTRY_FILENAME=index
PACKAGE_ENTRY_POINT=$(SOURCE_FOLDER)/$(PACKAGE_ENTRY_FILENAME).ts
PACKAGE_BUILD=$(PACKAGE_FOLDER)/$(PACKAGE_ENTRY_FILENAME).js

# DOCUMENTATION_FOLDER=documentation
# DOCUMENTATION:=$(shell find $(DOCUMENTATION_FOLDER) -type f -name '*')

release:
	@echo "Are you sure? - please run 'release!' to confirm."

release!:
	@echo "Release process is currently not implemented."

# release!: $(PROXY_FOLDER)
# 	make $(RELEASE_PROXY_TARGET)

# $(RELEASE_PROXY_TARGET): $(PROJECT_DEPENDENCY_PROXY_TARGETS)
# 	yarn config set version-git-message "v%s [ci skip]" ;\
# 	yarn version --patch ;\
#		\
# 	make $(PACKAGE_BUILD) ;\
#		make $(DOCUMENTATION) ;\
# 	\
# 	git add $(BUILD_FOLDER) $(DOCUMENTATION_FOLDER) ;\
# 	git commit --amend --no-edit ;\
# 	\
# 	new_version=$$(cat package.json | jq -r '.version') ;\
# 	yarn publish --new-version $$new_version --access public \
# 		> $(RELEASE_PROXY_TARGET)

$(PACKAGE_BUILD): $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(PACKAGE_FOLDER) $(SOURCE_FILES) $(CONFIG_FILES) 
	yarn parcel build $(PACKAGE_ENTRY_POINT) \
		--no-source-maps \
		--target node \
		--out-dir $(PACKAGE_FOLDER)

$(PACKAGE_FOLDER):
	mkdir -p $(BUILD_FOLDER) ;\
	make $(PACKAGE_BUILD)

# $(DOCUMENTATION): $(SOURCE_FILES)
# 	yarn jsdoc2md --files $(SOURCE_FILES) \
# 		> $(DOCS)/readme.md

# $(DOCUMENTATION_FOLDER):
# 	mkdir -p $(DOCUMENTATION_FOLDER)
