#!/bin/sh

echo cd "/Users/nick/Local Documents/Vault"
cd "/Users/nick/Local Documents/Vault"

echo git add .
git add .

echo git commit -m "$(date)"
git commit -m "$(date)"

echo git push
git push
