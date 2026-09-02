
#!/bin/sh

echo "Add files and do local commit"
git add .
echo "checking status"
git status
git commit -am "pushing gitops repos, kubernetes yaml manifests and helm charts"

echo "Pushing to Github Repository"
git push -u origin master
