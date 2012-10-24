#!/bin/sh

cd ~
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.gvimrc .gvimrc
ln -s dotfiles/.pryrc .pryrc
ln -s dotfiles/.bashrc .bashrc
ln -s dotfiles/.vim .vim
ln -s dotfiles/.tmux.conf .byobu/

mkdir vim_swap
mkdir vim_backup
mkdir .bundle
cd .bundle
git clone https://github.com/Shougo/neobundle.vim.git
