#!/bin/sh
current_branch_name=$(git symbolic-ref --short -q HEAD)
branch_name_list=(master release_candidate dev edge)
git fetch

for branch_name in ${branch_name_list[@]}
do
    git branch -D $branch_name
    git checkout -t origin/$branch_name
done
