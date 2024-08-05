
# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: sudo ./mount_remote.sh <use@server> <mount_point>"
    exit 1
fi

# Store arguments in variables
REMOTE_SERVER="$1"
MOUNT_POINT="$2"

# Check if the mount point exists and is a directory
if [ ! -d "$MOUNT_POINT" ]; then
    echo "Error: Mount point '$MOUNT_POINT' does not exist or is not a directory."
    exit 1
fi

sudo sshfs -o allow_other,default_permissions $REMOTE_SERVER:~/ $MOUNT_POINT