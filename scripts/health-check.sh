#!/usr/bin/env bash
# health-check.sh — Verify required dev tools are installed and accessible
# Usage: bash scripts/health-check.sh

set -euo pipefail

PASS=0
FAIL=0

check() {
  local label=$1
  local cmd=$2
  local version_flag=${3:---version}

  if command -v "$cmd" &>/dev/null; then
    local ver
    ver=$("$cmd" "$version_flag" 2>&1 | head -n1)
    echo "  ✓ $label: $ver"
    PASS=$((PASS + 1))
  else
    echo "  ✗ $label: not found"
    FAIL=$((FAIL + 1))
  fi
}

echo "🏥 dev-kit health check"
echo ""

echo "── Core ──────────────────────────────────────────────────────────────────"
check "git"     git
check "gh"      gh
check "node"    node
check "bun"     bun
check "starship" starship

echo ""
echo "── Shell ─────────────────────────────────────────────────────────────────"
check "zsh"     zsh

echo ""
echo "── Mobile ────────────────────────────────────────────────────────────────"
check "expo"    expo version

echo ""
echo "── Editor ────────────────────────────────────────────────────────────────"
if command -v cursor &>/dev/null; then
  echo "  ✓ cursor: $(cursor --version 2>&1 | head -n1)"
  PASS=$((PASS + 1))
elif command -v code &>/dev/null; then
  echo "  ✓ code: $(code --version 2>&1 | head -n1)"
  PASS=$((PASS + 1))
else
  echo "  ✗ cursor / code: not found"
  FAIL=$((FAIL + 1))
fi

echo ""
echo "─────────────────────────────────────────────────────────────────────────"
echo "  Passed: $PASS  |  Failed: $FAIL"

if [ "$FAIL" -gt 0 ]; then
  echo ""
  echo "  ⚠ Some tools are missing. Run scripts/bootstrap.sh to install them."
  exit 1
else
  echo ""
  echo "  ✅ All checks passed."
fi
