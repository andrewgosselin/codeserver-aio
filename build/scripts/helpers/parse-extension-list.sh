#!/bin/bash

jq -r ".[].id" /init/extensions.json > /init/extensions.list

