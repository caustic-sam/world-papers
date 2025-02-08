#!/bin/bash

# Set variables
VERSION="v1.2.0"
BRANCH="phase-1.2"
MAIN_BRANCH="main"
TITLE="Merge $VERSION: Azure DevOps Integration"
BODY="Version $VERSION includes Azure DevOps integration, automation scripts, and documentation updates."

# Ensure we're on the correct feature branch
echo "Switching to $BRANCH..."
git checkout $BRANCH

# Add all changes
echo "Staging changes..."
git add --all

# Commit changes
echo "Committing changes..."
git commit -m "Release $VERSION: Azure DevOps Integration & Automation"

# Tag the version
echo "Tagging version $VERSION..."
git tag -a $VERSION -m "World Papers - $VERSION: Azure DevOps Integration"

# Push changes and tag
echo "Pushing changes to remote..."
git push origin $BRANCH
git push origin $VERSION

# Create a Pull Request
echo "Creating Pull Request..."
gh pr create --base $MAIN_BRANCH --head $BRANCH --title "$TITLE" --body "$BODY"

echo "Done! Please review and merge the PR on GitHub. 🚀"
