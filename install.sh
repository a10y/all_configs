#!/bin/bash

set -x
set -e -o pipefail

echo 'Installing the submodules...'
git submodule init && git submodule

echo 'Setting up symlinks...'

# Tmux
ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf

# Vim
ln -s ${PWD}/vim ${HOME}/.vim
ln -s ${PWD}/vimrc ${HOME}/.vimrc

echo 'Installing vim plugins'
vim -c ":PluginInstall"

echo 'All done!'
