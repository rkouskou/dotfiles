#!/bin/bash

basics(){
  sudo apt install zsh --yes
  sudo apt install tmux --yes
  sudo apt install ranger --yes
  sudo add-apt-repository ppa:maveonair/helix-editor
  sudo apt update
  sudo apt install helix --yes
  sudo npm install --location=global pyright
  echo "Testing to see if 2"
}

scratch(){
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cp .tmux.conf $HOME
  mkdir $HOME/.config/helix
  cp languages.toml $HOME/.config/helix/
  cp config.toml $HOME/.config/helix/
}

while getopts "rs" OPTION; do
  case "$OPTION" in
    s)
        basics
        scratch
        ;;
    r) 
        basics
        ;; 
  esac
done
