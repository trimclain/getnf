#!/usr/bin/env bash

DEST="$HOME/.local/bin"
GETNFLOC="$DEST/getnf"

GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

# add the -s or --silent flag to suppress output
SILENT=$([[ "$1" == "-s" ]] || [[ "$1" == "--silent" ]] && echo true || echo false)

$SILENT || echo "${BLUE}Installing getnf...${RESET}"

mkdir -p "$DEST"
rm -f "$GETNFLOC"

if $SILENT; then
    curl -fsSL# https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf --output getnftemp
else
    curl -fL# https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf --output getnftemp
fi

mv getnftemp "$GETNFLOC"
chmod 755 "$GETNFLOC"

$SILENT || echo "${GREEN}Installation finished${RESET}"
