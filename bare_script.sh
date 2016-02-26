git status
git add .
echo "Enter your commit message followed by [ENTER]"
read commit
git commit -m "$(echo $commit)"
git push
