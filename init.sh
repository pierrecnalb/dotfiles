#!/bin/bash

ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
