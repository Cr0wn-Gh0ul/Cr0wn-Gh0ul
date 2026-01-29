#!/bin/bash
# Build and deploy Hugo site to gh-pages branch

set -e

# Build the site
hugo

cd public

# Use existing git repo, or init if missing
if [ ! -d .git ]; then
  git init
  git remote add origin https://github.com/Cr0wn-Gh0ul/Cr0wn-Gh0ul.git
fi

git checkout -B gh-pages
git add .
git commit -m "Deploy Hugo site to GitHub Pages" || echo "No changes to commit"
git push --force origin gh-pages

echo "Deployed to gh-pages branch."
