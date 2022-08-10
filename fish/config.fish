# Basic config
set fish_greeting""

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# fish_add_path /opt/homebrew/bin/

# function fish_user_key_bindings
#   bind \c] peco_select_ghq      # Ctrl-]
#   bind \cr peco_select_history  # Ctrl-r
#   bind \cj peco_select_z        # Ctrl-j
#   bind \cf peco_change_directory     # Ctrl-f
# end

# Setup for go
alias gr='go run'
alias e='exit'
alias cls='clear'
alias v='nvim'
alias ide "tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50"
alias g "git"
alias p "cd Projects"
alias tks 'tmux kill-server'
alias tmux-reload 'tmux source ~/.tmux.conf'

# React native fix error router
alias config='export NODE_OPTIONS=--openssl-legacy-provider' 

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Ruby 
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
set -gx PATH $PATH:$HOME/.rvm/bin
