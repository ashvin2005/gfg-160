#!/bin/bash

# Script to push daily progress to GitHub
# Usage: ./push-daily.sh <day-number> "Problem Title"

if [ $# -lt 2 ]; then
    echo "Usage: ./push-daily.sh <day-number> \"Problem Title\""
    echo "Example: ./push-daily.sh 1 \"Two Sum Problem\""
    exit 1
fi

DAY_NUM=$(printf "%03d" $1)
PROBLEM_TITLE="$2"

echo "🚀 Pushing Day $1: $PROBLEM_TITLE"

# Update README with progress
python3 scripts/update-readme.py $1 "$PROBLEM_TITLE"

# Add all files
git add .

# Commit with meaningful message
git commit -m "Day $1: $PROBLEM_TITLE

- Solved: $PROBLEM_TITLE
- Day: $1/160
- Updated progress tracking
- Added solution and documentation

#GFG160Challenge #Day$1"

# Push to GitHub
git push origin main

echo "✅ Successfully pushed Day $1 to GitHub!"
echo "📊 Progress updated in README.md"
echo "🔗 Check your repository for the latest updates"
