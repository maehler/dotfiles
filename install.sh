#!/bin/bash -l

set -eu

# Get script directory: http://stackoverflow.com/a/246128/885443
DOTFILE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Add git aliases to ~/.gitconfig
if [ ! -e "$HOME/.gitconfig" ] || \
        ! grep -q "path \= .*gitconfig\.alias$" "$HOME/.gitconfig"; then
    echo "[include]" >> "$HOME/.gitconfig"
    printf "\t%s\n" "path = ${DOTFILE_PATH}/gitconfig.alias" >> \
        "${HOME}/.gitconfig"
fi

# alacritty
# For alacritty to be configured, then the alacritty config directory has
# to exist. If it doesn't, then the config will be installed.
if [ -d ${HOME}/.config/alacritty ]; then
    ln -sf ${DOTFILE_PATH}/alacritty/alacritty.toml ${HOME}/.config/alacritty/
fi

# tmux config
ln -sf ${DOTFILE_PATH}/tmux/tmux.conf ${HOME}/.tmux.conf

# Install vim config
if [ -f ${HOME}/.vimrc ]; then
	mv ${HOME}/.vimrc{,-bkp}
fi

if [ ! -d ${HOME}/.vim ]; then
	mkdir ${HOME}/.vim
fi

if [ ! -d ${HOME}/.vim/ftplugin ]; then
	mkdir ${HOME}/.vim/ftplugin
fi

if [ ! -d ${HOME}/.vim/ftdetect ]; then
	mkdir ${HOME}/.vim/ftdetect
fi

ln -sf ${DOTFILE_PATH}/vimrc ${HOME}/.vimrc
ln -sf ${DOTFILE_PATH}/vim/ftplugin/* ${HOME}/.vim/ftplugin
ln -sf ${DOTFILE_PATH}/vim/ftdetect/* ${HOME}/.vim/ftdetect

# Install neovim config
# If there already is a neovim config directory, back it up and replace with a symlink.
if [ -d ${HOME}/.config/nvim ]; then
    mv ${HOME}/.config/nvim ${HOME}/.config/nvim-bkp
fi

ln -s ${DOTFILE_PATH}/nvim ${HOME}/.config/nvim

# Packer for neovim
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Install oh-my-posh
if ! type oh-my-posh &> /dev/null; then
    mkdir -p ${HOME}/.local
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ${HOME}/.local/bin
fi

case $(basename "$SHELL") in
    bash)
        if [[ ! -d "$HOME/.oh-my-bash" ]]; then
            bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
        fi

        if [ -d "$HOME/.oh-my-bash/custom" ]; then
            mv $HOME/.oh-my-bash/custom{,-bkp$(date  +"%Y%m%d-%H%M%S")}
        fi
        ln -sf "${DOTFILE_PATH}/oh-my-bash/custom" "$HOME/.oh-my-bash/"

        if [ -f "$HOME/.bashrc" ]; then
            mv $HOME/.bashrc{,-bkp$(date +"%Y%m%d-%H%M%S")}
        fi
        ln -sf "${DOTFILE_PATH}/oh-my-bash/bashrc" "$HOME/.bashrc"
        ;;
    zsh)
        if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        fi
        ln -sf "${DOTFILE_PATH}/zshrc" "$HOME/.zshrc"
        ;;
esac

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Node version manager
if [ -z ${NVM_DIR-} ]; then
    curl -Lo- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi

exec $SHELL
