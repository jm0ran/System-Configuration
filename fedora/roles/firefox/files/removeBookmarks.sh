#!/bin/bash

# Check for existence of argument
if [ -z "$1" ]; then
    echo "Path argument for booksmarks .sqlite file was not provided"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File $1 does not exist"
    exit 1
fi

# Create a list of bookmarks to remove
bookmarks_to_remove=("Fedora Docs" "Fedora Magazine" "Get Fedora" "Fedora Spins (Desktop Environments)" "Fedora Labs (Functional Bundles)" "Fedora ARM (IoT and More!)" "Fedora Alternative Downloads", "More Downloads" 
"About the Fedora Project" "Ask Fedora (Community Support)" "Fedora Discussion" "Planet Fedora" "Fedora Community Blog" "Get involved with the Fedora Project", "Fedora Project" "Fedora Forum" "r/Fedora on Reddit" "Fedora on Facebook" "@fedora on Twitter" "Fedora Telegram" "Fedora on Discord Chat" "Fedora on Diaspora" "#fedora IRC via Riot" "User Communities" "JBoss Developer Community" "OpenShift Origin" "OpenSource.com" "The Open Source Way" "Red Hat" "Wikipedia" "LibriVox" "Open Clip Art" "Free Sound" "Creative Commons" "Pixabay" "Free Content") 

# Iterate through the list of strings
for bookmark in "${bookmarks_to_remove[@]}"; do
    echo "Removing bookmark: $bookmark"
    sqlite3 "$1" "DELETE FROM moz_bookmarks WHERE title='$bookmark';"
done

echo "Script complete"
exit 0

