#!/bin/sh

cd ~
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.bashrc .bashrc
ln -s dotfiles/.vim .vim

mkdir vim_swap
mkdir vim_backup
