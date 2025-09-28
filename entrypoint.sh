#!/bin/bash
set -e

echo "==========================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

cd /github/workspace

python3 /app/feed.py

# Commit and push if there are changes
git add -A
if ! git diff --cached --quiet; then
  git commit -m "Update feed"
  git push --set-upstream origin main
else
  echo "No changes to commit"
fi
echo "==========================="
