#!/bin/bash
# new-project.sh — Scaffolds a new project with dev-kit standards
# Usage: bash scripts/new-project.sh <project-name> [next|expo|vanilla]

set -e
PROJECT_NAME=$1
TEMPLATE=${2:-next}

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: bash new-project.sh <project-name> [next|expo|vanilla]"
  exit 1
fi

echo "🚀 Creating project: $PROJECT_NAME (template: $TEMPLATE)"

case $TEMPLATE in
  next)
    bunx create-next-app@latest "$PROJECT_NAME" \
      --typescript --tailwind --eslint --app --src-dir --use-bun
    ;;
  expo)
    bunx create-expo-app "$PROJECT_NAME" --template blank-typescript
    ;;
  vanilla)
    mkdir -p "$PROJECT_NAME"/{src,public}
    echo '{"name":"'"$PROJECT_NAME"'","version":"0.1.0","private":true}' > "$PROJECT_NAME/package.json"
    ;;
esac

# Copy linting configs
cp linting/.prettierrc "$PROJECT_NAME/.prettierrc"
cp linting/.eslintrc.typescript.js "$PROJECT_NAME/.eslintrc.js" 2>/dev/null || true

echo "✅ Project $PROJECT_NAME created."
