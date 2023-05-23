export FZF_HISTORY="--reverse --border rounded --no-info --pointer='' --marker=' ' --ansi --color='16,bg+:-1,gutter:-1,prompt:5,pointer:5,marker:6,border:4,label:4' --border-label=' history ' --prompt='  '"

function fish_user_key_bindings {
    bind '\cr' 'history --reverse | fzf-tmux -p 40%,40% $FZF_HISTORY | read -r -z __cmd; commandline -i "$__cmd"'
}
