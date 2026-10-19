#!/usr/bin/env bash
set -euo pipefail

# --- prerequisites ---
sudo pacman -S --needed --noconfirm git base-devel curl zsh

# --- install yay ---
if ! command -v yay >/dev/null 2>&1; then
  tmp="$(mktemp -d)"
  git clone https://aur.archlinux.org/yay.git "$tmp/yay"
  (cd "$tmp/yay" && makepkg -si --noconfirm)
  rm -rf "$tmp"
fi

# --- install oh-my-zsh (must come first: its installer aborts if ~/.oh-my-zsh already exists) ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# --- theme + plugins ---
[ -d "$ZSH_CUSTOM/themes/powerlevel10k" ] || \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# --- enable them in ~/.zshrc (sourcing the theme in this script does nothing) ---
[ -f "$HOME/.zshrc" ] || cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' "$HOME/.zshrc"
sed -i 's|^plugins=.*|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|' "$HOME/.zshrc"

# --- make zsh the default shell ---
[ "$(basename "$SHELL")" = "zsh" ] || chsh -s "$(command -v zsh)"

# =====================================================================
# Dotfiles: alacritty, fuzzel, hypr (+ package lists)
# Set DOTFILES_REPO to your repo URL, or put the dotfiles in $DOTFILES_DIR already.
#   DOTFILES_REPO=https://github.com/you/dotfiles.git ./setup.sh
# =====================================================================
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
DOTFILES_REPO="${DOTFILES_REPO:-}"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

if [ ! -d "$DOTFILES_DIR" ]; then
  if [ -n "$DOTFILES_REPO" ]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  else
    echo "No dotfiles found at $DOTFILES_DIR and DOTFILES_REPO is not set; skipping dotfiles." >&2
    echo "Done (zsh only). Log out and back in, or run: exec zsh"
    exit 0
  fi
fi

# --- packages: use your lists if present, otherwise a minimal set ---
strip_list() { grep -v -e '^[[:space:]]*#' -e '^[[:space:]]*$' "$1"; }

if [ -f "$DOTFILES_DIR/pkglist_repo.txt" ]; then
  strip_list "$DOTFILES_DIR/pkglist_repo.txt" | sudo pacman -S --needed --noconfirm -
else
  sudo pacman -S --needed --noconfirm hyprland hypridle hyprlock hyprpaper alacritty fuzzel
fi

if [ -f "$DOTFILES_DIR/pkglist_aur.txt" ]; then
  strip_list "$DOTFILES_DIR/pkglist_aur.txt" | xargs -r yay -S --needed --noconfirm
fi

# --- link configs into ~/.config (existing ones are backed up, not deleted) ---
mkdir -p "$CONFIG_DIR"
stamp="$(date +%Y%m%d-%H%M%S)"
for name in alacritty fuzzel hypr; do
  src="$DOTFILES_DIR/$name"
  dest="$CONFIG_DIR/$name"
  [ -d "$src" ] || { echo "skip: $src not found" >&2; continue; }
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ] && continue
    mv "$dest" "$dest.bak.$stamp"
  fi
  ln -s "$src" "$dest"
done

# --- zsh aliases + functions: source them from ~/.zshrc (added once, marker-guarded) ---
if ! grep -q '# >>> dotfiles zsh >>>' "$HOME/.zshrc"; then
  cat >> "$HOME/.zshrc" <<EOF

# >>> dotfiles zsh >>>
[ -f "$DOTFILES_DIR/alias.zsh" ] && source "$DOTFILES_DIR/alias.zsh"
[ -f "$DOTFILES_DIR/functions.zsh" ] && source "$DOTFILES_DIR/functions.zsh"
# <<< dotfiles zsh <<<
EOF
fi

# scripts/ is made executable but NOT run (setup_tracking.sh: run it yourself if you want it)
[ -d "$DOTFILES_DIR/scripts" ] && chmod +x "$DOTFILES_DIR"/scripts/*.sh

echo "Done. Log out and back in, or run: exec zsh. Then start Hyprland."