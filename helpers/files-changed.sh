#!/bin/bash

git diff --diff-filter=MA master --name-only | egrep $1 | tr "\n" " "
