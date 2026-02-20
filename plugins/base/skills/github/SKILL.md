---
name: github
description: Activates when performing GitHub operations like creating PRs, managing branches, viewing issues, or any GitHub-related tasks. Uses the gh CLI command for all GitHub interactions.
version: 2.0.0
---

# GitHub CLI (gh)

Use the `gh` command for all GitHub operations. Do not use MCP server tools.

## Pull Requests

```bash
# Create a PR
gh pr create --title "Title" --body "Description"

# List PRs
gh pr list

# View PR details
gh pr view <number>

# Edit a PR
gh pr edit <number> --title "New title" --body "New description"

# Merge a PR
gh pr merge <number>

# View PR diff
gh pr diff <number>

# Check out a PR
gh pr checkout <number>
```

## Issues

```bash
# List issues
gh issue list

# Create an issue
gh issue create --title "Title" --body "Description"

# View issue details
gh issue view <number>

# Close an issue
gh issue close <number>
```

## Branches

```bash
# List branches
gh api repos/{owner}/{repo}/branches | jq '.[].name'

# Create a remote branch (via git)
git push origin HEAD:<branch-name>
```

## Files / Contents

```bash
# Get file contents
gh api repos/{owner}/{repo}/contents/{path} | jq -r '.content' | base64 -d
```

## Commits

```bash
# List commits
gh api repos/{owner}/{repo}/commits | jq '.[].commit.message'

# Get commit details
gh api repos/{owner}/{repo}/commits/{sha}
```

## Repository

```bash
# View repository info
gh repo view

# Open repository in browser
gh repo view --web
```

## Troubleshooting

### gh not installed

First, check if `gh` is available:

```bash
which gh
```

If the command is not found, output the following guide to the user:

---

**gh CLI is not installed.**

Install it for your platform:

**macOS**
```bash
brew install gh
```

**Ubuntu / Debian**
```bash
sudo apt install gh
```

**Other**
Official install guide: https://cli.github.com/manual/installation

After installing, authenticate:
```bash
gh auth login
```

---

### gh not authenticated

```bash
gh auth status
```

If not authenticated:

```bash
gh auth login
```

### Verify authentication

```bash
gh api user | jq '.login'
```
