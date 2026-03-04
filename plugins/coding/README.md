# coding

Workflow plugin for coding tasks — gathers context from reference links, plans, implements code, and creates a PR.

## Overview

This plugin automates the full coding workflow starting from requirements gathering to PR creation.

## Usage

```
/coding-start
```

## Workflow

| Step | Description |
|------|-------------|
| 1. Explore | Ask user for reference links (Wiki, Issue, PR, etc.) and read their content |
| 2. Plan | Use `EnterPlanMode` to design the implementation |
| 3. Implement | Write code based on the approved plan |
| 4. Create PR | Create a PR using `.github/PULL_REQUEST_TEMPLATE.md` |

## Skills

| Skill | Invocable | Description |
|-------|-----------|-------------|
| `coding-start` | Yes | Entry point — runs the full workflow |
| `coding-explore` | No | Fetches and summarizes reference links |
| `coding-create-pr` | No | Creates a PR with the project template |

## Requirements

- `gh` CLI installed and authenticated
- `.github/PULL_REQUEST_TEMPLATE.md` (optional but recommended)
