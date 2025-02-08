#!/bin/bash

# Azure DevOps Organization & Project
ORG_URL="https://dev.azure.com/CloudLasso"
PROJECT="World Papers"

# Work Items to Import
declare -A TASKS=(
    ["Sprint 1: CI/CD Pipeline Setup"]="Implement GitHub Actions or Azure Pipelines"
    ["Sprint 1: Azure DevOps Work Item Sync"]="Automate importing tasks into Azure DevOps from GitHub"
    ["Sprint 1: Auto-Update Release Notes"]="Modify automate_versioning.sh to update CHANGELOG.md"
    ["Sprint 1: Access Control for Scripts"]="Restrict who can run automate_versioning.sh"

    ["Sprint 2: Parallelized Scraping"]="Improve performance by enabling async scraping"
    ["Sprint 2: Language Detection"]="Automatically detect and translate headlines to English"
    ["Sprint 2: Store Processed Data"]="Implement SQLite/PostgreSQL to store fetched headlines"
    ["Sprint 2: Error Handling & Logging"]="Improve logs for scraping errors & API failures"

    ["Sprint 3: Data Security Audit"]="Ensure proper encryption & handling of API keys"
    ["Sprint 3: Refactor & Optimize Code"]="Review and optimize core scraping logic"
    ["Sprint 3: Azure DevOps Build Integration"]="Hook into Azure Pipelines for continuous integration"
    ["Sprint 3: Final Testing & Documentation"]="Test all new features and update documentation"
)

# Loop through tasks and create work items in Azure DevOps
for TITLE in "${!TASKS[@]}"; do
    DESCRIPTION=${TASKS[$TITLE]}
    echo "Creating work item: $TITLE"
    
    az boards work-item create --title "$TITLE" --type "Task" --description "$DESCRIPTION" --project "$PROJECT"
done

echo "✅ All work items successfully imported into Azure DevOps!"