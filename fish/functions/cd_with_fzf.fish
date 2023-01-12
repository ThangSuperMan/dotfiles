function cd_with_fzf
  cd $HOME && cd "$(fd -t d | fzf --preview 'tree {}' --border=rounded --reverse --height=50% --margin=0,20,0,20)"
end
