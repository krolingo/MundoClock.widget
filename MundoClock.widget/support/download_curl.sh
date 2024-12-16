#!/bin/bash

# File containing all the URLs to download
URL_FILE="urls.txt"
# Directory to save the downloaded files
OUTPUT_DIR="downloads"
# Delay in seconds between each request
DELAY=2

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Read URLs line by line and download each file
while IFS= read -r url; do
    # Extract the filename from the URL
    filename=$(basename "$url")

    # Download the file and save it to the output directory
    echo "Downloading $url to $OUTPUT_DIR/$filename..."
    curl -s -o "$OUTPUT_DIR/$filename" "$url"

    # Check if the download was successful
    if [[ $? -eq 0 ]]; then
        echo "Downloaded: $filename"
    else
        echo "Failed to download: $url"
    fi

    # Wait for the specified delay before the next request
    sleep "$DELAY"
done < "$URL_FILE"

echo "All downloads completed!"
