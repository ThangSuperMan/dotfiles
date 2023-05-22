set fish_greeting ""

# set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Turn on vim mode
# Run fish_vi_key_bindings to start vi mode
# Run fish_default_key_bindings to go back to default mode

# aliases
alias ll "exa -l -g --icons"
alias lla "ll -a"
alias g git
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
alias d "cd Developments"
alias nc "nc -z -vv"
alias ide "tmux split-window -v -p 30 && tmux split-window -h -p 64 && tmux split-window -h -p 50"
alias urls "echo https://youtube.com \nhttps://github.com/thangsuperman \nhttps://deno.com/manual@v1.32.5/introduction \nhttps://www.oxfordlearnersdictionaries.com"
alias path "PATH"
abbr --add \? duck
alias e "exit"
alias http "xh"
# study stream aliases
alias work "echo 'we are working 🎅' | lolcat && timer 25m"
# alias break "echo 'happy break time! ⛄' | lolcat && timer 10m"

# Docker
alias dco="docker-compose"
alias de="docker exec"
alias dr="docker run"
alias dsh="docker exec -it `$(docker ps -q)` bash"
alias dshalpine="docker exec -it $(docker ps -q) /bin/sh"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dl="docker ps -l -q"

set -Ux FZF_HISTORY --reverse --border rounded --no-info --pointer='' --marker=' ' --ansi --color='16,bg+:-1,gutter:-1,prompt:5,pointer:5,marker:6,border:4,label:4' --border-label=' history ' \
       --prompt='  '

function fish_user_key_bindings
    bind \cr 'history --reverse | fzf-tmux -p 40%,40% $FZF_HISTORY | read -z -- __cmd; commandline -i $__cmd'
end

# Path
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin

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
set -x PATH usr/local/mysql-8.0.31-macos12-arm64/bin $PATH

alias thanos quiteAppByName 

function quiteAppByName --description="Quite any application based on its name"  
  killall $argv[1] 
end

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
zoxide init fish | source # 'ajeetdsouza/zoxide'
starship init fish | source # 'ajeetdsouza/zoxide'
