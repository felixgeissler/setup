#!/bin/bash

# Copyright 2023 Felix Geißler <https://www.felixgeissler.de/>

# Original copyright Mathias Bynens <https://mathiasbynens.be/>
# Original License can be found within the .github folder of this repo @ `.github/LICENSE-MIT.txt`

# Install command-line tools using Homebrew.

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

info 'Installing GNU core utilities (those that come with macOS are outdated)'
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install more GNU utils and other useful binaries.
info 'Installing GNU versions of grep, openssh, php, composer and jq'
brew install grep openssh php composer jq

# Install micro
info 'Installing alternative terminal-based editor'
brew install micro

# Install usefull tools
info 'Installing usefull tools'
brew install gh htop telnet wget imagemagick tree ffmpeg id3lib

# Install other useful binaries.
info 'Installing other useful binaries'
brew install git git-lfs

# Install fish shell and Oh My Fish
info 'Installing fish'
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
# Make fish shell to default shell for Terminal
chsh -s /opt/homebrew/bin/fish

# Install Oh My Fish
curl -L https://get.oh-my.fish | fish

# Install Fira Code font
info 'Installing Fira Code font'
brew tap homebrew/cask-fonts && \
brew install font-fira-code

# Install Jira CLI
info 'Installing Jira CLI'
brew tap ankitpokhrel/jira-cli
brew install jira-cli

# Install 1Password CLI
brew install 1password-cli

# Install Boundary & Alemo Connect Dependencies
brew install hashicorp/tap/boundary fzf jq

# Install google web fonts (also not a brew package... but whatever!)
if [[ $(test -f /Library/Fonts/Roboto-Black.ttf) ]]; then
  info 'Installing Google web fonts ... this will take some time (approx 5 mins)...'
  curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/install.sh | bash
else
  warning 'Google web fonts already installed'
fi

# Remove outdated versions from the cellar.
brew cleanup
