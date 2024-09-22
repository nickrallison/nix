#!/bin/sh


#### User Set Vars ####
RSYNC_LOGS_FILE="$(date)-rsync-bisync.txt"
RSYNC_LOGS_DIR="${LOG_DIR}/rsync_bisync_mount"
RSYNC_MOUNT_POINT="/Users/nick/Mount/Cloud"
# RSYNC_REMOTE="root@100.108.27.35:/mnt/user/Cloud"
RSYNC_REMOTE="unraid:/mnt/user/Cloud"

#### Formula Vars ####
RSYNC_LOGS_PATH="${RSYNC_LOGS_DIR}/${RSYNC_LOGS_FILE}"

#### Error if 
# not connected to unraid
# rclone unraid not setup


#### Script Logic ####
mkdir -p "${RSYNC_LOGS_DIR}"
rclone bisync --resync ${RSYNC_MOUNT_POINT} ${RSYNC_REMOTE} >& "${RSYNC_LOGS_PATH}"
# ssh-add --apple-load-keychain
# rclone ls ${RSYNC_REMOTE} 
