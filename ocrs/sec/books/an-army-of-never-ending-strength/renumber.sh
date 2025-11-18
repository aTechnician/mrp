#!/bin/bash

# Define the value to add
VALUE_TO_ADD=198

# Loop through files matching a pattern, e.g., "file_1.txt", "file_2.txt"
# Adjust the pattern to match your specific file naming convention
for file in IMG*.JPG; do
    # Extract the base name and extension
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    base_name="${filename%.*}"

    # Extract the number from the base name
    # Assuming the number is at the end of the base name, preceded by an underscore
    number_part=$(echo "$base_name" | grep -o -E '[0-9]+$')

    # Check if a number was found
    if [[ -n "$number_part" ]]; then
        # Convert to integer and add the value
        original_number=$((10#$number_part)) # Use 10# to ensure base 10 interpretation
        new_number=$((original_number + VALUE_TO_ADD))

        # Construct the new filename
        # This example assumes the number is at the end, like "file_OLDNUM.txt"
        # Adjust the new_base_name construction based on your needs
        prefix=$(echo "$base_name" | sed "s/$number_part$//")
        new_base_name="${prefix}${new_number}"
        new_filename="${new_base_name}.${extension}"

        # Rename the file
        echo "Renaming '$file' to '$new_filename'"
        mv "$file" "$new_filename"
    else
        echo "No number found in '$file', skipping."
    fi
done
