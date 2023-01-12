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

ln -srf ${DOTFILE_PATH}/vimrc ${HOME}/.vimrc
ln -srf ${DOTFILE_PATH}/vim/ftplugin/* ${HOME}/.vim/ftplugin
ln -srf ${DOTFILE_PATH}/vim/ftdetect/* ${HOME}/.vim/ftdetect

# Install neovim config
if [ ! -d ${HOME}/.config/nvim ]; then
    mkdir -p ${HOME}/.config/nvim
fi

ln \
    -srf \
    ${DOTFILE_PATH}/nvim/{init.lua,lua,after,data} \
    ${HOME}/.config/nvim/

# Packer for neovim
if [ ! -d /home/nima18/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

if ! which pyright &>/dev/null; then
    echo >&2 "warning: pyright is not installed, install with npm"
fi

case $(basename "$SHELL") in
    bash)
        if [[ ! -d "$HOME/.oh-my-bash" ]]; then
            bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
        fi

        if [ -d "$HOME/.oh-my-bash/custom" ]; then
            mv $HOME/.oh-my-bash/custom{,-bkp$(date  +"%Y%m%d-%H%M%S")}
        fi
        ln -srf "${DOTFILE_PATH}/oh-my-bash/custom" "$HOME/.oh-my-bash/"

        if [ -f "$HOME/.bashrc" ]; then
            mv $HOME/.bashrc{,-bkp$(date +"%Y%m%d-%H%M%S")}
        fi
        ln -srf "${DOTFILE_PATH}/oh-my-bash/bashrc" "$HOME/.bashrc"
        ;;
esac
