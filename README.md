###quickpush

A quick and simple shell script that takes you directly to the commit step, and pushes to your current branch automatically

## Prerequisites

* You will need to have your commandline git configured for 'simple' pushes rather than 'matching'
* Low expectations. 

## Usage

* Simply toss the script into your working dir and run `./shortpush.sh`
* That's too many keystrokes though, so I might recommend creating an alias in your.zshrc (or bash, or fish, or whatever) 
`alias qp='./quickpush.sh`
* Remember to source your shell's rc file and then run `qp`

## Examples

* Running `qp` will display a color-less version of 'git status' (I'll add colors....later) and prompt you for a commit message.
* As soon as you hit 'enter' to save your commit message your changes will be pushed to whatever branch you're currently working from
* Should you want to bail, the only place you can do it is before hitting enter to save your commit. 

## Warnings

* I made this very much for my own personal use on my own projects, where I don't care about playing it fast and loose with my changes. 
...if someone were to use this at work...well, be careful with that. 

* By using this you are saying to yourself "Fuck it, add everything, commit it, and push idgaf". That just happens to be my exact mentality.
