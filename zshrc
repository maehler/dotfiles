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

alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias stt="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."

alias rm="nocorrect rm"

# Pretty viewing of tab delimited files
tless() {
    column -t "$1" | less
}

# less options
export LESS='-giMRSw -z-4'

# Autoload functions
autoload zmv

# Don't ask before overwriting files with redirection
setopt clobber
