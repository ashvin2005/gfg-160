#!/bin/bash

# Simple script to push daily code to GitHub

echo "Adding files to git..."
git add .

echo "Enter commit message (or press enter for default):"
read commit_msg

if [ -z "$commit_msg" ]; then
    commit_msg="Daily coding challenge update"
fi

git commit -m "$commit_msg"
git push origin main

echo "Code pushed to GitHub!"
