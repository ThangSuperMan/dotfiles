[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

. "$HOME/.cargo/env"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.bashrc


# Load Angular CLI autocompletion.
source <(ng completion script)
