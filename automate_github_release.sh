#!/bin/bash

# Set variables
gh_org_or_user="caustic-sam"
gh_repo="world-papers"
branch="main"
tag="v$(date +%Y.%m.%d.%H%M)"  # Generate a timestamped version
release_name="Release $tag"
release_notes_file="release_notes.md"

echo "Creating a new release: $release_name in repository: $gh_repo"

# Generate release notes if the file doesn't exist
touch "$release_notes_file"

echo "Generating release notes..."
gh api repos/$gh_org_or_user/$gh_repo/releases/generate-notes -F tag_name="$tag" --jq .body > "$release_notes_file"

# Create a new tag
gh release create "$tag" \
  --repo "$gh_org_or_user/$gh_repo" \
  --title "$release_name" \
  --notes-file "$release_notes_file" \
  --target "$branch"

echo "Release $release_name created successfully."
