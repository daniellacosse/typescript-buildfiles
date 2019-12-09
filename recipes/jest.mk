ifeq ($(RECIPE),jest)

ifeq ($(TASK),check)

FILES_CHANGED:=$(shell bash .buildfiles/helpers/files-changed.sh "\.ts|vue$$")
UNCOVERED_EXTENSIONS=%.story.ts %.test.ts %.d.ts %/index.ts
FILES_COVERED=$(filter-out $(UNCOVERED_EXTENSIONS),$(FILES_CHANGED))
COVERAGE_FLAGS:=$(addprefix --collectCoverageFrom=,$(FILES_COVERED))

default:
	@yarn jest \
		$(COVERAGE_FLAGS) \
		--bail \
		--config .jestrc.js \
		--ci \
		--findRelatedTests $(FILES_CHANGED) \
		--passWithNoTests

endif

endif
