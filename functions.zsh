dotsync() {
  local prevwd=$PWD
  cd ~/dotfiles || return 1

  ~/dotfiles/scripts/setup_tracking.sh &&
  git add . &&
  git commit -m "update" &&
  git push

  cd "$prevwd"
}

i() {
    sudo pacman -Sy "$1" || yay -Sy "$1"
}
