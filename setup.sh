#!/bin/bash

# zsh
sudo apt install zsh --yes
sudo apt install tmux --yes
sudo apt install ranger --yes
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix --yes
sudo npm install --location=global pyright
zsh
while getopts ":s:" opt; do
  case $opt in
    s)
      # code to execute when installing dotfiles for first time
      git clone https://github.com/rkouskou/dotfiles.git
      cd dotfiles
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
       # getting tmux plugin manager
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
      cp .tmux.conf $HOME/
      cp .languages.toml $HOME/.config/helix/
      cp .config.toml $HOME/.config/helix/
      ;;
  esac
done
# Solve: bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
# sudo locale-gen en_US.UTF-8
# sudo update-locale LANG=en_US.UTF-8
# sudo update-locale LANGUAGE=en_US.UTF-8
# sudo update-locale LC_ALL=en_US.UTF-8

