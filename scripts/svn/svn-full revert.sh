#!/bin/bash

svn revert -R . 
svn status --no-ignore | grep '^[I?]' | cut -c 9- | while IFS= read -r f; do rm -rf "$f"; done
svn up