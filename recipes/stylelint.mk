ifeq ($(RECIPE),stylelint)

ifeq ($(TASK),check)

FILES_CHANGED:=$(shell bash .buildfiles/helpers/files-changed.sh "vue$$") 

ifeq ($(strip $(FILES_CHANGED)),)


default:
	@exit 0

else

default:
	@yarn stylelint $(FILES_CHANGED)

endif

endif

endif
