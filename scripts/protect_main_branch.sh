#!/bin/bash

# Set variables
gh_org_or_user="caustic-sam"  # Update if it's under an organization
gh_repo="world-papers"
protected_branch="main"

# Enable branch protection with required reviews
echo "Enforcing branch protection on $protected_branch in repository: $gh_repo"
gh api -X PUT \
  repos/$gh_org_or_user/$gh_repo/branches/$protected_branch/protection \
  -F required_status_checks='null' \
  -F enforce_admins='true' \
  -F required_pull_request_reviews='{"dismiss_stale_reviews":true,"require_code_owner_reviews":true,"required_approving_review_count":1}' \
  -F restrictions='null'

echo "Branch protection rules applied successfully."
