#!/bin/sh

set -e


/Applications/Tailscale.app/Contents/MacOS/Tailscale up --accept-routes 
mount -t smbfs smb://nick:Pacemaker-Crying6-Shaky-Repeated@100.108.27.35/Cloud /Users/nick/Mount/CloudMount
