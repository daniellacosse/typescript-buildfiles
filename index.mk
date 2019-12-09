-include .env

.DELETE_ON_ERROR:

SHELL:=/bin/bash

APPLICATION_FOLDER=apps
ARTIFACT_FOLDER=.artifacts
BUILDFILE_FOLDER=.buildfiles
HISTORY_FOLDER=.archive
LIBRARY_FOLDER=library

RECIPE?=vue-app
NODE_ENV?=development
TASK?=artifact

.PHONY: default

-include .buildfiles/recipes/*.mk
-include .buildfiles/tasks/*.mk
