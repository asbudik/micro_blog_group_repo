# TO GET STARTED:
* DO NOT FORK, "git clone" from this branch: https://github.com/asbudik/micro_blog_group_repo
* follow the "general workflow"


## General workflow: 

* "git checkout feature"  to go to feature
*  make changes in feature 
*  "git add -A"
*  "git commit -m "description of the commit" "
*  in our feature "git push -u origin feature" to update the feature on github 
*  AFTER GETTING VERBAL APPROVAL FROM OTHERS accept the pull on github 
*  "git checkout master" to go back to master 
*  "git pull" to synchronize master with github 
*  "git checkout feature" to go back to feature
*  "git rebase master" to synchronize feature with the master.








/// disregard text below, to be edited/deleted

work in your own feature branch!

git add -A
git commit -m “”
git checkout MASTER
git pull (updates MASTER, not FEATURE)
git checkout FEATURE
git rebase master (will pull in MASTER changes and also put their new FEATURE branch on top of the MASTER head.)
