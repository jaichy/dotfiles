#!/usr/bin/env bash

copy() {
  local src="$1" dst="$2"
  if [ ! -e "$src" ]; then
    echo "skip: $src does not exist"
    return
  fi
  rm -rf -- "$dst"
  cp -a "$src" "$dst"
  echo "copied: $src -> $dst"
}

copy ~/.config/hypr      ~/dotfiles/hypr
copy ~/.config/alacritty ~/dotfiles/alacritty
copy ~/.zshrc            ~/dotfiles/.zshrc
copy ~/.zprofile         ~/dotfiles/.zprofile
copy ~/.config/fuzzel    ~/dotfiles/fuzzel

pacman -Qqen > ~/dotfiles/pkglist_repo.txt
pacman -Qqem > ~/dotfiles/pkglist_aur.txt