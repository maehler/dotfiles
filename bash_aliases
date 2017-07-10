#!/bin/bash

# Useful aliases
alias ls='ls -G'
alias ll='ls -lh'
alias lla='ls -lha'
alias l='ls'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# gzipped files
alias zcat="gunzip -c"

# sublime text
alias subl="subl -n"

# tmux
alias tl="tmux ls"
alias ta="tmux attach"
alias ts="tmux switch"

# PHP web server
alias phpserve='php -S 127.0.0.1:8000 -t .'

# Sequence lengths in fasta file
alias fastalen="awk '/^>/ { if (seqlen) { print seqlen }; printf(\'%s\t\', substr($0, 2)); seqlen = 0; next; } { seqlen = seqlen + length($0) } END { print seqlen }'"
