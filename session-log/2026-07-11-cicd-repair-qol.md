# 2026-07-11 — CI/CD Repair and QoL Improvements

**Repo**: TylrDn/dev-kit
**Agent**: GitHub Copilot (cloud agent)
**Branch**: current working branch → PR to `main`

---

## What Was Done

Comprehensive CI/CD repair and quality-of-life improvements prompted by the lack
of any actual `.github/workflows/` enforcement in dev-kit (despite having a `ci-templates/`
directory) and several shellcheck issues and stack inconsistencies.

---

## Changes

### 1. Created `.github/workflows/` (4 new workflows)

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `shellcheck.yml` | PR touching `scripts/**` or `git/hooks/**` | Lints all shell scripts with shellcheck |
| `pr-title-check.yml` | Every PR (open/edit/sync/reopen) | Enforces Conventional Commits on PR titles |
| `validate-docs.yml` | PR touching `agent/**` | Warns if no same-day session-log entry exists |
| `doc-freshness.yml` | Weekly cron (Mon 09:00 UTC) + manual | Flags agent docs with `last_reviewed` older than 90 days |

Mirrors the governance workflows added to TylrDn/CODE in PR #2, adapted for dev-kit's
structure (scripts/ instead of bootstrap.sh only, dev-kit-specific paths).

### 2. Fixed `ci-templates/`

- `lint.yml` — switched from `npm ci` / `npm run lint` → Bun (`oven-sh/setup-bun@v2`,
  `bun install --frozen-lockfile`, `bun run lint`). Added `permissions: contents: read`.
  Added npm fallback comment. The stack is entirely Bun; npm was wrong.
- `test.yml` — Node 20 → 22 (was missed in the previous audit pass).
- `bun-test.yml` — new template: Bun-native test runner using `bun test`.
- `README.md` — updated table and prerequisites to reflect all three templates.

### 3. Fixed shell scripts (all now pass `shellcheck`)

| Script | Fix |
|--------|-----|
| `scripts/bootstrap.sh` | `#!/bin/bash` → `#!/usr/bin/env bash`; `set -e` → `set -euo pipefail`; used `$src` variable that was assigned but unused (SC2034) |
| `scripts/new-project.sh` | `#!/bin/bash` → `#!/usr/bin/env bash`; `set -e` → `set -euo pipefail`; `SCRIPT_DIR`/`REPO_DIR` for script-relative linting paths; added `*` catch for unknown template with helpful error |
| `scripts/setup.sh` | Suppressed SC2043 on single-item loop; added pre-commit hook auto-installation at end of setup |
| `git/hooks/pre-commit` | `npx lint-staged` → `bunx lint-staged` (stack is Bun, not npm) |

### 4. Improved PR template

- Reordered checklist (conventions first)
- Added `(if applicable)` qualifiers for lint/build (dev-kit is not a JS project)
- Added `session-log entry created` checkbox
- Added `review-protocol.md` link as a checklist item

---

## Verification

- `shellcheck scripts/*.sh git/hooks/*` — all clean after fixes
- All YAML workflows validated locally against CODE equivalents

---

## Commit

`ci: add workflows, fix scripts and ci-templates for dev-kit`
