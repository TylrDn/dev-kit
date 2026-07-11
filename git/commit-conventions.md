# Git Commit Conventions

Follows [Conventional Commits](https://www.conventionalcommits.org/) spec.

## Format

```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

## Types

| Type | When to use |
|------|-------------|
| `feat` | New feature or capability |
| `fix` | Bug fix |
| `chore` | Build process, dependency updates, tooling |
| `docs` | Documentation only |
| `style` | Formatting, whitespace (no logic change) |
| `refactor` | Code restructure (no feature/fix) |
| `perf` | Performance improvement |
| `test` | Adding or updating tests |
| `ci` | CI/CD pipeline changes |
| `revert` | Reverting a previous commit |

## Examples

```bash
feat(auth): add OAuth2 Google login
fix(api): handle null response from user endpoint
chore: update bun to 1.2.0
docs(readme): add deployment section
refactor(db): extract query helpers into utils
```

## Rules

- Subject line max **72 characters**
- Subject in **imperative mood** ("add" not "added" or "adds")
- No period at end of subject
- Scope is optional but recommended for monorepos
- Breaking changes: add `!` after type (`feat!:`) and `BREAKING CHANGE:` in footer
