#!/bin/bash

## Basic setup
sudo apt update && sudo apt upgrade
sudo apt-get dist-upgrade
sudo apt install curl gnome-shell-extension-manager

## Optionals (did not tested yet to install via snap)
sudo snap install code --classic
sudo snap install remmina
sudo snap install direnv
sudo snap install keepassxc

## Install Twingate
curl -s https://binaries.twingate.com/client/linux/install.sh | sudo bash
twingate setup
twingate desktop-start
twingate stop
twingate start

## Setup Nix home-manager
mkdir -p ~/.config/home-manager
cp ./flake.nix ~/.config/home-manager
cp ./home.nix ~/.config/home-manager

sh <(curl -L https://nixos.org/nix/install) --no-daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

## Configure Nix
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

## Install flake
nix run home-manager/master -- init --switch

## Configure nix-direnv
mkdir -p ~/.config/direnv
echo 'source ~/.nix-profile/share/nix-direnv/direnvrc' > ~/.config/direnv/direnvrc

## Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Create app directory for maturin
mkdir /app
sudo chmod -R 777 /app





## Set Zsh as default shell
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

## Set secrets
# TODO: Add your secrets to ~/.config/home-manager/.exports.*

## Finish setup
source ~/.zshrc
echo "Updating home-manager nixpkgs..."
up
echo "Installing packages..."
hm