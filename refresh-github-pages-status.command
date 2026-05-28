#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/32_github_pages_publish/publish-status.md"
OWNER="Johnnycrypto289"
REPO="mivvlet-site"
URL="https://johnnycrypto289.github.io/mivvlet-site/"

{
  printf "# Mivvlet GitHub Pages Status\n\n"
  printf "Generated: %s.\n\n" "$(date '+%Y-%m-%d %H:%M:%S %Z')"
  printf "## Repository\n\n"
  if gh repo view "$OWNER/$REPO" --json nameWithOwner,visibility,url,defaultBranchRef >/tmp/mivvlet-gh-repo.json 2>/tmp/mivvlet-gh-repo.err; then
    printf "\`\`\`json\n"
    cat /tmp/mivvlet-gh-repo.json
    printf "\n\`\`\`\n\n"
  else
    printf "Repository check failed:\n\n\`\`\`\n"
    cat /tmp/mivvlet-gh-repo.err
    printf "\n\`\`\`\n\n"
  fi

  printf "## Pages\n\n"
  if gh api "repos/$OWNER/$REPO/pages" >/tmp/mivvlet-gh-pages.json 2>/tmp/mivvlet-gh-pages.err; then
    printf "\`\`\`json\n"
    cat /tmp/mivvlet-gh-pages.json
    printf "\n\`\`\`\n\n"
  else
    printf "Pages check failed:\n\n\`\`\`\n"
    cat /tmp/mivvlet-gh-pages.err
    printf "\n\`\`\`\n\n"
  fi

  printf "## Live URL\n\n"
  printf "URL: %s\n\n" "$URL"
  printf "\`\`\`\n"
  curl -sS -I -L --max-time 30 "$URL" 2>&1 | sed -n '1,20p' || true
  printf "\`\`\`\n"
} > "$OUT"

printf "Wrote %s\n" "$OUT"
