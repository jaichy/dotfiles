if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

source "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

i() {
    sudo pacman -S "$1" || yay -S "$1"
}

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/.zsh_functions
source ~/dotfiles/.zsh_alias
export PATH=$PATH:$(go env GOPATH)/bin


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/jayac/.bun/_bun" ] && source "/home/jayac/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ -s "/home/jayac/.gvm/scripts/gvm" ]] && source "/home/jayac/.gvm/scripts/gvm"
