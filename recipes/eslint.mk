ifeq ($(RECIPE),eslint)

ifeq ($(TASK),check)

FILES_CHANGED:=$(shell bash .buildfiles/helpers/files-changed.sh "\.ts|vue$$") 

default:
	@yarn eslint $(FILES_CHANGED)

endif

endif
