branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
branch_name=${branch_name##refs/heads/}

if [ $branch_name = "master" ]; then
  echo 'Deploying...'
  echo 'Building site'
  docker-compose run app jekyll build
  docker-compose run app htmlproofer --checks-to-ignore=ImageCheck --internal-domains localhost --disable-external ./_site
  if [ $? -ne 0 ] ; then echo "[ERROR] Broken link" ; exit 1; fi
  git add .
  git commit -m 'Just another deploy'
  echo 'Synching repository'
  git push origin master -f
  git push eyl master -f
  echo 'Done'
else
  echo 'Deploy script must be run in master'
fi