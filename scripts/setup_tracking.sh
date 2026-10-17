#!/usr/bin/env bash

ln -s ~/.config/hypr ~/dotfiles/hypr
ln -s ~/.config/alacritty ~/dotfiles/alacritty
ln -s ~/.zshrc  ~/dotfiles/.zshrc
ln -s ~/.zprofile  ~/dotfiles/.zprofile
pacman -Qqen > pkglist_repo.txt
pacman -Qqem > pkglist_aur.txt