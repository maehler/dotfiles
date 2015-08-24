#!/bin/bash

# Useful aliases
alias ll='ls -lh'
alias lla='ls -lha'
alias l='ls'
alias aas='ssh niklasm@128.39.191.147'
alias polaris='ssh niklasm@128.39.181.221'
alias binero='ssh 114615_master@ssh.binero.se'
alias maldini='ssh -p922 niklas@130.239.72.5'
alias picea='ssh -p 922 niklasm@picea.plantphys.umu.se'
alias watson='ssh -p922 niklasm@watson.plantphys.umu.se'
alias spruce='ssh -p 922 -i ~/.ssh/spruce_rsa niklasm@spruce.plantphys.umu.se'
alias aspseq='ssh -p 922 -i ~/.ssh/aspseq_rsa niklasm@aspseq.fysbot.umu.se'
alias kalkyl='ssh niklasm@kalkyl.uppmax.uu.se'
alias kalkyl1='ssh niklasm@kalkyl1.uppmax.uu.se'
alias Rscript64='Rscript --arch=x86_64'
alias grep='grep --color=auto'
alias acheck='/usr/sbin/httpd -t'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

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
