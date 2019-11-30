# TODO: determine default recipe from .env
-include .env

.DELETE_ON_ERROR:

SHELL:=/bin/bash

APPLICATION_FOLDER=apps
ARTIFACT_FOLDER=.artifacts
BUILDFILE_FOLDER=.buildfiles
HISTORY_FOLDER=.archive
LIBRARY_FOLDER=library

# TODO: set recipe to `vue` if not set

# TODO: `help` should be first
-include .buildfiles/tasks/*.mk .buildfiles/task-recipes/*.mk
