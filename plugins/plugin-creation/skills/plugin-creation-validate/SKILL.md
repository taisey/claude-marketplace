---
name: plugin-creation-validate
description: Validate generated or updated plugin files for clarity and completeness.
user-invocable: false
---

# Validate Plugin

Evaluate all SKILL.md files as a fresh AI with no context from this conversation — simulate what an execution agent would face when reading these files cold.

## Per-Skill Checklist

For each `skills/<skill>/SKILL.md`:

| Item | Priority |
|------|----------|
| `description` clearly states the activation condition | `[critical]` |
| Every step has only one reasonable interpretation | `[critical]` |
| Success state is explicit or clearly implied | `[critical]` |
| No step assumes knowledge not present in the skill or shared context | `[critical]` |
| Edge cases or failure modes are addressed | optional |

## Plugin-Level Checklist

| Item | Priority |
|------|----------|
| Orchestrator skill invokes all task skills in correct order | `[critical]` |
| All task skills have `user-invocable: false` | `[critical]` |
| Skill directory names match the `name` field in each SKILL.md | `[critical]` |
| `plugin.json` has valid name, version, description, author | `[critical]` |
| README.md lists all skills accurately | optional |

## Validation Scenarios

Mentally simulate execution for **2 scenarios**:

1. **Typical case** — a simple 2-3 task workflow
2. **Edge case** — a workflow with external tools, MCP servers, or async steps

For each scenario, identify:
- Which steps are ambiguous?
- What assumptions would the AI make?
- What information is absent?

## Output

Report in this exact format:

```
## Validation Report

### Critical Issues (must fix before proceeding)
- <skill>: <issue>

### Warnings (optional improvements)
- <skill>: <suggestion>

### Ambiguities Found
- <skill> / <step>: "<quoted text>" — unclear because <reason>; would assume <assumption>

### Scenarios
- Typical case: PASS / FAIL — <notes>
- Edge case: PASS / FAIL — <notes>

### Result: PASS / FAIL
```

**If any `[critical]` item fails**: stop, present the report, and ask the user to fix the issues before proceeding.

**If only warnings exist**: present the report and proceed unless the user wants to address them first.
