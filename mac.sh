#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install zsh ctags git hub tmux reattach-to-user-namespace the_silver_searcher
brew install macvim --custom-icons --override-system-vim --with-lua --with-luajit
brew install asdf
brew install visual-studio-code
brew install google-chrome
brew install iterm2

