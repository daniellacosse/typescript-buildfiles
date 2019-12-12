ifeq ($(RECIPE),eslint)

ifeq ($(TASK),check)

FILES_CHANGED:=$(shell bash .buildfiles/helpers/files-changed.sh "\.ts|vue$$") 

ifeq ($(strip $(FILES_CHANGED)),)

default:
	@exit 0

else

default:
	@yarn eslint $(FILES_CHANGED)

endif

endif

endif
