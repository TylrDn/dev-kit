#!/usr/bin/env bash
# setup.sh — Symlink dev-kit dotfiles and install VS Code/Cursor extensions
# Usage: bash scripts/setup.sh

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"
GIT_DIR="$REPO_DIR/git"

echo "🔧 dev-kit setup starting..."

# ── Symlink dotfiles ──────────────────────────────────────────────────────────
echo ""
echo "→ Symlinking dotfiles from $DOTFILES_DIR..."

for file in .zshrc; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"
  if [ -f "$dest" ] && [ ! -L "$dest" ]; then
    echo "  Backing up $dest → $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sf "$src" "$dest"
  echo "  Linked $file"
done

# ── Symlink git configs ───────────────────────────────────────────────────────
echo ""
echo "→ Symlinking git configs from $GIT_DIR..."

for file in .gitconfig .gitignore_global; do
  src="$GIT_DIR/$file"
  dest="$HOME/$file"
  if [ -f "$dest" ] && [ ! -L "$dest" ]; then
    echo "  Backing up $dest → $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sf "$src" "$dest"
  echo "  Linked $file"
done

git config --global core.excludesfile "$HOME/.gitignore_global"
echo "  Set core.excludesfile → ~/.gitignore_global"

# ── Install VS Code / Cursor extensions ──────────────────────────────────────
EXTENSIONS_FILE="$REPO_DIR/vscode/extensions.json"

install_extensions() {
  local cmd=$1
  echo ""
  echo "→ Installing extensions via $cmd..."
  node -e "
    const f = require('$EXTENSIONS_FILE');
    f.recommendations.forEach(e => console.log(e));
  " | while IFS= read -r ext; do
    "$cmd" --install-extension "$ext" 2>/dev/null && echo "  Installed $ext" || echo "  Skipped $ext"
  done
}

if command -v cursor &>/dev/null; then
  install_extensions cursor
elif command -v code &>/dev/null; then
  install_extensions code
else
  echo ""
  echo "  ⚠ Neither cursor nor code found — skipping extension install"
fi

echo ""
echo "✅ Setup complete. Restart your terminal to apply shell changes."
