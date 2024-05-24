#!/bin/bash

# TODO: Make this a parameter
gistid="andrewgosselin/4949f5a4de3f571e63f9e1f7c037032f"
gisturl="https://gist.githubusercontent.com/${gistid}/raw"

curl -o /init/extensions.json "${gisturl}/extensions.json"
curl -o /init/settings.json "${gisturl}/settings.json"
