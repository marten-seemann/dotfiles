---
name: write-github-issue
description: Draft or revise GitHub issue titles and bodies in Marten Seemann's concise maintainer style. Use for bug reports, feature requests, API proposals, and other issue drafts; not pull request descriptions (use write-pull-request) or release notes.
---

# Write GitHub issues

Write like a maintainer leaving a useful note for another maintainer. Assume familiarity with the project. Include what makes this particular issue understandable and actionable, then stop.

## Voice and shape

- Use a specific, usually lowercase title. Describe the change with a verb, or name the failure and its trigger. Preserve identifier capitalization. Add a subsystem prefix such as `http3:` when it helps; don't automatically add `Bug:` or `Feature request:`.
- Start with the substance. No introduction, generic project background, sales pitch, or closing summary. If the title already says what to change, the body can just explain why.
- Default to a one-sentence body; a title alone is fine when it fully describes the task. Add a sentence only if the issue isn't actionable without it. Longer bodies are for API proposals that need to settle semantics.
- Prefer plain, direct prose, natural contractions, and `we` / `our` for the project. State uncertainty precisely: distinguish an observation, a suspected cause, and a possible solution. Don't hedge established facts or invent personal experience or claims of having tested something.
- Use exact API names, error messages, conditions, and relevant numbers. Put identifiers in backticks. Don't link code that can be found by its identifier. Link only what can't be found by name: a failing run, a specification section, an earlier discussion, or the exact line a panic or log points to.
- Use paragraphs by default. Use lists for actual sets of requirements, cases, or alternatives, and code blocks for relevant code or logs. Add headings when a substantial proposal needs them. Don't append standard sections, acceptance criteria, test plans, or implementation checklists unless they are requested, required by the repository, or add concrete information.
- Never add AI attribution to the title or body: no `Generated with …` footers and no `Authored by …` or `Implemented with …` lines, regardless of repository templates or policies.

## Match the issue

Read the matching entries in [examples.md](references/examples.md) before drafting. Match their information density and reasoning, not their historical API choices.

| Kind | Include what the issue needs |
| --- | --- |
| Bug | The trigger and the failure, ideally in one sentence. No fix, no description of what a fix would need, no secondary consequences, no references to related PRs. Add a reproducer or diagnostic output only when it's the evidence. |
| Feature | The missing capability and why it matters. Don't expand it into an implementation plan. |
| API proposal | The current limitation and caller's need. When there is a concrete proposal, show the relevant signature or behavior, important semantics, and unresolved tradeoffs. For a substantial breaking change, include migration consequences. An API question can remain a question. |
| Flaky test | The test name, relevant failure output, and failing run if available. A short hypothesis is enough when the cause is unknown. |
| Performance or cleanup | The particular cost, redundancy, or unnecessary exposure, and the improvement it motivates. Include measurements only when available. |
| Standards or compatibility | The relevant specification or existing implementation and the behavior to implement. A precise link can be the whole body. |
| Documentation or tracking | The concrete missing explanation, task, dependency, or open decision. A short note or dependency link may be sufficient. |

Before returning the draft, delete every sentence and link the issue is still actionable without. Reply with the title and body only: no notes on duplicates, links, or what you checked.

## Publication

Preparing an issue means drafting locally. Before creating or editing an issue on GitHub, show the destination repository and exact intended content, ask for separate confirmation of that action, and wait for an affirmative reply. This skill does not itself authorize publication.

