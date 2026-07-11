# Copilot Instructions — TylrDn/dev-kit

> Paste this block at the start of any GitHub Copilot or Codex session to establish consistent context.

---

## Session Start Prompt

You are working in the TylrDn GitHub account. All repos follow the conventions in TylrDn/CODE.

Key facts:
- Central architecture repo: TylrDn/CODE (repo-index, session-log, agent workflow docs)
- All changes go through Pull Requests — no direct push to main
- Commit style: Conventional Commits (see agent/commit-conventions.md)
- Branch naming: `<type>/<short-description>` (e.g. `feat/add-auth`, `fix/crash-on-login`)
- After any session, log actions taken in session-log/ with date prefix (YYYY-MM-DD-slug.md)

## This Repo: dev-kit

- **Purpose**: Personal developer environment — dotfiles, editor settings, git config, agent workflow docs
- **Stack**: Zsh · VS Code · Git · Shell scripts · nvm · rbenv
- **Entry point**: `scripts/setup.sh` — symlinks dotfiles and installs VS Code extensions
- **Health check**: `scripts/health-check.sh` — verifies node, git, gh CLI, expo are present

## Structure

```
dev-kit/
├── git/                  # Git config templates
├── vscode/               # Editor settings and extensions
├── dotfiles/             # Shell config and secret templates
├── agent/                # Agent workflow docs (mirrored from TylrDn/CODE)
├── scripts/              # Setup and utility scripts
└── session-log/          # Per-session agent logs
```

## Conventions

- Follow `agent/commit-conventions.md` for all commits
- Follow `agent/review-protocol.md` before merging any PR
- The `agent/` directory mirrors TylrDn/CODE/agent/ — treat CODE as source of truth
- Do not add real secrets, tokens, or credentials to any file
- `.env.example` is the only env file committed; real `.env` files are gitignored
