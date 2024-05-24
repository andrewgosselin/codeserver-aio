#!/bin/bash

# Change directory to /root/scripts
cd /init/helpers || exit 1

# Get configuration from Gist
sh get-config-from-gist.sh || exit 1

# Parse extension list
sh parse-extension-list.sh || exit 1

mkdir -p ~/.local/share/code-server/User
cp -rf /init/settings.json ~/.local/share/code-server/User/settings.json

# Install VSCode extensions using the parsed list
sh install-vscode-extensions.sh /init/extensions.list

