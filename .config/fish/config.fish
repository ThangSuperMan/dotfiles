set fish_greeting ""

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias g git
alias study "ytfzf -t study with me"
alias p "cd Projects/"
alias n "cd notes/"
alias v "nvim"
alias tks "tmux kill-server"
alias pn "pnpm"
alias grm "go run main.go"
alias cpp "g++ -std=c++17 -o main main.cpp"
alias c "clear"
alias tn "tmux new -s (pwd | sed 's/.*\///g')"
alias ta "tmux attach"
alias myip "curl ifconfig.me"
alias nc "nc -z -vv"
alias ide "tmux split-window -v -p 30 && tmux split-window -h -p 64 && tmux split-window -h -p 50"
alias nv "cd $HOME/.config/nvim"
alias kms "cd ~/Developments/KMS"
alias dev "cd $HOME/Developments/"
alias downloads "cd $HOME/Downloads"
alias ip "ifconfig en0 | grep inet"
abbr --add \? duck
alias e "exit"
alias http "xh"
alias tf="terraform"

# Docker
alias dco="docker-compose"
alias dps "docker ps"
alias dpa "docker ps -a"
alias di "docker images"

# Kubernetes
alias kb 'kubectl'
alias kbc 'kubecolor'
alias kbaf 'kbc apply -f'
alias kbcf 'kbc create -f'
alias kbd='kb describe'
alias kbga 'kbc get all'
alias kbgd 'kbc get deployments'
alias kbgn 'kbc get nodes'
alias kbgs 'kbc get services'
alias kbgp 'kbc get pods'
 
# fisher install rstacruz/fish-asdf -> Make asdf loaded in fish shell 
# fisher install rstacruz/fish-asdf

# Setup asdf for node js
# asdf plugin-add nodejs
# asdf install nodejs 9.4.0

# set -x RUBY_CONFIGURE_OPTS "--with-zlib-dir=/opt/homebrew/opt/zlib --with-openssl-dir=/opt/homebrew/opt/openssl@1.1 --with-readline-dir=/opt/homebrew/opt/readline --with-libyaml-dir=/opt/homebrew/opt/libyaml"
# set -x RUBY_CFLAGS "-Wno-error=implicit-function-declaration"

# alias hs 'peco_select_history'

# set -Ux FZF_HISTORY --reverse --border rounded --no-info --pointer='' --marker=' ' --ansi --color='16,bg+:-1,gutter:-1,prompt:5,pointer:5,marker:6,border:4,label:4' --border-label=' history ' \
#        --prompt='  '

# function fish_user_key_bindings
#     bind \cr 'history --reverse | fzf-tmux -p 60%,40% $FZF_HISTORY | read -z -- __cmd; commandline -i $__cmd'
# end

# function peco_select_history
#   if test (count $argv) = 0
#     set peco_flags --layout=bottom-up
#   else
#     set peco_flags --layout=bottom-up --query "$argv"
#   end

#   history|peco $peco_flags|read foo

#   if [ $foo ]
#     commandline $foo
#   else
#     commandline ''
#   end
# end

# Path
fish_add_path /usr/bin/fish
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin

# set -Ux nvm_default_version 20.2.0

# Mysql
# fish_add_path /usr/local/mysql-8.0.32-macos13-arm64/bin

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Rust
set -gx PATH $HOME/.cargo/bin $PATH

# Flutter and dart
# set -gx PATH $HOME/opt/homebrew/bin/flutter

# Mysql
# set -x PATH ${PATH}:/usr/local/mysql-8.0.31-macos12-arm64/bin
# set -x PATH usr/local/mysql-8.0.31-macos12-arm64/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

set -x KIND_EXPERIMENTAL_PODMAN true

eval $(/opt/homebrew/bin/brew shellenv)

zoxide init fish | source # 'ajeetdsouza/zoxide'
starship init fish | source

# Ruby On Rails
# ENV variables for connect to Postgresql in with Rails
# set -xg APPNAME_DATABASE_PASSWORD "thanghandsome"
