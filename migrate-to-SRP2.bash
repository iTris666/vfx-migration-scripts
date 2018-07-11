#!/bin/bash
set -e

export cmd="bash $(pwd)/../treefilter2.bash"


git filter-branch --force --tree-filter '$cmd' --prune-empty --tag-name-filter cat -- --all

#optimize repo
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now

