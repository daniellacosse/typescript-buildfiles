# TODO: release
# -- release! --

# RELEASE_PROXY_TARGET=$(PROXY_FOLDER)/release!

# DOCUMENTATION_FOLDER=documentation
# DOCUMENTATION:=$(shell find $(DOCUMENTATION_FOLDER) -type f -name '*')

BUILD_FOLDER=build
PACKAGE_BUILD=$(BUILD_FOLDER)/index.js $(BUILD_FOLDER)/index.css

release:
	@echo "Are you sure? - please run 'release!' to confirm."

release!:
	@echo "Ronnie's release process is currently not implemented."

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

# $(DOCUMENTATION): $(SOURCE_FILES)
# 	yarn jsdoc2md --files $(SOURCE_FILES) \
# 		> $(DOCS)/readme.md

# $(DOCUMENTATION_FOLDER):
# 	mkdir -p $(DOCUMENTATION_FOLDER)

PACKAGE_ENTRY_POINT=$(SOURCE_FOLDER)/index.js

$(PACKAGE_BUILD): $(PROXY_FOLDER) $(PROJECT_DEPENDENCY_PROXY_TARGETS) $(SOURCE_FILES) $(BUILD_FOLDER)
	yarn parcel build $(PACKAGE_ENTRY_POINT) \
		--out-dir $(BUILD_FOLDER) \
		--no-source-maps

$(BUILD_FOLDER):
	mkdir -p $(BUILD_FOLDER) ;\
	make $(PACKAGE_BUILD)
