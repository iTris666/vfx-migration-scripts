#!/bin/bash
set -e

readarray() {
  local i=0
  unset -v "$1"
  while IFS= read -r "$1[i++]"; do :; done
  eval "[[ \${$1[--i]} ]]" || unset "$1[i]"
}

#gettings branches to merge
readarray branches < branches.list
readarray new_branches < new_branches.list
let branchcount=${#branches[@]}-1
echo "$branchcount branches to process"

#vfxrepo="git@gitlab.internal.unity3d.com:steffeng/VFX-Editor-Proto.git"
vfxrepo="git@gitlab.internal.unity3d.com:steffeng/VFX-Editor-Proto.git"
interrepo="vfx-samples-inter"
finalrepo="vfx-samples-clean"

#prepare intermediate repo
rm -rf $interrepo
mkdir $interrepo
cd $interrepo
git init


#fetch all needed branches
for i in $(seq 0 $branchcount)
do
    branch=${branches[$i]}
    new_branch=${new_branches[$i]}
    git fetch $vfxrepo "${branch}_":"vfx-import/$new_branch"
done

#checkout the first branch and do some cleaning in all commits
git checkout "vfx-import/${new_branches[0]}"
git filter-branch --force --subdirectory-filter Assets/VFXSamples/ --prune-empty --tag-name-filter cat -- --all

#optimize repo
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now

#clone once again to get the most optimized repo possible.
cd ..
rm -rf $finalrepo
git clone $interrepo $finalrepo

