#!/bin/bash

# Set variables
gh_org_or_user="caustic-sam"
gh_repo="world-papers"
branch="main"
commit_message="Automated documentation update"

echo "Updating documentation for $gh_repo..."

# Generate or update CHANGELOG.md
echo "Generating changelog..."
gh api repos/$gh_org_or_user/$gh_repo/releases --jq 'map("- "+.tag_name+": "+.name)' | sed 's/\[//;s/\]//' > CHANGELOG.md

echo "Updating README.md..."
# Example update (customize as needed)
echo "# World Papers" > README.md
echo "\n## Latest Release" >> README.md
echo "\n$(head -n 1 CHANGELOG.md)" >> README.md

echo "Committing changes..."
git add CHANGELOG.md README.md
git commit -m "$commit_message"
git push origin "$branch"

echo "Documentation updated successfully."


