# Commit Conventions

> All commits across TylrDn repos follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

---

## Format

```
<type>(<optional scope>): <short description>

[optional body]

[optional footer(s)]
```

### Rules
- Subject line: ≤ 72 characters, imperative mood, no period at end
- Body: wrap at 80 characters; explain *what* and *why*, not *how*
- Footer: reference issues/PRs (`Closes #12`, `Refs #34`)

---

## Types

| Type       | When to use                                                  |
|------------|--------------------------------------------------------------|
| `feat`     | A new feature or capability                                  |
| `fix`      | A bug fix                                                    |
| `chore`    | Build process, tooling, dependency updates, scaffolding      |
| `docs`     | Documentation only changes                                   |
| `refactor` | Code change that neither fixes a bug nor adds a feature      |
| `test`     | Adding or updating tests                                     |
| `ci`       | Changes to CI/CD workflows (`.github/workflows/`)            |
| `style`    | Formatting, whitespace — no logic change                     |
| `perf`     | Performance improvement                                      |
| `revert`   | Reverting a previous commit                                  |

---

## Examples

```
feat(auth): add JWT refresh token rotation

fix(ui): prevent crash when user list is empty

chore: update expo SDK to 51.0.0

docs: add branching conventions to mobile-forge repo-index

ci: add lint step to PR workflow

chore!: drop Node 16 support

BREAKING CHANGE: minimum Node version is now 18
```

---

## Breaking Changes

Append `!` after the type/scope and add a `BREAKING CHANGE:` footer:

```
feat(api)!: rename /users endpoint to /accounts

BREAKING CHANGE: all clients must update base URL from /users to /accounts
```

---

## Branch Naming

Mirrors the commit type:

| Branch pattern  | Purpose                      |
|-----------------|------------------------------|
| `feat/<slug>`   | New feature                  |
| `fix/<slug>`    | Bug fix                      |
| `chore/<slug>`  | Tooling / maintenance        |
| `docs/<slug>`   | Documentation update         |
| `hotfix/<slug>` | Emergency production patch   |
| `release/<ver>` | Release preparation          |

---

> Source of truth: TylrDn/CODE/agent/commit-conventions.md — sync manually when updated.
