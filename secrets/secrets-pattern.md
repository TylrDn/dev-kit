# Secrets Management

> ⚠️ No real secrets are ever committed to this repo. This doc covers patterns only.

## Principles

1. **Never commit secrets** — Use `.env` locally, excluded by `.gitignore_global`
2. **Always provide `.env.example`** — Document all required env vars with dummy values
3. **Production secrets via Vault or hosted secret store** — Not in CI env vars directly
4. **Rotate on leak** — Assume any committed secret is compromised

## Local Development

```bash
# .env.example (committed — shows shape, no real values)
NEXT_PUBLIC_APP_URL=http://localhost:3000
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
NEXTAUTH_SECRET=your-nextauth-secret
NEXTAUTH_URL=http://localhost:3000
```

## Tools

| Tool | Use Case |
|------|----------|
| `dotenv-vault` | Sync `.env` across machines securely |
| `1Password CLI` | Pull secrets into shell without storing locally |
| Vercel Environment Variables | Production/preview secrets for deployed apps |
| GitHub Actions Secrets | CI/CD pipeline secrets |

## 1Password CLI Pattern

```bash
# Inject secrets at runtime without storing in .env
op run --env-file .env.template -- bun run dev
```
