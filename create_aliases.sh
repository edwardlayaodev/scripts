#!/bin/bash

# Specify the path to your GitHub folder
github_folder=~/github

# Specify the path to your .bash_aliases file
aliases_file=~/.bash_aliases

# Check if .bash_aliases file exists, create it if not
touch $aliases_file

# Loop through each folder in the GitHub directory
for project_folder in $github_folder/*; do
    # Check if the item is a directory
    if [ -d "$project_folder" ]; then
        # Get the folder name
        project_name=$(basename "$project_folder")

        # Create the alias command
        alias_command="alias $project_name='code $project_folder'"

        # Check if the alias already exists in .bash_aliases
        if ! grep -q "$alias_command" "$aliases_file"; then
            # Append the alias to .bash_aliases
            echo "$alias_command" >> "$aliases_file"
            echo "Alias for $project_name created."
        else
            echo "Alias for $project_name already exists."
        fi
    fi
done

# Source .bash_aliases to apply changes immediately
source "$aliases_file"
