branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
branch_name=${branch_name##refs/heads/}

if [ $branch_name = "master" ]; then
  echo 'Deploying...'
  echo 'Building site'
  docker-compose run app jekyll build
  git add .
  git commit -m 'Just another deploy'
  echo 'Synching repository'
  git push origin master -f
  git push eyl master -f
  echo 'Done'
else
  echo 'Deploy script must be run in master'
fi