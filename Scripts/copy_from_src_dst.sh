#It will Regular Monitor the SRC path as soon as the new files comes will copy to the destination path and will clear the source file 
# I Used it for Copy file from nextcloud upload to jellyfin music path copy

#!/bin/bash

SRC_DIR="path"
DEST_DIR="path"

sudo inotifywait -m -r -e create,move,close_write "$SRC_DIR" |
while read -r directory events filename; do
    # Ignore files with .ocTransferId extension
    if [[ "$filename" == *".ocTransferId"* ]]; then
        continue
    fi
    
    if [ "$events" = "CREATE,ISDIR" ] || [ "$events" = "MOVED_TO,ISDIR" ]; then
        sudo mkdir -p "$DEST_DIR/$filename"
    elif [ "$events" = "CREATE" ] || [ "$events" = "MOVED_TO" ]; then
        sudo mv "$SRC_DIR/$filename" "$DEST_DIR/"
    fi
done

# Clean up the source directory after all files are copied
sudo rm -r "$SRC_DIR"/*
