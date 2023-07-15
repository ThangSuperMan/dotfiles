# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

function thanos(){
    kill -9 $(lsof -t -i:$1)
}

alias vi=nvim
alias thanos=thanos
alias \?=duck

# aliases
alias ll="exa -l -g --icons"
alias lla="ll -a"
alias g=git
alias study="ytfzf -t study with me"
alias v="nvim"
alias tks="tmux kill-server"
alias grm="go run main.go"
alias c="clear"
alias tn="tmux new -s \$(pwd | sed 's/.*\///g')"
alias ta="tmux attach"
alias nc="nc -z -vv"
alias ide="tmux split-window -v -p 30 && tmux split-window -h -p 64 && tmux split-window -h -p 50"
alias nv="cd $HOME/.config/nvim"
alias dev="cd $HOME/Developments/"
alias downloads="cd $HOME/Downloads"
alias ip="ifconfig en0 | grep inet"
alias hs="atuin search"
alias e="exit"

# Docker
alias dco="docker-compose"
alias dps= "docker ps"
alias dpa="docker ps -a"
alias di="docker images"

# Kubernetes
alias kb='kubectl'
alias kbc='kubecolor'
alias kbaf='kbc apply -f'
alias kbd='kb describe'
alias kbga='kbc get all'
alias kbgd='kbc get deployments'
alias kbgn='kbc get nodes'
alias kbgs='kbc get services'
alias kbgp='kbc get pods'

# Plugins
plugins=(
    alias-tips
    autoupdate
    dnf
    fzf-alias
    colored-man-pages
    sudo
    fzf-tab
    git
    golang
    jfrog
    notify
    tmux
    npm
    vi-mode
    vscode
    zsh-256color
    zsh-autosuggestions
    zsh-better-npm-completion
    zsh-secrets
    zsh-syntax-highlighting
)

# source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
# source /Users/thangphan/.config/broot/launcher/bash/br

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
[[ -s "/opt/homebrew/opt/rvm/scripts/rvm" ]] && . "/opt/homebrew/opt/rvm/scripts/rvm"

exec fish
