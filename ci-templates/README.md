# CI Templates

Reusable GitHub Actions workflow templates. Copy the relevant files into your
project's `.github/workflows/` directory — they are not imported automatically.

## Available Templates

| File | Purpose |
|------|---------|
| `lint.yml` | Runs ESLint via Bun on push and PR to `main` |
| `bun-test.yml` | Runs `bun test` on push and PR to `main` |
| `test.yml` | Stub for npm-based test runners (update once runner is chosen) |

## Usage

```bash
# From the root of your project
mkdir -p .github/workflows
cp ~/dev-kit/ci-templates/lint.yml .github/workflows/lint.yml
cp ~/dev-kit/ci-templates/bun-test.yml .github/workflows/test.yml
```

Then commit and push — GitHub Actions will pick them up automatically.

## Prerequisites

### lint.yml

- `package.json` must include a `lint` script, e.g.:
  ```json
  "scripts": {
    "lint": "eslint . --ext .js,.ts,.tsx"
  }
  ```
- ESLint config should extend one of the base configs from `/linting/`:
  - `linting/.eslintrc.base.js` — JavaScript projects
  - `linting/.eslintrc.typescript.js` — TypeScript projects

### bun-test.yml

- `package.json` must include a `test` script.
- Defaults to `bun test` — update the run step if you use Vitest:
  ```yaml
  run: bunx vitest run
  ```

### test.yml (npm fallback)

- `package.json` must include a `test` script pointing to your chosen runner.
- Uses Node 22. Replace `npm ci` / `npm test` with your preferred commands if
  not using npm.

## Secrets / Variables

None of these templates require secrets by default. If your test suite needs
environment variables (e.g., a database URL), add them as
[GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
and inject them via `env:` in the relevant step. See
[`secrets/secrets-pattern.md`](../secrets/secrets-pattern.md) for the
project-wide secrets management approach.
