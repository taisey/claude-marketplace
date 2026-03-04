---
name: coding-create-pr
description: Create a pull request using the project's PR template after coding is complete.
user-invocable: false
---

# Coding Create PR

## Steps

1. **Check for PR template**:
   - Read `.github/PULL_REQUEST_TEMPLATE.md` if it exists
   - If not found, use a minimal default structure

2. **Gather PR information**:
   - Current branch name (from `git branch --show-current`)
   - Summary of changes made during implementation
   - List of changed files (`git diff --name-only main`)
   - Related issue/PR links from the explore context

3. **Fill in the template**:
   - Populate all sections of the template with relevant information
   - Link to reference issues/PRs explored in `coding-explore`
   - Summarize what was implemented

4. **Create the PR**:
   ```bash
   gh pr create --title "<title>" --body "<filled template>"
   ```
   - Title format: concise description of what was implemented
   - Target branch: `main` (or the repo's default branch)

5. **Output the PR URL** to the user.

## Notes

- Ensure all changes are committed before creating the PR
- If working on `main`, create a feature branch first: `git checkout -b <branch-name>`
- The branch name should reflect the task (e.g., `feat/add-user-auth`)
