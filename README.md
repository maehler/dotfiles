# My dotfiles

## Terminal emulator

On Mac I use [iTerm2](https://www.iterm2.com/) with the Solarized Dark theme from the [iterm2colorschemes](http://iterm2colorschemes.com/) website.

## zsh

My preferred shell is zsh. If it's not installed, I stick with bash.

    chsh -s /usr/bin/zsh

### prezto

For the default zsh settings I use [prezto](https://github.com/sorin-ionescu/prezto).

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

## vim

For managing vim packages, I use [Vundle](https://github.com/VundleVim/Vundle.vim). For this to work with the existing .vimrc file, use this command for installation:

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
