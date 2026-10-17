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
    sudo pacman -Sy "$1" || yay -Sy "$1"
}

source $ZSH/oh-my-zsh.sh


alias ff=fastfetch

alias gor="go run ."
alias got="go mod tidy"
alias gof="go fmt ./..."
alias gop="code ~/codebases/go-playground"
alias gob="go test -benchmem -cpuprofile=cpu.out -memprofile=mem.out ./..."

alias prog="cd ~/codebases"
alias school="cd ~/codebases/school"
alias jpi="bun install --force"
alias jpr="bun run dev"

alias dotfiles="code ~/dotfiles"

alias dop="doppler run"
alias dopp="doppler run --config prod"

alias cat="bat --style=plain --paging=never"

alias cl="clear"

alias gs="git switch -"
alias h="cd ~"
alias u="sudo pacman -Syu && yay -Syu"

export PATH=$PATH:$(go env GOPATH)/bin



alias ls='lsd'
alias ll='lsd -al'
alias la='lsd -a'
alias lt='lsd --tree'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
