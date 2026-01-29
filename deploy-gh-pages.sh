#!/bin/bash
# Build and deploy Hugo site to gh-pages branch
set -e

# Build the site
hugo

# Go to public directory
cd public

git init

git remote add origin https://github.com/Cr0wn-Gh0ul/Cr0wn-Gh0ul.git
git checkout -b gh-pages

git add .
git commit -m "Deploy Hugo site to GitHub Pages"
git push --force origin gh-pages

echo "Deployed to gh-pages branch."
