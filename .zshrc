if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export PATH="/Users/jayac/.bun/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""


zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nano'
# else
#   export EDITOR='nano'
# fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

alias ll="lsd -al"
alias ls="lsd -l"
alias ff=fastfetch

alias gor="go run ."
alias got="go mod tidy"
alias gof="go fmt ./..."
alias gop="code ~/codebases/go-playground"

alias prog="cd ~/codebases"
alias school="cd ~/codebases/school"
alias jpi="bun install --force"
alias jpr="bun run dev"
alias ghelp="cat ~/git_help.txt"
alias dotfiles="code ~/dotfiles"
alias dop="doppler run"
alias dopp="doppler run --config prod"
alias cat="bat --style=plain --paging=never"

export PATH=$PATH:$(go env GOPATH)/bin



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Created by `pipx` on 2025-09-26 18:33:38
export PATH="$PATH:/Users/jayac/.local/bin"

export TERM="xterm-256color"

[[ -s "/Users/jayac/.gvm/scripts/gvm" ]] && source "/Users/jayac/.gvm/scripts/gvm"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh

autoload -Uz compinit
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
compinit

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

