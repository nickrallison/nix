#!/bin/sh

mkdir -p ~/Projects/Firefox

cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/chrome ~/Projects/Firefox/chrome

cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/prefs.js ~/Projects/Firefox
cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/prefsCleaner.bat ~/Projects/Firefox
cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/prefsCleaner.sh ~/Projects/Firefox

cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/updater.bat ~/Projects/Firefox
cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/updater.sh ~/Projects/Firefox

cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/user.js ~/Projects/Firefox
cp -r /mnt/c/Users/nickr/AppData/Roaming/Mozilla/Firefox/Profiles/s3gat8s4.default-release/user-overrides.js ~/Projects/Firefox

cd ~/Projects/Firefox
git add .
git commit -m "$(date)"
git push
