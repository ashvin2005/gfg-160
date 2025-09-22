#!/bin/bash

# Script to create a new day's folder structure
# Usage: ./create-day.sh <day-number>

if [ $# -eq 0 ]; then
    echo "Usage: ./create-day.sh <day-number>"
    echo "Example: ./create-day.sh 1"
    exit 1
fi

DAY_NUM=$(printf "%03d" $1)
DAY_DIR="solutions/day-$DAY_NUM"

# Create day directory
mkdir -p "$DAY_DIR"

echo "📁 Created directory: $DAY_DIR"

# Create problem file
cat > "$DAY_DIR/problem.md" << EOF
# Day $1 - Problem Title

## Problem Statement
[Add the problem statement here]

## Examples

### Example 1:
\`\`\`
Input: 
Output: 
Explanation: 
\`\`\`

### Example 2:
\`\`\`
Input: 
Output: 
Explanation: 
\`\`\`

## Constraints
- [Add constraints here]

## Topics
- [Add relevant topics/tags]

## Difficulty
- [ ] Easy
- [ ] Medium  
- [ ] Hard

## Approach
[Describe your approach and thought process]

## Time Complexity
- **Time**: O()
- **Space**: O()

## Links
- [GeeksforGeeks Problem](URL)
- [Additional Resources](URL)
EOF

# Create solution files for different languages
cp templates/solution-template.py "$DAY_DIR/solution.py"
cp templates/solution-template.java "$DAY_DIR/solution.java"
cp templates/solution-template.cpp "$DAY_DIR/solution.cpp"
cp templates/solution-template.js "$DAY_DIR/solution.js"

echo "📝 Created problem.md and solution templates"
echo "🎯 Ready to solve Day $1 problem!"
echo ""
echo "Next steps:"
echo "1. Update $DAY_DIR/problem.md with the actual problem"
echo "2. Implement your solution in your preferred language"
echo "3. Run: ./scripts/push-daily.sh $1 'Problem Title'"
