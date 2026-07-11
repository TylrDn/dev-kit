# ~/.zshrc — Tyler's shell config
# Managed via dev-kit: https://github.com/TylrDn/dev-kit

# ── Path ──────────────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"    # Apple Silicon Homebrew

# ── Node / NVM ────────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ── Bun ───────────────────────────────────────────────────────────────────────
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ── Aliases ───────────────────────────────────────────────────────────────────
alias dev="bun run dev"
alias build="bun run build"
alias lint="bun run lint"
alias fmt="bun run format"
alias cls="clear"
alias ll="ls -la"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias glog="git log --oneline --decorate --graph"

# ── Functions ─────────────────────────────────────────────────────────────────
# Quick new branch from current
newbranch() { git checkout -b "$1" && echo "Switched to new branch: $1"; }

# Kill port
killport() { lsof -ti:"$1" | xargs kill -9 && echo "Killed port $1"; }

# Open project in Cursor
code() { cursor "$@"; }

# ── Prompt (starship) ─────────────────────────────────────────────────────────
eval "$(starship init zsh)"
