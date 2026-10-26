---
name: write-commit-message
description: Write commit subjects and optional bodies that match the current repository's established style and describe the exact change without overstating its scope. Use when asked for a commit message, commit title, git commit subject, squash title, or wording for a commit.
---

# Write Commit Message

## Workflow

1. Inspect the change before naming it:
   - Prefer `git diff --cached` when changes are staged.
   - Otherwise inspect `git diff`.
   - Read enough surrounding code to identify the actual behavior, actor, direction, and timing.
2. Inspect recent repository subjects with `git log -15 --format=%s`.
3. Match the repository's conventions:
   - capitalization and punctuation
   - imperative, present, or past tense
   - prefixes or scopes
   - typical length and level of detail
4. Describe only what the change does:
   - Distinguish client from server, local from remote, and one side from both sides.
   - Preserve important timing such as "when dialing" or "after the handshake".
   - Do not turn a narrow check into a broad claim.
5. Return one best message. Add a body only when requested or when the repository consistently uses one.

## Rules

- Do not default to Conventional Commits unless the repository uses them.
- Do not invent issue or pull request numbers.
- Prefer the observable behavior over incidental implementation details.
- Keep the subject concise, but never shorten away the affected side or scope.
- The subject must not exceed 72 characters, including any prefix or scope. Treat [GitHub's subject-length guidance](https://docs.github.com/en/contributing/collaborating-on-github-docs/using-git-on-github-docs) as a hard limit, even if repository history uses longer subjects. Count characters before returning the message.
- Never mention AI coding agents anywhere in the commit message: subject, body, or trailers. This strictly forbids `Co-authored-by:` trailers crediting agents and any other AI-agent attribution, acknowledgement, or generated-by text, regardless of repository convention.
- If the diff contains unrelated changes, say that one accurate commit message is impossible and identify the split.
- Output only the commit message unless the user asks for reasoning or alternatives.

