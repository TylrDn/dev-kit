# CI Templates

Reusable GitHub Actions workflow templates. Copy the relevant files into your
project's `.github/workflows/` directory — they are not imported automatically.

## Available Templates

| File | Purpose |
|------|---------|
| `lint.yml` | Runs ESLint on push and PR to `main` |
| `test.yml` | Stub workflow for running tests (update once runner is chosen) |

## Usage

```bash
# From the root of your project
mkdir -p .github/workflows
cp ~/dev-kit/ci-templates/lint.yml .github/workflows/lint.yml
cp ~/dev-kit/ci-templates/test.yml .github/workflows/test.yml
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

### test.yml

- `package.json` must include a `test` script pointing to your chosen runner.
- Update the workflow's test step if you use a runner with a different invocation
  (e.g., `bunx vitest run` instead of `npm test`).

## Secrets / Variables

Neither template requires secrets by default. If your test suite needs
environment variables (e.g., a database URL), add them as
[GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
and inject them via `env:` in the relevant step. See
[`secrets/secrets-pattern.md`](../secrets/secrets-pattern.md) for the
project-wide secrets management approach.
