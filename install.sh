#!/bin/bash

sudo apt install git curl -y

# Alacritty terminal
function alacritty() {
  sudo add-apt-repository ppa:mmstick76/alacritty -y
  sudo apt update
  sudo apt install alacritty wmctrl -y
  mkdir -p ~/.config/alacritty
  cp ./configs/alacritty.yml ~/.config/alacritty/alacritty.yml
}

# ZSH + oh-my-zsh
function zsh() {
  sudo apt install zsh -y
  cp ./configs/zshrc ~/.zshrc
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

alacritty
zsh
