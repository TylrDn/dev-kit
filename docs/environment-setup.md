# Environment Setup

Full dev environment setup guide for a new Mac.

## Prerequisites

- macOS 14+ (Sonoma or later)
- Apple Silicon (M-series) recommended
- Xcode Command Line Tools: `xcode-select --install`

## Automated Setup

```bash
git clone https://github.com/TylrDn/dev-kit.git ~/dev-kit
cd ~/dev-kit
bash scripts/bootstrap.sh
```

The bootstrap script installs and configures:
- Homebrew + core CLI tools
- Bun (JS runtime + package manager)
- Starship prompt
- Delta (better git diffs)
- GitHub CLI (`gh`)
- Symlinks all dotfiles
- Installs Cursor extensions

## Manual Steps (post-bootstrap)

1. **Set git email**: Edit `~/dev-kit/dotfiles/.gitconfig` → replace `YOUR_EMAIL_HERE`
2. **Authenticate GitHub CLI**: `gh auth login`
3. **Install Cursor**: https://cursor.com
4. **Install Bun globally**: Already done by bootstrap, verify with `bun --version`

## Runtime Versions

| Tool | Version | Manager |
|------|---------|----------|
| Node.js | 22 LTS | nvm or bun |
| Bun | latest | direct |
| TypeScript | 5.x | per-project |
| pnpm | — | prefer bun |

## Recommended Global Installs

```bash
bun install -g typescript ts-node tsx
bun install -g vercel
bun install -g expo-cli
```
