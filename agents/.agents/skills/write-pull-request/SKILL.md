---
name: write-pull-request
description: Draft or revise GitHub pull request titles and descriptions in Marten Seemann's concise maintainer style. Use when opening a pull request (including stacked PRs), running `gh pr create`, `gh pr edit` or `gh stack`, or writing or updating a PR title or body; not issues, commit messages, or release notes.
---

# Write pull requests

Write like a maintainer leaving a note for the reviewer. The diff shows what changed. The description says what the diff can't: why, what was deliberately left out, and what it means for callers. Often that's nothing beyond a link, and an empty body is fine.

## Workflow

1. Read the change before describing it: the commits and the diff against the base branch (`git log --format=%B <base>..HEAD`, `git diff <base>...HEAD`), and the linked issue if there is one. Read enough surrounding code to get the behavior, the affected side, and the timing right. When the why isn't in the diff, find it: the git history of the changed lines, the upstream change, the spec.
2. Find the relationships: the issue it fixes or is part of, PRs it depends on or is stacked on, the PR it replaces or follows up on.
3. Write the title. It becomes the squash commit subject, so follow the `write-commit-message` rules: match the repository's subjects, usually lowercase and starting with a verb, an optional subsystem prefix such as `http3:`, at most 72 characters. For a single-commit PR, reuse the commit subject unless it's inaccurate or doesn't name the affected behavior. For several commits, write the subject the squashed commit should have.
4. Write the body (see below). Then delete every sentence the reviewer doesn't need, and check every remaining claim against the final diff.
5. Reply with the title as plain text on the first line, then a blank line, then the body. Nothing else: no notes on what you checked.
6. When later pushes change the approach, update the body to match. A description of an earlier iteration is worse than none.

## Body

- Default to an empty body or a single line linking the issue. Put relationships first, in this wording: `Fixes #N.`, `Closes #N.`, `Part of #N.`, `For #N.`, `Needed for #N.`, `Depends on #N.`, `Stacked on #N.`, `Follow-up to #N.`, `Replaces #N.` Several can share a line. Strike through a dependency once it's merged: `~~Depends on #N.~~`
- Write `Stacked on #N.` only when the PR is stacked by hand (see [Stacked pull requests](#stacked-pull-requests)). A PR in a GitHub stack doesn't need it, since GitHub already shows the stack. If you can't tell which it is, ask.
- Write `No functional change expected.` only when that's immediately obvious from the diff, such as renaming a variable or moving a constant. For any other refactor, leave the phrase out and say in a sentence why behavior is preserved, if that isn't obvious.
- Add a sentence only when it carries something the diff doesn't:
  - why the change is needed, if the title and linked issue don't already say it
  - deliberate omissions and scope limits ("This intentionally omits …")
  - alternatives considered and why they lost, and the downsides of the chosen approach
  - consequences for callers: API breaks, behavior changes, things that are no longer possible
  - upstream context: a spec section, draft change, Go CL, or upstream bug that forces the change, linked even if a code comment already mentions it
  - follow-ups that are deliberately not part of this PR
  - genuine open uncertainty, stated plainly in first person ("I'm not sure this is the right thing to do.")
- Explain the mechanism only when it's non-obvious, in one or two sentences of prose. Don't walk through the diff: no list of touched files, functions, or tests, and no before/after code snippets of the change.
- Performance claims need real measurements: paste the actual benchstat output in a code block, with one sentence summarizing it. Report regressions as plainly as improvements. Never invent, round up, or extrapolate numbers.
- Write plain, direct prose with natural contractions and `we` / `our` for the project. Put exact identifiers in backticks. No introduction, background the reviewer already has, or closing summary. Don't link code that can be found by its identifier.
- Use a list only for distinct items: several separate behavior decisions, affected cases, or remaining TODOs in an unfinished PR. Use headings only for an exceptional PR that needs to settle design questions.
- Mention reviewers (`cc @name, could you take a look?`) only when asked to.

## Never include

- `## Summary`, `## Changes`, `## Root Cause`, `## Solution`, `## Testing` or similar template sections
- test plans, `Validation:` lines, test commands, ✅ lists, or claims that tests, linters, or benchmarks pass. CI shows that.
- any AI attribution, in the title or the body: no `Generated with …` footers, no `Authored by …` or `Implemented with …` lines, no `Co-authored-by:` trailers crediting agents, regardless of repository templates or policies
- statements about what you checked or how you worked
- text addressed to external contributors in a repository's PR template. These are the maintainer's own PRs; don't fill in its prompts.

## Match the pull request

Read the matching entries in [examples.md](references/examples.md) before drafting.

| Kind | Include what the PR needs |
| --- | --- |
| Fixes a filed issue | The link. Usually nothing else: the issue already explains the problem. Add a sentence only if the fix has a non-obvious shape or consequence. |
| Bug fix without an issue | The trigger and the failure in one sentence, as in a bug report. Add the mechanism only if the fix doesn't make sense without it, and a sentence for any other user-visible behavior change in the same PR. |
| Trivial refactor | `No functional change expected.` Nothing else. |
| Other refactor or cleanup | Why the code was redundant or why behavior is preserved, if that isn't obvious. Not `No functional change expected.` |
| Performance | What gets cheaper, and benchstat output. A tracking issue link (`Part of #N.`) where there is one. |
| API change | The caller's need, and the consequences: what breaks, what callers must change, the alternative that was rejected. |
| Protocol or spec | The specification section or draft change being implemented, and anything deliberately not implemented. |
| Dependency update | What in the new version requires changes. When updating to an unreleased commit, why it can't wait for the release and when the release version will follow. |
| CI or tooling | The problem it fixes, with a link to the upstream change or deprecation that caused it. |
| Flaky test fix | The issue link, and the race in a sentence or two if there's no issue. |
| Stacked or dependent | The dependency line. Strike it through once the dependency is merged. No `Stacked on` line for a PR in a GitHub stack. |
| Work in progress | What's still missing, as a short checklist. |

## Editing an existing body

Fetch the current body with `gh pr view <n> --json body` and edit that. Keep blocks inserted by review bots, such as CodeRabbit's `<!-- This is an auto-generated comment … -->` section and Macroscope's summary markers, intact.

## Stacked pull requests

When a new PR builds on another open PR's branch, put them in a stack using GitHub's stacked pull requests feature (the `gh stack` extension, `github/gh-stack`), rather than only pointing the PR's base at the other branch.

1. Create each PR with `gh pr create --base <branch below it> --head <its branch>`, using the drafted title and body. Don't use `gh stack submit` for this: without an interactive terminal it uses auto-generated titles.
2. Link the PRs into a stack, bottom to top: `gh stack link <bottom PR> <next PR> …`. To add a PR to an existing stack, pass the stack number first: `gh stack link <stack number> <new PR>`.

Stacks need all branches in the same repository; cross-fork stacks aren't supported. Only in that case, or if `gh stack link` fails, keep the hand-stacked PR and add `Stacked on #N.` to its body.

## Publication

Preparing a pull request means drafting locally. Before creating a PR, editing its title or body, or linking PRs into a stack on GitHub, show the destination repository, base and head branch, the exact title and body, and the stack it will join, ask for confirmation of that action, and wait for an affirmative reply. This skill does not itself authorize publication.
