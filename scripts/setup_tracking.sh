#!/usr/bin/env bash

link() {
  local target="$1" name="$2"
  if [ -L "$name" ]; then
    echo "skip: $name is already a symlink"
  elif [ -e "$name" ]; then
    echo "skip: $name exists and is not a symlink"
  else
    ln -s "$target" "$name"
    echo "linked: $name -> $target"
  fi
}

link ~/.config/hypr      ~/dotfiles/hypr
link ~/.config/alacritty ~/dotfiles/alacritty
link ~/.zshrc            ~/dotfiles/.zshrc
link ~/.zprofile         ~/dotfiles/.zprofile

pacman -Qqen > pkglist_repo.txt
pacman -Qqem > pkglist_aur.txt