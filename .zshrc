if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"


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
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

alias ll="lsd -al"
alias ls="lsd -l"
alias ff=fastfetch
alias gor="go run ."
alias got="go mod tidy"
alias gof="go fmt ./..."
alias npi="pnpm install --force"
alias npr="pnpm run dev"
alias gop="code ~/go-playground"

export PATH=$PATH:$(go env GOPATH)/bin



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Created by `pipx` on 2025-09-26 18:33:38
export PATH="$PATH:/Users/jayac/.local/bin"
