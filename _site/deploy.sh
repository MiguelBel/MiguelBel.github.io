branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
branch_name=${branch_name##refs/heads/}

if [ $branch_name = "master" ]; then
  git add .
  git diff --cached --exit-code
  if [ $? = 0 ]; then
    echo 'Deploying...'
    echo 'Synching repository'
    git pull origin master
    git push origin master
    echo 'Generating build to be deployed'
    git checkout get-rid-github-pages
    git merge master
    docker-compose run app jekyll build
    git add .
    git commit -m 'Automatic deploy'
    git push eyl get-rid-github-pages -f
    git checkout master
    echo 'Done'
  else
    echo '[ERROR] Something is pending to be commited'
  fi
else
  echo 'Deploy script must be run in master'
fi