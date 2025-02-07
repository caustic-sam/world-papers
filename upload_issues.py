import csv
import subprocess

#To be worked on later
CONFIG_PATH = "config.json"  # Replace with your config file
#To be worked on later


GITHUB_REPO = "caustic-sam/world-papers"  # Replace with your repo
ISSUES_CSV = "initial_issues_for_seeding.csv"  # Replace with your CSV file


# Function to create a label if it doesn't exist
def create_label_if_needed(label):
    result = subprocess.run(f'gh label list --repo {GITHUB_REPO}', shell=True, capture_output=True, text=True)
    existing_labels = result.stdout.split("\n")

    if label not in existing_labels:
        subprocess.run(f'gh label create "{label}" --repo {GITHUB_REPO} --color "0075ca"', shell=True)
        print(f"✅ Created missing label: {label}")

# Read and process CSV
with open(ISSUES_CSV, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        title = row["title"]
        body = row["body"]
        labels = row["labels"].split(",")  # Split multi-labels

        # Create labels if they don't exist
        for label in labels:
            create_label_if_needed(label.strip())

        # Create the GitHub issue
        label_str = ",".join(labels)
        cmd = f'gh issue create --repo {GITHUB_REPO} --title "{title}" --body "{body}" --label "{label_str}"'
        subprocess.run(cmd, shell=True)

print("✅ Issues imported successfully!")