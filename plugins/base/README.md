# base

GitHub integration using the `gh` CLI for Claude Code.

## Setup

### 1. Install gh CLI

```bash
# macOS
brew install gh

# Linux
sudo apt install gh  # or see https://cli.github.com
```

### 2. Authenticate

```bash
gh auth login
```

## Features

| Type | Name | Description |
|------|------|-------------|
| Skill | `github` | GitHub operations via gh CLI (PRs, Issues, Branches, Commits) |
