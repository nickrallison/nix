#!/bin/bash

#### User Set Vars ####
MOUNT_POINT="/Users/nick/Mount/Cloud Local"
REMOTE="unraid:/mnt/user/Cloud"

#### Error if 

if pgrep rclone; then
  echo "rclone already running"
  exit 1
fi


# Ping the IP address

IP="100.108.27.35"
ping -c 1 $IP > /dev/null 2>&1

# Check the exit status
if [ $? -eq 0 ]; then
  echo "IP address $IP is reachable."
else
  echo "IP address $IP is not reachable."
  exit 1
fi



#### Script Logic ####
rclone sync ${REMOTE} "${MOUNT_POINT}" --progress --ignore-existing
