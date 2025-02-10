#!/bin/bash

# Set variables
gh_org_or_user="caustic-sam"  # Update if it's under an organization
gh_repo="world-papers"

echo "Ensuring labels exist in repository: $gh_repo"

gh label create "To Do" --repo "$gh_org_or_user/$gh_repo" --description "New issue to be addressed" 2>/dev/null
gh label create "In Progress" --repo "$gh_org_or_user/$gh_repo" --description "Currently being worked on" 2>/dev/null
gh label create "Done" --repo "$gh_org_or_user/$gh_repo" --description "Issue is resolved" 2>/dev/null

echo "Updating issue statuses in repository: $gh_repo"

# Get all open issues and move them to "To Do"
gh issue list --repo "$gh_org_or_user/$gh_repo" --state open --json number | jq -r '.[].number' | while read -r issue_number; do
  gh issue edit "$issue_number" --repo "$gh_org_or_user/$gh_repo" --add-label "To Do"
done

# Get all assigned issues and move them to "In Progress"
gh issue list --repo "$gh_org_or_user/$gh_repo" --state open --json number,assignees | jq -c '.[] | select(.assignees != [])' | while read -r issue; do
  issue_number=$(echo "$issue" | jq -r '.number')
  gh issue edit "$issue_number" --repo "$gh_org_or_user/$gh_repo" --add-label "In Progress"
done

# Get all closed issues and move them to "Done"
gh issue list --repo "$gh_org_or_user/$gh_repo" --state closed --json number | jq -r '.[].number' | while read -r issue_number; do
  gh issue edit "$issue_number" --repo "$gh_org_or_user/$gh_repo" --add-label "Done"
done

echo "Issue categorization completed successfully."