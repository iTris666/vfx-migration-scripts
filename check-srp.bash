#!/bin/bash
set -e

readarray() {
  local i=0
  unset -v "$1"
  while IFS= read -r "$1[i++]"; do :; done
  eval "[[ \${$1[--i]} ]]" || unset "$1[i]"
}



readarray new_branches < ../new_branches.list

for new_branch in "${new_branches[@]}"
do
	git checkout vfx/$new_branch >/dev/null 2>/dev/null || echo "branch vfx/$new_branch could not be created it doesn't merge automatically please use git merge vfx-import/$new_branch from vfx/main and fix the conflicts"
done


git checkout vfx/main