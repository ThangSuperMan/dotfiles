#!/bin/sh
dotfilePath=$(pwd)

ln -sfn $dotfilePath/.config/alacritty $HOME/.config
ln -sfn $dotfilePath/.config/nvim $HOME/.config
ln -sfn $dotfilePath/.config/tmux $HOME/.config
ln -sfn $dotfilePath/.config/lynx $HOME/.config
ln -sfn $dotfilePath/.config/starship.toml $HOME/.config
ln -sfn $dotfilePath/.gitconfig $HOME/.gitconfig
ln -sfn $dotfilePath/.tmux.conf $HOME/.tmux.conf
