#!/bin/bash

# Copyright 2023 Felix Geißler <https://www.felixgeissler.de/>

hyperjs_config="$HOME/.hyper.js"
fish_shell_path="/opt/homebrew/bin/fish"

# Check if ~/.hyper.js exists
if [ -e "$hyperjs_config" ]; then
    # Use fish shell
    sed -i "s/\(^\s*shell:\s*\).*/\1'$fish_shell_path',/" "$hyperjs_config"
    echo "Shell in $hyperjs_config updated to $fish_shell_path"
else
    echo "~/.hyper.js does not exist. Please create it manually or run HyperJS at least once."
fi