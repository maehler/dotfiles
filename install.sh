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

cp ${DOTFILE_PATH}/vimrc ${HOME}/.vimrc
cp ${DOTFILE_PATH}/vim/ftplugin/* ${HOME}/.vim/ftplugin
cp ${DOTFILE_PATH}/vim/ftdetect/* ${HOME}/.vim/ftdetect

