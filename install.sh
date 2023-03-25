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

# tmux config
if [ -f ${HOME}/.tmux.conf ]; then
    mv ${HOME}/.tmux.conf{,-bkp}
fi
ln -sf ${DOTFILE_PATH}/tmux.conf ${HOME}/.tmux.conf

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
if [ ! -d ${HOME}/.config/nvim ]; then
    mkdir -p ${HOME}/.config/nvim
fi

ln \
    -sf \
    ${DOTFILE_PATH}/nvim/{init.lua,lua,after,data} \
    ${HOME}/.config/nvim/

# Packer for neovim
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim
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
esac

# Node version manager
if [ -z ${NVM_DIR-} ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi
