# Git Conventions

See [git/commit-conventions.md](../git/commit-conventions.md) for full commit format.

## Branch Naming

```
<type>/<short-description>
```

| Pattern | Example |
|---------|---------|
| `feat/<name>` | `feat/auth-flow` |
| `fix/<name>` | `fix/login-redirect` |
| `chore/<name>` | `chore/bump-deps` |
| `docs/<name>` | `docs/readme-update` |
| `hotfix/<name>` | `hotfix/null-crash` |

## Workflow

```
main  ←── protected, deployable at all times
  └── feat/my-feature  ←── PR → squash merge into main
```

- **No direct pushes to `main`** — always PR
- **Squash merge** PRs to keep history clean
- **Delete branch after merge**
- **Rebase** feature branches on main before PR, not merge commits

## PR Checklist

- [ ] Branch name follows convention
- [ ] Commits follow Conventional Commits
- [ ] `bun run lint` passes
- [ ] `bun run build` passes
- [ ] PR description explains *what* and *why*
- [ ] Screenshots for UI changes
