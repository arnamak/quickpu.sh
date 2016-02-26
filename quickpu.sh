#! /bin/zsh -xv

## This script will output `git status`, add all the files, ask you for a commit message, and push to the current dir.

# This sets the user's 'scripts' directory. If you already have a place where you keep your scripts, 
# set that desitnation as the value for the variable below. If you don't have a place for scripts yet,
# this will create a directory in your home dir and place quickpu.sh inside of it.
SCRIPTS_DIR='.scripts'
mkdir -p "$HOME/$SCRIPTS_DIR"
touch "$HOME/$SCRIPTS_DIR"/quickpu.sh
echo "`echo git status`\ngit add .\necho \"Enter your commit message followed by [ENTER]\"\nread commit\ngit commit -m \"\$(echo \$commit)\"\ngit push" > "$HOME/$SCRIPTS_DIR"/quickpu.sh

# This sets a 'qp' alias for quickpu.sh, if you don't already have an alias for 'qp'.
# If you do, you'll have to manually create an alias for quickpu.sh should you want to have one.
# If you use a different shell simply change the two following instances of '~/.zshrc' to 
# whatever you want.
if [ "$( grep -r "alias qp" ~/.zshrc )" ]; then
    echo alias already created
else
    echo "alias qp='sh "`echo $HOME/$SCRIPTS_DIR`"/quickpu.sh'" >> ~/.zshrc
fi
# Remember to source your .zshrc once the alias has been created.

# If first run is performed in a git repository, the bare script will run.
if [ -d .git ]; then
    sh "$HOME/$SCRIPTS_DIR"/quickpu.sh
fi

# Erases the first-run version of quickpu.sh and leaves only the bare script
current="$0"
shred -u ${current}
