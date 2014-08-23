##General workflow:

work in your own feature branch!

git add -A
git commit -m “”
git checkout MASTER
git pull (updates MASTER, not FEATURE)
git checkout FEATURE
git rebase master (will pull in MASTER changes and also put their new FEATURE branch on top of the MASTER head.)
