#!/bin/sh

cd ~
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.bashrc .bashrc
ln -s dotfiles/.vim .vim

mkdir vim_swap
mkdir vim_backup
mkdir .bundle
cd .bundle
git clone https://github.com/Shougo/neobundle.vim.git
