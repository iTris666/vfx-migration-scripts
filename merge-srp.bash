#!/bin/bash
set -e

readarray() {
  local i=0
  unset -v "$1"
  while IFS= read -r "$1[i++]"; do :; done
  eval "[[ \${$1[--i]} ]]" || unset "$1[i]"
}

git remote add srp https://github.com/Unity-Technologies/ScriptableRenderPipeline || true
git fetch srp
git reset --hard
git checkout master

readarray new_branches < ../new_branches.list

for new_branch in "${new_branches[@]}"
do
	git checkout vfx-import/$new_branch
done

git checkout master
git checkout -b vfx/main && git merge vfx-import/main --allow-unrelated-histories -m "creating vfx/main by merging master with vfx-import/main" || true

#delete=("main")
#new_branches=( "${new_branches[@]/$delete}" )

for new_branch in "${new_branches[@]}"
do
	git checkout vfx/main
	git checkout -b vfx/$new_branch && git merge vfx-import/$new_branch -m "creating vfx/${new_branch} by merging vfx/main with vfx-import/${new_branch}" || git reset --hard
done

#not yet tested

for new_branch in "${new_branches[@]}"
do
	git checkout vfx/$new_branch || echo "branch vfx/$new_branch could not be created it doesn't merge automatically please use git merge vfx-import/$new_branch from vfx/main and fix the conflicts"
done

git remote add me git@gitlab.internal.unity3d.com:tristan/vfx-editor.git

$check="${0//merge/check}"

echo $check;

eval $check