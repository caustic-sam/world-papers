import subprocess

def test_git_tag_creation():
    """Test if git tag creation works correctly."""
    tag = "v1.2.0-test"
    subprocess.run(["git", "tag", "-d", tag], stderr=subprocess.DEVNULL)  # Cleanup old tag
    result = subprocess.run(["git", "tag", tag], capture_output=True, text=True)
    
    assert result.returncode == 0, "Failed to create git tag"
    
    # Cleanup after test
    subprocess.run(["git", "tag", "-d", tag], stderr=subprocess.DEVNULL)

def test_github_cli_auth():
    """Ensure GitHub CLI is authenticated."""
    result = subprocess.run(["gh", "auth", "status"], capture_output=True, text=True)
    
    output = result.stdout + result.stderr  # Combine both stdout & stderr
    
    assert "Logged in to github.com" in output, "GitHub CLI is not authenticated" 