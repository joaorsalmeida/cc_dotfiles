#!/bin/sh

if [ ! -d "$HOME/.cc_dotfiles" ]
then
  echo "Installing Campus Code Dotfiles"
  echo "We'll install:"
  echo "  - tmux"
  echo "  - silver searcher"
  echo "  - zsh"
  echo "  - nodejs"

  case "$(uname -s)" in
    Linux)
      echo "  - vim (vim-gnome)"
      echo "  - Docker"
      echo "  - docker-compose"
      NODE_VERSION=12

      sudo apt-get update
      sudo apt-get install -y software-properties-common gnupg2 dconf-cli uuid-runtime
      sudo apt-get install -y silversearcher-ag \
        git \
        xclip \
        build-essential \
        zsh \
        dconf-cli \
        vim-gtk3 \
        libevent-dev \
        ncurses-dev \
        bison \
        pkg-config
      ;;
    Darwin )
      echo "  - vim (macvim)"
      echo "  - google-chrome (mac)"
      echo "  - iterm2 (mac)"
      echo "  - atom (mac)"
      sudo usermod -a -G rvm `whoami`
      ;;
    CYGWIN* | MSYS*)
      echo 'You are using a Windows machine which is not recommended to use with our' \
           ' dotfiles.'
      echo 'You can clone our repository and try install it manually.'
      return
      ;;
    *)
      echo 'Operational system not recognized, aborting installation'
      return
      ;;
  esac
  if [ -z "$LOCAL_INSTALL" ]
  then
    echo "FROM REMOTE SOURCE"
    git clone --depth=10 https://github.com/campuscode/cc_dotfiles.git "$HOME/.cc_dotfiles"
  else
    echo "LOCAL SOURCE"
    cp -r . "$HOME/.cc_dotfiles"
  fi
  cd "$HOME/.cc_dotfiles"
  rake install
else
  echo "You already have Campus Code Dotfiles installed."
fi
