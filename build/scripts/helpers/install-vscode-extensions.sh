#!/bin/bash

# Get the list of installed extensions
installed_extensions=$(/tmp/code-server/bin/code-server --list-extensions)

while IFS='' read -r line || [[ -n "$line" ]]; do
    # Check if the extension is already installed
    if echo "$installed_extensions" | grep -q "^$line$"; then
        echo "Extension $line is already installed.";
    else
        echo "Installing $line using VSCode";
        /tmp/code-server/bin/code-server --install-extension $line --force
    fi
done < "$1"
