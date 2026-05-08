---
name: coding-explore
description: Gather coding context from user-provided reference links.
user-invocable: false
---

# Coding Explore

## Steps

1. Ask the user to provide references for the task:
   - GitHub Issues, PRs, Wiki pages, documentation URLs, etc.
   - Obsidian note names or paths (e.g. `"Meeting Notes"`, `"specs/feature-x.md"`)
   - Accept multiple references of any type

2. For each reference provided:
   - GitHub issues/PRs: use `gh` CLI (`gh issue view`, `gh pr view`) when possible
   - URLs: use `WebFetch`
   - Obsidian notes: use the obsidian skill (`obsidian read file="<name>"` or `obsidian read path="<path>"`);

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
