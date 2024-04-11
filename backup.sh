#!/bin/bash

# Directory where the script is located
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source directory is the directory where the script is located
source_directory="$script_directory"

# Destination directory is a subdirectory named "backups" in the script directory
destination_directory="$script_directory/backups"

# Check if the source directory exists
if [[ ! -d "$source_directory" ]]; then
  echo "Error: Source directory does not exist."
  exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$destination_directory"

# Get current timestamp and yesterday's timestamp
current_timestamp=$(date +%s)
yesterday_timestamp=$((current_timestamp - 86400))

# Array to store files to backup
files_to_backup=()

# Iterate through files in the source directory
while IFS= read -r -d '' file; do
    # Get last modified timestamp of the file
    file_timestamp=$(stat -c %Y "$file")

    # Check if the file is an encrypted password file and was modified in the last 24 hours
    if [[ $file =~ \.enc$ && $file_timestamp -gt $yesterday_timestamp ]]; then
        files_to_backup+=("$file")
    fi
done < <(find "$source_directory" -type f -print0)

# Check if there are files to backup
if [[ ${#files_to_backup[@]} -eq 0 ]]; then
    echo "No encrypted password files modified in the last 24 hours."
    exit 0
fi

# Create backup file with timestamp
backup_filename="backup-$(date +"%Y%m%d%H%M%S").tar.gz"
tar -czf "$destination_directory/$backup_filename" "${files_to_backup[@]}"

echo "Backup completed: $destination_directory/$backup_filename"
