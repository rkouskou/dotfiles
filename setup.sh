#!/bin/bash

basics(){
  # installing basic libs
  echo "Installing zsh, tmux, ranger, helix and pyright"
  sudo apt install zsh --yes
  sudo apt install tmux --yes
  sudo apt install ranger --yes
  sudo apt install ncdu --yes
  sudo add-apt-repository ppa:maveonair/helix-editor
  sudo apt update
  sudo apt install helix --yes
  sudo npm install --location=global pyright
}

scratch(){
  echo "Installing personalised libs for zsh, tmux and helix"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cp .tmux.conf $HOME
  mkdir $HOME/.config/helix
  cp languages.toml $HOME/.config/helix/
  cp config.toml $HOME/.config/helix/
}

while getopts "rs:h" OPTION; do
  case "$OPTION" in
    s)
        echo "Installing personalised libs on a new Linux instance"
        basics
        scratch
        ;;
    r) 
        echo "Reparing installed libs"
        basics
        ;;
    h) 
        echo "Script options: [-r] repair installation, [-s] install from scratch"
        ;; 
  esac
done
