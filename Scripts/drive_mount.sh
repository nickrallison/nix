#!/bin/sh

set -e

# mkdir -p /Users/nick/Mount/TimeMachineMount

/Applications/Tailscale.app/Contents/MacOS/Tailscale up --accept-routes --exit-node=100.108.27.35

mount -t smbfs smb://nick:Pacemaker-Crying6-Shaky-Repeated@100.108.27.35/Cloud /Users/nick/Mount/CloudMount
# mount -t smbfs smb://nick:Pacemaker-Crying6-Shaky-Repeated@100.108.27.35/timecapsule_nick /Users/nick/Mount/TimeMachineMount
