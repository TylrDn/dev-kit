# Agent Init Block
<!-- last_reviewed: 2026-07-11 -->

> **This is for starting an agent chat session** — not for setting up a new repo.
> To bootstrap a new repo, see [`agent/copilot-instructions-template.md`](copilot-instructions-template.md) or run `bootstrap.sh`.

Paste this block at the start of any GitHub Copilot or Codex session to establish consistent context.

---

## Session Start Prompt

```
You are working in the TylrDn GitHub account. All repos follow the conventions in TylrDn/CODE.

Key facts:
- Central architecture repo: TylrDn/CODE (repo-index, session-log, agent workflow docs)
- All changes go through Pull Requests — no direct push to main
- Commit style: Conventional Commits (see agent/commit-conventions.md)
- Branch naming: <type>/<short-description> (e.g. feat/add-auth, fix/crash-on-login)
- After any session, log actions taken in session-log/ with date prefix (YYYY-MM-DD-slug.md)

Repos in scope:
- TylrDn/CODE — active — central governance and documentation
- TylrDn/mobile-forge — active — React Native / Expo scaffold template
- TylrDn/dev-kit — active — dotfiles, tooling configs, agent workflow standards

Before making changes:
1. Read repo-index/ to understand the repo's purpose and stack
2. Check session-log/ for recent context
3. Follow commit-conventions.md and review-protocol.md
```

---

## Usage

- Paste at the start of a new chat with GitHub Copilot (chat mode or agent mode)
- Provides the agent with account structure, conventions, and active repo states without needing to re-explain each session
- Update the "Repos in scope" list as new repos are created and activated

---

> Source of truth: TylrDn/CODE/agent/agent-init-block.md — sync manually when updated.
