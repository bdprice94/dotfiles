#!/bin/sh

set -e

read -p "Did you make sure all changes are handled? (Y/n)"

if [[ $REPLY =~ ^[^Yy]$ ]]; then
    echo "Well then go do that!"
    return 1
fi

pushd ~/dotfiles
git pull origin main

ZSH_LOC=~/.zshrc
P10k_LOC=~/.p10k.zsh
TMUX_LOC=~/.tmux.conf
VIM_LOC=~/.vim/vimrc
COC_LOC=~/.vim/coc-settings.json

rm $ZSH_LOC
rm $P10k_LOC
rm $TMUX_LOC
rm $VIM_LOC
rm $COC_LOC

ln .zshrc $ZSH_LOC
ln .p10k.zsh $P10k_LOC
ln .tmux.conf $TMUX_LOC
ln vimrc $VIM_LOC
ln coc-settings.json $COC_LOC

popd
