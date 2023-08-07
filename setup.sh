#!/bin/sh
dotfilePath=$(pwd)

# Utils
function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

function install_macos {
  if [[ $OSTYPE != darwin* ]]; then
    return
  fi
  echo "MacOS detected"
  xcode-select --install

  if [ "$(is_installed brew)" == "0" ]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function link_dotfiles {
  echo "Linking dotfiles"
  
  ln -sfn $dotfilePath/.config/alacritty $HOME/.config
  ln -sfn $dotfilePath/.config/nvim $HOME/.config
  ln -sfn $dotfilePath/.config/tmux $HOME/.config
  ln -sfn $dotfilePath/.config/lynx $HOME/.config
  ln -sfn $dotfilePath/.config/starship.toml $HOME/.config
  ln -sfn $dotfilePath/.gitconfig $HOME/.gitconfig
  ln -sfn $dotfilePath/.tmux.conf $HOME/.tmux.conf
}

install_macos 
link_dotfiles
