---
name: coding-explore
description: Gather coding context from user-provided reference links.
user-invocable: false
---

# Coding Explore

## Steps

1. Ask the user to provide reference links for the task:
   - GitHub Issues, PRs, Wiki pages, documentation URLs, etc.
   - Accept multiple links

2. For each link provided:
   - Use `WebFetch` to read the content
   - For GitHub issues/PRs, prefer using `gh` CLI (`gh issue view`, `gh pr view`) when possible

3. Summarize the extracted context:
   - What needs to be implemented or changed
   - Any constraints or requirements mentioned
   - Related files or components referenced
   - Acceptance criteria if present

4. Present the summary to the user and confirm understanding before proceeding to planning.

## Output

Provide a structured context summary:
- **Goal**: What the task is about
- **Requirements**: Key things to implement
- **References**: Links and their key points
- **Notes**: Any additional constraints or context
