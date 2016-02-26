#! /bin/zsh

## This script will output `git status`, add all the files, ask you for a commit message, and push to the current dir.

# This sets the user's 'scripts' directory. If you already have a place where you keep your scripts, set that desitnation as the value for the variable below. If you don't have a place for scripts yet, this will create a directory in your home dir and place quickpu.sh inside of it.
SCRIPTS_DIR='$HOME/.scripts'
mkdir -p "$HOME/$SCRIPTS_DIR"
if [ -e ./quickpu.sh ]; then
    mv quickpu.sh "$( echo $HOME/$SCRIPTS_DIR)"
fi

# This sets a 'qp' alias for quickpu.sh, if you don't already have an alias for 'qp'. If you do, you'll have to manually create an alias for quickpu.sh should you want to have one.
if [ "$(echo type qp )" = "qp not found" ]; then
    "alias qp='"$( echo $HOME/$SCRIPTS_DIR )"/quickpu.sh'" >> ~/.zshrc
fi

echo "$( git status )"
git add .
echo "Enter your commit message followed by [ENTER]:"
read commit
git commit -m "$(echo $commit)" 
git push
