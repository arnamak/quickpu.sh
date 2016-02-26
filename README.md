## quickpu.sh

* A quick and simple shell script that allows for reckless git-ing. Automates git status, git add, git commit -m, and git push (to your current working branch) by simply running `qp` and entering a commit message.

* After running `qp` the next thing you see will be the output of `git status` and an interactive prompt for a commit message. All untracked files are added automatically, `status` serves as a reminder so you can better label your commit message. Once you hit enter your code has shipped.

### Prerequisites

* You will need to have your commandline git configured for 'simple' pushes rather than 'matching'.
* Low expectations. 

### Usage

* Grab the script and run from anywhere on your machine.
* First run will create an alias for `qp` (unless you already have one), and will create `~/.scripts`. If you already have a script dir, just change the variable at the top of the file with the home-less version of your path (e.g. if your scripts are in '~/Desktop/scripts', just change the var to 'Desktop/scripts', prepending the home dir would cause problems.)
* Remember to source your shell's rc file and then run `qp`.
* The shell will execute if you run `qp` from within any git repository, and once you enter your commit message it instantly pushes to your current branch. Be super mindful of which branch you're on when using quickpu.sh.

### Examples

* Running `qp` will display a color-less version of 'git status' (I'll add colors....later) and prompt you for a commit message.
* As soon as you hit 'enter' to save your commit message your changes will be pushed to whatever branch you're currently working from.
* Should you want to bail, the only place you can do it is before hitting enter to save your commit. 
* CTRL-C is your 'oh shit' button.

### Warnings

* I made this very much for my own personal use on my own projects, where I don't really care if I screw up a commit or two. I don't think even I would use this for work in a production environment. So, plz b careful.
