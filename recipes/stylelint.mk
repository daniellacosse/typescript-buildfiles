ifeq ($(RECIPE),stylelint)

ifeq ($(TASK),check)

FILES_CHANGED:=$(shell bash .buildfiles/helpers/files-changed.sh "vue$$") 

default:
	@yarn stylelint $(FILES_CHANGED)

endif

endif
