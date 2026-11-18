#!/bin/sh
# Usage: ./git-command.sh "Describe what changed"
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 \"commit message\"" >&2
  exit 1
fi

echo "Add files and do local commit"
git add .
echo "Checking status"
git status
git commit -m "$*"

echo "Pushing to GitHub repository"
git push -u origin master
