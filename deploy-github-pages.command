#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SITE="$ROOT/32_github_pages_publish"
OWNER="Johnnycrypto289"
REPO="mivvlet-site"
REMOTE="https://github.com/$OWNER/$REPO.git"

cd "$SITE"

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add .
if git diff --cached --quiet; then
  printf "No public site changes to commit.\n"
else
  git commit -m "Publish Mivvlet launch site"
fi

if ! gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  gh repo create "$OWNER/$REPO" --public --source "$SITE" --remote origin --push --description "Public launch site for Mivvlet"
else
  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "$REMOTE"
  else
    git remote set-url origin "$REMOTE"
  fi
  git push -u origin main
fi

if gh api "repos/$OWNER/$REPO/pages" >/dev/null 2>&1; then
  gh api --method PUT "repos/$OWNER/$REPO/pages" \
    -f "source[branch]=main" \
    -f "source[path]=/" >/dev/null
else
  gh api --method POST "repos/$OWNER/$REPO/pages" \
    -f "source[branch]=main" \
    -f "source[path]=/" >/dev/null
fi

printf "GitHub Pages requested for https://$OWNER.github.io/$REPO/\n"
