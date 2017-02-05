#!/bin/sh

echo "Staging changes..."
git ls-files -o --exclude-standard | xargs -d '\n' git add 
echo "Committing..."
commitNum=$(git log master --pretty=oneline | wc -l)
git commit -m "Commit #"$((commitNum + 1))
echo "Removing unwanted changes..."
git clean -df
git checkout -- .
echo "Pulling from remote repository..."
git pull --rebase origin
echo "Done Pulling."

echo "Staging changes..."
git ls-files -o --exclude-standard | xargs -d '\n' git add 
echo "Committing..."
commitNum=$(git log master --pretty=oneline | wc -l)
git commit -m "Commit #"$((commitNum + 1))
echo "Removing unwanted changes..."
git clean -df
git checkout -- .
echo "Pushing to remote repository..."
git push origin master
echo "Done!"
read
