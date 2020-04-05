branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
branch_name=${branch_name##refs/heads/}

if [ $branch_name = "master" ]; then
  echo 'Deploying...'
  CHANGED=$(git diff-index --name-only HEAD --)

  git status

  if [ -n "$CHANGED" ]; then
    echo "[ERROR] You cannot deploy with pending changes"
    exit 1
  fi

  echo 'Building site'
  docker-compose run app jekyll build

  echo 'Checking for local broken links'
  docker-compose run app htmlproofer --checks-to-ignore=ImageCheck --internal-domains localhost --disable-external ./_site
  if [ $? -ne 0 ] ; then echo "[ERROR] Broken link" ; exit 1; fi

  echo 'Synching repository'
  git push origin master -f

  echo 'Switching to build branch'
  git checkout build
  git add .
  git commit -m 'Just another deploy'
  git push eyl master -f

  echo 'Switching to master branch'
  git checkout master

  echo 'Done'
else
  echo 'Deploy script must be run in master'
fi