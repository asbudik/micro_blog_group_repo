# TO GET STARTED:
* DO NOT FORK, "git clone" from this branch: https://github.com/asbudik/micro_blog_group_repo
* follow the "general workflow"

*  DO NOT MAKE A PULL REQUEST. (PULL REQUESTS ARE FROM FORKED REPOS TO THEIR ORIGINAL REPOS. WE SHOULD NOT BE WORKING ON FORKED REPOS.)

## General workflow: 
by "feature" we mean "feature_branch_YourName"

* "git checkout -b feature"  to go to feature (-b is only necessary first time when you are creating you branch)
*  make changes in feature 
*  "git add -A"
*  "git commit -m "description of the commit" "
*  in our feature "git push origin feature" to update the feature on github 

*(git push -u origin feature on the first time you push!!!)

*  "git checkout master" to go back to master 
*  "git pull" to synchronize master with github 
*  "git checkout feature" to go back to feature
*  "git rebase master" to synchronize feature with the master.
