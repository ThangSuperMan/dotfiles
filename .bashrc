# Alias
alias ll="exa -l -g --icons"
alias lla="ll -a"
alias v="nvim" 
alias c="clear" 
alias d="cd Developments" 
alias e="exit" 
alias d="docker"
alias fishes="asciiquarium"
# alias tn="tmux new -s (pwd | sed 's/.*\///g')"
alias ta="tmux attach"
alias tsk="tmux kill-server"

# Keybindings
bind '"\C-f":"cd_with_fzf\n"'
bind '"\C-d":"open_with_fzf\n"'
bind '"\C-v":"nvim\n"'

# Functions
tn() {
    tmux new -s "$(pwd | sed 's/.*\///g')"
}
open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}
cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}
pacs() {
    sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin $PATH"

# set -g GOPATH $HOME/go
# set -gx PATH $GOPATH/bin $PATH

# Load lanauges and plugin manager for itself
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
. "$HOME/.cargo/env"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(starship init bash)" # https://starship.rs/
eval "$(zoxide init bash)"   # 'ajeetdsouza/zoxide'
