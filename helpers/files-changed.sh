#!/bin/bash

git diff --diff-filter=MA development --name-only | egrep $1 | tr "\n" " "
