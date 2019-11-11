-include .env

SHELL:=/bin/bash

IF_ENV=$(if $(filter $(NODE_ENV),$(1)),$(2))
IF_LOCAL=$(call IF_ENV,local,$(1))
IF_PRODUCTION=$(call IF_ENV,production,$(1))

BUILDFILE_FOLDER=.buildfiles
PROXY_FOLDER=.buildfile-artifacts

.DELETE_ON_ERROR:

-include .buildfiles/tasks/*.mk .buildfiles/targets/*.mk

.PHONY: apps/% apps/%/server library

apps/%: $(PROXY_FOLDER)/apps/%

$(PROXY_FOLDER)/apps/%: setup
 $(if $(TARGET),make $(TARGET),make %)

apps/%/server: setup
	$(if $(TARGET),make $(TARGET)/server,make %/server)

library: setup
	# build library
