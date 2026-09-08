#!/bin/bash
# ------------------------------------------------------------
#  Publish this folder to GitHub → live at
#  https://abhipatade-creator.github.io/Portfolio2026/
#  Double-click in Finder, or run:  ./publish.command "message"
# ------------------------------------------------------------
cd "$(dirname "$0")" || exit 1
REPO="https://github.com/abhipatade-creator/Portfolio2026.git"
MSG="${1:-Update site $(date '+%Y-%m-%d %H:%M')}"

echo "📁  $(pwd)"

# First run: turn this folder into a clone of the repo without losing local files
if [ ! -d .git ]; then
  echo "🔧  First run — connecting this folder to $REPO"
  git init -q -b main
  git remote add origin "$REPO"
  git fetch -q origin main || { echo "❌  Could not reach GitHub. Check internet / login."; read -p "Press Enter to close"; exit 1; }
  git reset -q --mixed origin/main          # adopt remote history, keep local files
  git checkout -q origin/main -- README.md 2>/dev/null || true   # keep the repo README
fi

git pull -q --rebase origin main 2>/dev/null || true

git add -A
if git diff --cached --quiet; then
  echo "✅  Nothing to publish — site already up to date."
else
  git commit -q -m "$MSG"
  echo "⬆️   Pushing: $MSG"
  if git push -q origin main; then
    echo "🚀  Published. Live in ~60s at https://abhipatade-creator.github.io/Portfolio2026/"
  else
    echo "❌  Push failed. If GitHub asked for a password, use a Personal Access Token"
    echo "    (github.com → Settings → Developer settings → Tokens) or run:  gh auth login"
  fi
fi
echo
read -p "Press Enter to close"
