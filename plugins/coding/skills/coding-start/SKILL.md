---
name: coding-start
description: Use when the user wants to start a coding task from reference links (Wiki, Issue, PR, etc.).
---

# Coding Start

Execute the full coding workflow in order:

1. **coding-explore** — Ask user for reference links and gather context
2. **Plan** — Use `EnterPlanMode` natively to design the implementation based on the context
3. **Implement** — Write the code based on the approved plan
4. **coding-create-pr** — Create a PR using `.github/PULL_REQUEST_TEMPLATE.md`

## Shared Context

Pass the following between steps:
- Reference links provided by the user
- Requirements and context extracted from those links
- Implementation plan (after EnterPlanMode approval)
- List of changed files

## Notes

- Steps 2 and 3 use Claude's native capabilities (EnterPlanMode, coding tools)
- Do not skip steps — always explore context before planning
- Always create a new branch before coding if not already on a feature branch
