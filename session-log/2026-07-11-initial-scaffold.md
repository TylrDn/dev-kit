# 2026-07-11 — Initial Scaffold

**Repo**: TylrDn/dev-kit
**Agent**: GitHub Copilot (cloud agent)
**Branch**: `chore/scaffold-dev-kit` → PR to `main`

---

## What Was Done

Scaffolded `dev-kit` from the spec in `TylrDn/CODE/repo-index/dev-kit.md`.

### Files Added

| File | Description |
|------|-------------|
| `.github/copilot-instructions.md` | Copilot session context for this repo |
| `git/.gitconfig` | Git alias templates and signing config (no real email/keys) |
| `git/.gitignore_global` | Global ignore rules (DS_Store, .env, node_modules, etc.) |
| `dotfiles/.env.example` | Template for local secrets (no real values) |
| `agent/agent-init-block.md` | Copied from TylrDn/CODE/agent/agent-init-block.md |
| `agent/review-protocol.md` | Copied from TylrDn/CODE/agent/review-protocol.md |
| `agent/commit-conventions.md` | Copied from TylrDn/CODE/agent/commit-conventions.md |
| `scripts/setup.sh` | Symlinks dotfiles and installs VS Code/Cursor extensions |
| `scripts/health-check.sh` | Verifies node, git, gh CLI, expo, cursor/code are present |
| `session-log/.gitkeep` | Placeholder to track session-log/ directory in git |

### Already Present (not modified)

- `dotfiles/.gitconfig`, `dotfiles/.gitignore_global`, `dotfiles/.zshrc`
- `vscode/extensions.json`, `vscode/settings.json`
- `scripts/bootstrap.sh`, `scripts/new-project.sh`
- `git/commit-conventions.md`, `git/hooks/`
- `.github/PULL_REQUEST_TEMPLATE.md`

---

## Notes

- `agent/` directory mirrors `TylrDn/CODE/agent/` — treat CODE as source of truth and sync manually when CODE's agent docs are updated
- `git/.gitconfig` and `git/.gitignore_global` are the canonical locations per spec; `dotfiles/` copies remain for backward compatibility with `scripts/bootstrap.sh`
- No real credentials, tokens, or keys were added in any file

---

## Commit

`chore: initial scaffold from TylrDn/CODE dev-kit spec`
