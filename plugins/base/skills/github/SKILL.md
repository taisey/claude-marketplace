---
name: github
description: Activates when performing GitHub operations like creating PRs, managing branches, pushing files, or when GitHub MCP connection fails with errors like "authentication failed" or "GITHUB_PERSONAL_ACCESS_TOKEN".
version: 1.0.0
---

# GitHub MCP Server

## Available Tools

### Branches
- `mcp__github__create_branch` - Create a remote branch
- `mcp__github__list_branches` - List branches

### Files
- `mcp__github__push_files` - Push multiple files at once
- `mcp__github__create_or_update_file` - Create or update a single file
- `mcp__github__get_file_contents` - Get file contents

### Pull Requests
- `mcp__github__create_pull_request` - Create a PR
- `mcp__github__get_pull_request` - Get PR details
- `mcp__github__list_pull_requests` - List PRs
- `mcp__github__update_pull_request` - Update a PR

### Commits
- `mcp__github__get_commit` - Get commit details
- `mcp__github__list_commits` - List commit history
- `mcp__github__get_pull_request_diff` - Get PR diff

## Troubleshooting

If connection fails, check in order:

### 1. Token set?
```bash
echo $GITHUB_PERSONAL_ACCESS_TOKEN
```
**Fix**: `echo 'export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_..."' >> ~/.zshrc && source ~/.zshrc`, then restart Claude Code.

### 2. Token valid?
```bash
curl -s -H "Authorization: token $GITHUB_PERSONAL_ACCESS_TOKEN" https://api.github.com/user | head -5
```
**Fix**: Regenerate at https://github.com/settings/tokens (scopes: `repo`, `read:org`), update `~/.zshrc`.
