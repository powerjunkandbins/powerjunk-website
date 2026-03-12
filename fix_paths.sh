#!/bin/bash

# Script to replace absolute URLs with relative paths in HTML files
cd "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site"

for file in *.html; do
    echo "Processing $file..."

    # Create backup
    cp "$file" "$file.bak"

    # Replace powerjunk.ca URLs with relative paths
    sed -i 's|https://powerjunk\.ca/wp-content/|wp-content/|g' "$file"
    sed -i 's|https://powerjunk\.ca/|./|g' "$file"
    sed -i 's|http://powerjunk\.ca/wp-content/|wp-content/|g' "$file"
    sed -i 's|http://powerjunk\.ca/|./|g' "$file"

    # Fix navigation links
    sed -i 's|href="\./"|href="index.html"|g' "$file"
    sed -i 's|href="\.\/junk-removal\/"|href="junk-removal.html"|g' "$file"
    sed -i 's|href="\.\/bin-rentals\/"|href="bin-rentals.html"|g' "$file"
    sed -i 's|href="\.\/small-demolition\/"|href="small-demolition.html"|g' "$file"
    sed -i 's|href="\.\/about-us\/"|href="about-us.html"|g' "$file"
    sed -i 's|href="\.\/contact\/"|href="contact.html"|g' "$file"

    echo "  ✓ Fixed $file"
done

echo ""
echo "All HTML files updated with local paths!"
echo "Backups saved as *.html.bak"
