#!/bin/bash

set -x
set -e -o pipefail

echo 'Installing the submodules...'
git submodule init && git submodule

echo 'Setting up symlinks...'

# Tmux
ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf

echo 'All done!'
