#!/bin/bash

cd "$(dirname "$0")"

sudo apt install git curl -y

function alacritty() {
  sudo add-apt-repository ppa:mmstick76/alacritty -y
  sudo apt update
  sudo apt install alacritty wmctrl -y
  mkdir -p ~/.config/alacritty
  cp ./configs/alacritty.yml ~/.config/alacritty/alacritty.yml
}

function zsh() {
  sudo apt install zsh -y
  cp ./configs/zshrc ~/.zshrc
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

function neovim() {
  sudo apt install neovim python3-neovim -y
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.cache/dein
  rm -rf installer.sh
  mkdir -p ~/.config/nvim
  cp ./configs/init.vim ~/.config/nvim/init.vim
}

alacritty; zsh; neovim;
