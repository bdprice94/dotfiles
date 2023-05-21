#!/bin/bash
# Script for quickly setting up my vim developer configs on a new Linux system. Currently only known to work on Arch
set -e

if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
else
    echo "Error: Could not find OS" >&2 
    return -1
fi
if [[ $OS == "Arch Linux" ]]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm vim git github-cli zsh zsh-completions fzf ripgrep bat python base-devel tmux
    cd ~
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg --noconfirm -si
    
    yay -Y --noconfirm --gendb
    yay -Syu --noconfirm --devel
    yay -Y --noconfirm --devel --save
    yay -Syu --noconfirm 
    yay -S --noconfirm zsh-theme-powerlevel10k-git zsh-vi-mode nvm
    cd ~
    rm -rf yay
else
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y install gh zsh fzf ripgrep bat nodejs build-essential tmux 
    # Install nvm
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | zsh
fi

mkdir -p ~/.vim/undo
git clone https://github.com/bdprice94/dotfiles.git
ln dotfiles/vimrc ~/.vim/vimrc
ln dotfiles/.p10k.zsh ~/.p10k.zsh
ln dotfiles/.tmux.conf ~/.tmux.conf
ln dotfiles/.zshrc ~/.zshrc
# ln dotfiles/.vimspector.json ~/.vimspector.json

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
source ~/.zshrc 
nvm install node
if [[ $OS == "Ubuntu" ]]; then
    echo "Still need to install some zsh plugins"
fi
