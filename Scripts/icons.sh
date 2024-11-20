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
sudo find /private/var/folders/ \( -name com.apple.dock.iconcache -or -name com.apple.iconservices \) -exec rm -rfv {} \; ; sleep 3;sudo touch /Applications/* ; killall Dock; killall Finder
