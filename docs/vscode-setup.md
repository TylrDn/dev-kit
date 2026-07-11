# VS Code / Cursor Setup

Cursor is the primary editor. These settings and extensions apply to both Cursor and VS Code.

## Settings Sync

Settings live in `vscode/settings.json`. To apply:

```bash
# macOS — Cursor
cp vscode/settings.json ~/Library/Application\ Support/Cursor/User/settings.json

# macOS — VS Code
cp vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

Or set up the symlink via bootstrap.sh (run once).

## Key Extensions

| Extension | Purpose |
|-----------|---------|
| Prettier | Format on save |
| ESLint | Lint JS/TS |
| Tailwind CSS IntelliSense | Class autocomplete |
| GitLens | Git blame + history |
| Error Lens | Inline error display |
| Prisma | Schema syntax + format |

Full list in `vscode/extensions.json` — install all via bootstrap.sh.

## Font

[Geist Mono](https://vercel.com/font) — download and install manually.

## Theme

Dracula Official (`dracula-theme.theme-dracula`)
