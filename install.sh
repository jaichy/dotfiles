#!/usr/bin/env bash
set -euo pipefail

DFD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
CONFIG_DIRS=(hypr alacritty)

log() { printf '\n==> %s\n' "$*"; }

# --- Packages ---------------------------------------------------------------
install_packages() {
  log "Installing packages"
  sudo pacman -S --needed - < "$DFD/pkglist_repo.txt"
  yay -S --needed - < "$DFD/pkglist_aur.txt"
}

# --- oh-my-zsh + plugins ----------------------------------------------------
setup_ohmyzsh() {
  log "Setting up oh-my-zsh"
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  local custom="$HOME/.oh-my-zsh/custom"
  clone() { [ -d "$2" ] || git clone --depth=1 "$1" "$2"; }

  clone https://github.com/romkatv/powerlevel10k.git "$custom/themes/powerlevel10k"
  clone https://github.com/zsh-users/zsh-autosuggestions "$custom/plugins/zsh-autosuggestions"
  clone https://github.com/zsh-users/zsh-syntax-highlighting "$custom/plugins/zsh-syntax-highlighting"
}

# --- Single dotfiles (zshrc, p10k) ------------------------------------------
copy_file() {
  local src="$DFD/$1" dest="$2"
  if [ ! -f "$src" ]; then
    echo "Skipping $1: not in repo"
    return
  fi
  if [ -f "$dest" ]; then
    cp "$dest" "$dest.bak-$STAMP"
  fi
  cp "$src" "$dest"
}

# --- Config directories -----------------------------------------------------
sync_dir() {
  local name="$1"
  if [ ! -d "$DFD/$name" ]; then
    echo "Skipping $name: not in repo"
    return
  fi
  mkdir -p "$HOME/.config/$name"
  rsync -a --backup --backup-dir="$HOME/.config/$name-backup-$STAMP" \
    "$DFD/$name/" "$HOME/.config/$name/"
}

install_packages
setup_ohmyzsh

log "Copying dotfiles"
copy_file zshrc "$HOME/.zshrc"
copy_file p10k.zsh "$HOME/.p10k.zsh"

log "Copying config directories"
for dir in "${CONFIG_DIRS[@]}"; do
  echo "-> $dir"
  sync_dir "$dir"
done

log "Done. Backups (if anything was overwritten) are tagged $STAMP"