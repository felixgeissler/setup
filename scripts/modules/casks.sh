#!/bin/bash

# Copyright 2023 Felix Geißler <https://www.felixgeissler.de/>

# Original copyright Mathias Bynens <https://mathiasbynens.be/>
# Original License can be found within the .github folder of this repo @ `.github/LICENSE-MIT.txt`

heading 'Running casks.sh'
info "This script will install casks (macOS Applictions) via Homebrew."

info '🛡️ Installing security software'
brew install --cask 1password keepassxc zap

info '👩‍💻 Installing development software'
brew install --cask visual-studio-code tableplus bruno docker github hyper

info '💻 Installing web browsers'
brew install --cask brave firefox homebrew/cask-versions/firefox-developer-edition google-chrome

info '🎨 Installing design software'
brew install --cask affinity-designer affinity-photo

info '💬 Installing chat and teamwork software'
brew install --cask microsoft-teams onedrive google-drive discord signal nextcloud

info '📝 Installing office tools'
brew install --cask microsoft-outlook microsoft-word microsoft-excel sipgate-softphone

info '🪛 Installing utility tools'
brew install --cask clipy logi-options-plus disk-inventory-x raycast hiddenbar

info '🎧 Installing entertainment software'
brew install --cask spotify rekordbox

# Remove outdated versions from the cellar.
brew cleanup
