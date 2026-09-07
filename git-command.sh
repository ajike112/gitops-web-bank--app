
#!/bin/sh

echo "Add files and do local commit"
git add .
echo "checking status"
git status
git commit -am "Add IRSA service account and update deployment.yaml manifest"

echo "Pushing to Github Repository"
git push -u origin master
