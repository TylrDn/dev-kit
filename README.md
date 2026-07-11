# 🛠 dev-kit

Personal developer environment, tooling configs, and standards. This repo is the source of truth for how Tyler's dev environment is set up — dotfiles, editor config, git standards, scripts, and secrets management patterns.

## Structure

```
dev-kit/
├── dotfiles/          # Shell config, aliases, .zshrc, .gitconfig
├── vscode/            # settings.json, extensions list, keybindings
├── scripts/           # Bootstrap, install, and utility scripts
├── git/               # Global git config, hooks, commit conventions
├── linting/           # ESLint, Prettier, Stylelint base configs
├── secrets/           # Secrets management patterns (no real secrets stored)
└── docs/              # Runbooks and setup guides
```

## Quick Start

```bash
# Clone and run bootstrap
git clone https://github.com/TylrDn/dev-kit.git ~/dev-kit
cd ~/dev-kit
bash scripts/bootstrap.sh
```

## Docs

- [Environment Setup](docs/environment-setup.md)
- [Git Conventions](docs/git-conventions.md)
- [Secrets Management](docs/secrets-management.md)
- [VS Code Setup](docs/vscode-setup.md)
