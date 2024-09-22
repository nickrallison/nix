#!/bin/sh

#### User Set Vars ####
RSYNC_MOUNT_POINT="/Users/nick/Mount/Cloud"
RSYNC_REMOTE="unraid:/mnt/user/Cloud"

#### Error if 
# not connected to unraid
# rclone unraid not setup


#### Script Logic ####
/etc/profiles/per-user/nick/bin/rclone bisync ${RSYNC_MOUNT_POINT} ${RSYNC_REMOTE}
