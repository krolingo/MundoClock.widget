import re

# Input text (your messy data)
data = """PASTE YOUR TEXT HERE"""

# Extract URLs with a regular expression
urls = re.findall(r"https://epic\.gsfc\.nasa\.gov/epic-galleries/\d+/high_cadence/full/epic_1b_\d{14}\.png", data)

# Remove duplicates and sort the list
unique_urls = sorted(set(urls))

# Save to a file or print
with open("urls.txt", "w") as file:
    file.write("\n".join(unique_urls))

print("Extracted URLs saved to 'urls.txts'")
