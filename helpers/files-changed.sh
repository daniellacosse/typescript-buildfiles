#!/bin/bash

git diff --diff-filter=MA master --name-only | tr "\n" " "
