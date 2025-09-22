#!/bin/bash

# Daily push script for GfG 160 Days Challenge
# Usage: ./push_daily.sh "Day XXX: Problem description"

if [ $# -eq 0 ]; then
    echo "Usage: ./push_daily.sh \"Day XXX: Problem description\""
    exit 1
fi

commit_message="$1"

echo "🚀 Starting daily push..."

# Add all changes
git add .

# Commit with the provided message
git commit -m "$commit_message"

# Push to GitHub
git push origin main

echo "✅ Successfully pushed to GitHub!"
echo "📝 Commit message: $commit_message"
