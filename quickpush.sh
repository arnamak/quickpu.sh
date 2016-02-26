#! /bin/zsh

## This script will output `git status`, add all the files, ask you for a commit message, and push to the current dir.

git_status=`git status`
echo $git_status
git add .
echo "Enter your commit message followed by [ENTER]:"
read commit
git commit -m "$(echo $commit)" 
git push
