# Created by newuser for 5.9
#
# Created by newuser for 5.9

# export ZDOTDIR=$HOME/.config/zsh
# source "$HOME/.config/zsh/.zshrc"
#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

export TERM=xterm-256color

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Alias 
alias v='nvim'
alias e='exit'
alias g='git'
alias ls='ls --color=auto'
alias cls='clear'
alias config='nvim ~/.config/nvim/init.vim'
alias gr='go run'
alias ideh="tmux split-window -h -p 80"
alias ide="tmux split-window -v -p 25 && tmux split-window -h -p 80"
alias tks='tmux kill-server'
alias web='cd ~/dev/web/'

# Require the ImageMatrick for display the image inside 
# the kitty emulator terminal
alias image='kitty +kitten icat'

# Hightlight on tab
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist

## autoload vcs and colors
# autoload -Uz vcs_info
autoload -U colors && colors

# github
autoload -Uz vcs_info
# precmd() { vcs_info }

# enable only git 
zstyle ':vcs_info:*' enable git

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"


# format our main prompt for hostname current folder, and permissions.
# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}jenny%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}thang%{$fg[red]%}@%{$fg[white]%}jenny%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "
# TODO look into this for more colors
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# also ascii escape codes



# PROMPT='%(?.%F{blue}√.%F{red}?%?)%f %B%F{240}%1~%f%b'
# format our main prompt for hostname current folder, and permissions.
# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%} "
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
# PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f %# '

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
# source "$ZDOTDIR/zsh-functions"

# # Normal files to source
# zsh_add_file "zsh-exports"
# zsh_add_file "zsh-vim-mode"
# zsh_add_file "zsh-aliases"
# zsh_add_file "zsh-prompt"

# # Plugins
# zsh_add_plugin "zsh-users/zsh-autosuggestions"
# zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
# zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_completion "esc/conda-zsh-completion" false
# # For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# # More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# TODO Remove these
# Make CapsLock behave like Ctrl
# setxkbmap -option ctrl:nocaps

# Make CapsLock behave like Ctrl
# setxkbmap -option ctrl:swapcaps

# Speedy keys
# xset r rate 210 40

# Environment variables set everywhere
export EDITOR="nvim"
# export TERMINAL="alacritty"
# export BROWSER="brave"

# For QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct

# remap caps to escape
# setxkbmap -option caps:escape
# swap escape and caps
# setxkbmap -option caps:swapescape

# vim mode config
# ---------------

# Activate vim mode.
# bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
 function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select

    # Use beam shape cursor on startup.
    echo -ne '\e[5 q'

    # Use beam shape cursor for each new prompt.
    preexec() {
       echo -ne '\e[5 q'
    }

# Use vim key in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable the zsh-syntax-highlighting
# source /home/thangphan/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /home/thangphan/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /home/thangphan/.config/zsh/zsh-autopair/autopair.zsh

# External plugsin with homebrew macos
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Auto load the xmodmap file
# xmodmap ~/.Xmodmap
