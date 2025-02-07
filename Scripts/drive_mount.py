import subprocess
import time
import sys

TAILSCALE_PATH = '/Applications/Tailscale.app/Contents/MacOS/Tailscale'
MOUNT_COMMAND = [
    'mount',
    '-t',
    'smbfs',
    'smb://nick:Pacemaker-Crying6-Shaky-Repeated@100.108.27.35/Cloud',
    '/Users/nick/Mount/CloudMount'
]
TIMEOUT = 120  # 2 minutes in seconds
POLL_INTERVAL = 5  # Check every 5 seconds

def is_tailscale_connected():
    """Check if Tailscale has an active connection."""
    try:
        result = subprocess.run(
            [TAILSCALE_PATH, 'ip'],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        return result.stdout.strip() != ''
    except subprocess.CalledProcessError:
        return False

def start_tailscale():
    """Start Tailscale connection with route acceptance."""
    try:
        subprocess.run(
            [TAILSCALE_PATH, 'up', '--accept-routes'],
            check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"🚨 Failed to start Tailscale: {e}")
        sys.exit(1)

def wait_for_connection():
    """Wait for Tailscale connection with timeout."""
    print("⏳ Waiting for Tailscale connection...")
    start_time = time.time()
    
    while time.time() - start_time < TIMEOUT:
        if is_tailscale_connected():
            print("✅ Tailscale connected successfully")
            return True
        time.sleep(POLL_INTERVAL)
    
    print(f"🚨 Connection timeout ({TIMEOUT} seconds expired)")
    return False

def mount_drive():
    """Mount the network drive with error handling."""
    try:
        subprocess.run(MOUNT_COMMAND, check=True)
        print("✅ Drive mounted successfully")
    except subprocess.CalledProcessError as e:
        print(f"🚨 Mount failed: {e}")
        sys.exit(1)

def main():
    start_tailscale()
    if not wait_for_connection():
        sys.exit(1)
    mount_drive()

if __name__ == "__main__":
    main()