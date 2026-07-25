---
name: prepare-release-notes
description: Prepare or update concise release notes for the next release by matching the current repository's established release style and curating the meaningful changes since the previous release. Use when asked to draft release notes, summarize an upcoming release, incorporate specific pull requests, or write release notes to a Markdown file.
---

# Prepare Release Notes

## Establish the release scope

1. Identify the repository and the release baseline. Use the latest stable release unless the user specifies a tag, branch, or comparison range.
2. Include changes merged after that baseline.
3. Include unmerged pull requests only when the user explicitly says to assume they will merge.
4. Preserve unrelated worktree changes.

## Learn the repository's style

Inspect two or three recent release descriptions or checked-in release-note files before drafting. Match their:

- tone and level of detail;
- introduction and section headings;
- bullet and link style;
- terminology and capitalization;
- handling of contributors and breaking changes.

Do not impose a generic template when the repository already has a recognizable style.

If the hosting platform auto-generates a changelog, write only the curated release notes. Do not reproduce the generated changelog.

## Build the change inventory

Use local tags, commit history, diffs, and repository-host metadata to map changes to pull requests. Inspect the important pull requests and their patches; titles and generated summaries alone are not sufficient evidence.

Describe the net change from the previous release, not the sequence of development commits:

- collapse implementation, rename, and follow-up pull requests into the final API or behavior;
- use the names and semantics that will exist at release time;
- account for stacked pull requests and explicitly assumed merges;
- do not call an intermediate API rename a breaking change when neither name appeared in a release.

## Curate instead of cataloging

Include:

- meaningful user-facing features and APIs;
- breaking API, configuration, protocol, schema, or output-format changes;
- important correctness, interoperability, security, and reliability fixes;
- substantial, measured performance improvements.

Usually omit:

- CI and dependency maintenance;
- test-only and flaky-test fixes;
- internal refactors with no user-visible effect;
- mechanical renames that only affect unreleased code;
- minor documentation and cleanup changes.

Link only pull requests that materially support the curated notes. Give independently meaningful fixes their own bullets. Combine pull requests only when they form one inseparable user-facing change.

## Draft the notes

Prefer a short introduction followed by only the sections the release needs, commonly:

- feature highlights;
- `## Breaking Changes`;
- `## Notable Fixes`.

Do not add empty sections. Do not add a release number, date, full comparison link, or contributor section unless the repository's style or the user calls for it.

Write concise bullets that lead with user impact. Use exact exported identifiers, protocol versions, wire fields, and error names where they help users migrate.

## Verify and deliver

Before writing the file:

1. Check every claim against the final code or pull-request patch.
2. Verify pull-request links and any performance numbers.
3. Confirm that assumed merges are treated as assumptions and all other changes actually landed.
4. Read the finished notes once as a release consumer, removing changelog noise and development history.

Write to the requested Markdown path. If none is given, use `release-notes.md` in the repository root. Do not modify code or generate a changelog.
