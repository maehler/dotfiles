export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/git/dotfiles/oh-my-posh/maehler.toml)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
