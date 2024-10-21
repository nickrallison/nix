#!/bin/sh

cd "/Users/nick/Applications/Home Manager Apps/"; find . -name "*" |
while read src; do
  path=$(echo "/Users/nick/Applications/Home Manager Apps/$src" | sed 's@\./@@g')
  name=$(basename "$path" | sed 's/.app//g' )
  if [ -e "$path" ]; then
    [ -d "$path" ] && \
    if [ -e "/Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns" ]; then
      sudo fileicon set "$path" "/Users/nick/.config/nix/Systems/Nicks-MacBook-Pro/Icons/$name.icns"
    fi
  fi
done

sudo rm -rf /Library/Caches/com.apple.iconservices.store
killall Dock; killall Finder
