#!/usr/bin/env bash
# bootstrap.sh — Sets up Tyler's dev environment from scratch
# Run: bash scripts/bootstrap.sh

set -euo pipefail
echo "🛠 Starting dev-kit bootstrap..."

# ── Homebrew ──────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "→ Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✓ Homebrew already installed"
fi

# ── Core tools ────────────────────────────────────────────────────────────────
echo "→ Installing core tools..."
brew install git starship delta gh

# ── Bun ───────────────────────────────────────────────────────────────────────
if ! command -v bun &>/dev/null; then
  echo "→ Installing Bun..."
  curl -fsSL https://bun.sh/install | bash
else
  echo "✓ Bun already installed: $(bun --version)"
fi

# ── Symlink dotfiles ──────────────────────────────────────────────────────────
DOTFILES_DIR="$(cd "$(dirname "$0")/../dotfiles" && pwd)"
echo "→ Symlinking dotfiles from $DOTFILES_DIR..."

for file in .zshrc .gitconfig .gitignore_global; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"
  if [ -f "$dest" ] && [ ! -L "$dest" ]; then
    echo "  Backing up existing $dest → $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sf "$src" "$dest"
  echo "  Linked $file"
done

git config --global core.excludesfile ~/.gitignore_global

# ── VS Code extensions ────────────────────────────────────────────────────────
if command -v cursor &>/dev/null; then
  echo "→ Installing Cursor extensions..."
  while IFS= read -r ext; do
    [[ "$ext" =~ ^//.*$ || -z "$ext" ]] && continue
    cursor --install-extension "$ext" 2>/dev/null || true
  done < <(node -e "const f=require('./vscode/extensions.json');f.recommendations.forEach(e=>console.log(e))")
fi

echo ""
echo "✅ Bootstrap complete. Restart your terminal."
