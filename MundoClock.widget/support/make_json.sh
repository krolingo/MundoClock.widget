#!/opt/homebrew/bin/bash

# Directory containing images
IMAGE_DIR="epic_images"
# Output JSON file
OUTPUT_FILE="$IMAGE_DIR/epic_images_index.json"

# Check if the directory exists
if [ ! -d "$IMAGE_DIR" ]; then
  echo "Error: Directory '$IMAGE_DIR' does not exist."
  exit 1
fi

# Check if there are PNG files
if [ -z "$(ls $IMAGE_DIR/*.png 2>/dev/null)" ]; then
  echo "Error: No PNG files found in '$IMAGE_DIR'."
  exit 1
fi

# Start JSON array
echo "[" > "$OUTPUT_FILE"

# Process each PNG file
for file in "$IMAGE_DIR"/*.png; do
  filename=$(basename "$file")
  # Parse timestamp from filename
  year=${filename:8:4}
  month=${filename:12:2}
  day=${filename:14:2}
  hour=${filename:16:2}
  minute=${filename:18:2}
  second=${filename:20:2}
  timestamp="${year}-${month}-${day} ${hour}:${minute}:${second} UTC"

  # Write JSON object
  echo "  {\"path\": \"$file\", \"timestamp\": \"$timestamp\"}," >> "$OUTPUT_FILE"
done

# Remove trailing comma and close JSON array
sed -i '' '$ s/,$//' "$OUTPUT_FILE"
echo "]" >> "$OUTPUT_FILE"

echo "JSON index created: $OUTPUT_FILE"

