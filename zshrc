#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export EDITOR="vim"
export VISUAL="vim"

alias l="ls"
alias ll="ls -lh"
alias lll="ls -lah"

alias rm="nocorrect rm"

if [[ $(uname) == "Darwin" ]]; then
    alias zcat="gunzip -c"
fi

alias ..="cd .."
alias ...="cd ../.."

alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias stt="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."

ql() {
    qlmanage -p "$1" >& /dev/null
}

unsetopt CORRECT

# Pretty viewing of tab delimited files
tless() {
    column -t "$1" | less
}

# md5 function with output that matches md5sum
if ! type md5sum >/dev/null 2>&1 && type md5 >/dev/null 2>&1; then
    md5sum() {
        md5 -r $@ | awk '{sub(" +", "  "); print $0}'
    }
fi

# less options
export LESS='-giMRSw -z-4'

# Autoload functions
autoload zmv

# Don't ask before overwriting files with redirection
setopt clobber

# Add home bin folder to path if it exists
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

# Load python's virtualenvwrapper if it exists
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    source "/usr/local/bin/virtualenvwrapper.sh"
fi

# Add local settings if they exist
if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi
