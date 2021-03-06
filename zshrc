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
alias lt="ls -lht"
alias lll="ls -lah"
alias llt="ls -laht"

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

# Convert excel csv/tsv files to unix
excel2unix() {
    if [[ $# < 1 ]]; then
        echo >&2 "usage: $0 <infile> [<outfile>]"
    elif [[ ! -f "$1" ]]; then
        echo >&2 "error: file or directory not found: $1"
    elif [[ $# > 1 && ! -d $(dirname "$2") ]]; then
        echo >&2 "error: file or directory not found: $2"
    fi

    if [[ $# == 1 ]]; then
        tr '\r' '\n' < "$1" | sed -e '$a\'
    else
        tr '\r' '\n' < "$1" | sed -e '$a\' > "$2"
    fi
}

# less options
export LESS='-giMRw -z-4'
alias lless='less -S'

# Autoload functions
autoload zmv

# Don't ask before overwriting files with redirection
setopt clobber

# Add home bin folder to path if it exists
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

# Add local settings if they exist
if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi

# Fix locale settings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_TIME=sv_SE.UTF-8

if [ -f "$HOME/.zshrc-local" ]; then
    source "$HOME/.zshrc-local"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}
