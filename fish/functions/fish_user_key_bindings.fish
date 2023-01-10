function fish_user_key_bindings
  # Peco
  # Notes: \cr -> Control r
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F

  # Vim
  bind -m default H beginning-of-line
  bind -m default L end-of-line

  # Vim-like
  bind \cl forward-char
end
