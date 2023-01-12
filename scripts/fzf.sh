#!/bin/sh

result=$(fzf --preview 'bat --style=numbers --color=always {}' --border=rounded --reverse --height=50% --margin=0,20,0,20)

printf "result here: %s" "$result"

nvim "$result"

# echo $HOME
