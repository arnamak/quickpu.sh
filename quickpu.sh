#! /bin/sh

## This script configures a script that will output `git status`, add all modified files, ask you for a commit message,
# and push to the current dir.

## This script executes a first-run configuration for quickpu.sh. 
# This includes creating a .scripts directory, creating a 'qp' alias if none already exists, and places only the bare
# script in your scripts dir. This file will be deleted upon completion.

# This sets the user's 'scripts' directory. If you already have a place where you keep your scripts, 
# set that desitnation as the value for the variable below. If you don't have a place for scripts yet,
# this will create a directory in your home dir and place quickpu.sh inside of it.
SCRIPTS_DIR='.scripts'
mkdir -p "$HOME/$SCRIPTS_DIR"
touch "$HOME/$SCRIPTS_DIR"/quickpu.sh
echo "`echo git status`\ngit add .\necho \"Enter your commit message followed by [ENTER]\"\nread commit\ngit commit -m \"\$(echo \$commit)\"\ngit push" > "$HOME/$SCRIPTS_DIR"/quickpu.sh

# This detects your shell, and saves the alias in the appropriate place. Bash and Zsh are supported
# Note for Bash: traditionally aliases are kept in their own file, .bash_aliases, which is automatically
# sourced by your .bash_profile if you have one. This will create the file if it doesn't exist. 
shell=`echo $SHELL`
if [ ${shell##*/} = "zsh" ]; then
         save_alias=".zshrc"
elif [ ${shell##*/} = "bash" ]; then
         save_alias=".bash_aliases"
    if [ ! -e "$HOME/$save_alias" ]; then
         touch "$HOME/$save_alias"
    fi
fi

# This sets a 'qp' alias for quickpu.sh, if you don't already have an alias for 'qp'.
# If you do, you'll have to manually create an alias for quickpu.sh should you want to have one.
if [ "$( grep -r "alias qp" "$HOME/$save_alias" )" ]; then
    echo alias already created
else
    echo "alias qp='sh "`echo $HOME/$SCRIPTS_DIR`"/quickpu.sh'" >> "$HOME/$save_alias"
fi

# Remember to source your .zshrc/.bash_aliases once the script runs.

# If first run is performed in a git repository, the bare script will run.
if [ -d .git ]; then
    sh "$HOME/$SCRIPTS_DIR"/quickpu.sh
fi

# Erases the first-run version of quickpu.sh and leaves only the bare script
current="$0"
rm ${current}
