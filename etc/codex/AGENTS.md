# User-wide working agreements

## Filesystem layout

- The XDG base-directory layout is an intentional, fundamental property of this system.
- Before proposing or using a user-level path, inspect and honor `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME`, `XDG_CACHE_HOME`, and application-specific homes such as `CODEX_HOME`.
- Never substitute conventional paths such as `~/.config`, `~/.local/share`, `~/.local/state`, `~/.cache`, or `~/.codex` while the relevant environment variable is set.
- The current layout is: config `/home/kitty/etc`, data `/home/kitty/var/share`, state `/home/kitty/var/state`, cache `/home/kitty/var/cache`, and Codex home `/home/kitty/etc/codex`.

## Change authorization

- Treat discussion, questions, brainstorming, design, review, investigation, diagnosis, status, planning, and advice as read-only.
- Modify project files only when the user explicitly asks for a mutation or explicitly agrees to a proposed change.
- If authorization is ambiguous, describe the exact intended mutation and wait for agreement before editing.
- Once authorized, stay strictly within the agreed scope; do not add speculative features, semantics, dependencies, or unrelated refactors.
- Never add instruction, skill, agent, or metadata files to a project unless the user explicitly asks for them there.

## Writing

Never add comments to code or write prose in README files or documentation.

## Mandatory workflows

- For every task covered by a mandatory skill, the first task-specific action must be to use and read that skill completely.
- This applies to every kind of work covered by that skill, including discussion, planning, inspection, Git/history operations, documentation, builds, tests, reviews, diagnosis, design, and implementation.
- Do not inspect the relevant files, run a command, formulate a plan, or use another project skill before reading it.
- Treat every repository mutation—including commits, rebases, resets, index changes, worktrees, and ref updates—as subject to the skill’s proposal-and-approval gate.
- Remain within its workflow for the entire turn.
