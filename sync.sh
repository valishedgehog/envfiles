#!/bin/bash

cd "$(dirname "$0")"

cp ~/.config/alacritty/alacritty.yml ./configs/alacritty.yml
cp ~/.zshrc ./configs/zshrc
cp ~/.config/nvim/init.vim ./configs/init.vim

