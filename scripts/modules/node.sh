#!/bin/bash
# Copyright 2023 Felix Geißler <https://www.felixgeissler.de/>

heading 'Running node.sh'
info 'This script will install Volta and any node.js global packages.'

info 'Installing Volta'
curl https://get.volta.sh | bash

info 'Installing latest Node version'
volta install node

info 'Installing latest Yarn version'
volta install yarn

info 'Installing global node packages'
npm i -g gitmoji-cli