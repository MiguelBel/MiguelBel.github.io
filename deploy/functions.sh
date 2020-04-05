check_local_changes () {
  CHANGED=$(git diff-index --name-only HEAD --)

  git status

  if [ -n "$CHANGED" ]; then
    echo "[ERROR] You cannot deploy with pending changes"
    exit 1
  fi
}

build_project () {
  echo 'Building site'
  docker-compose run app jekyll build
}

check_local_links () {
  echo 'Checking for local broken links'
  docker-compose run app htmlproofer --checks-to-ignore=ImageCheck --internal-domains localhost --disable-external ./_site

  if [ $? -ne 0 ] ; then
    echo "[ERROR] Broken link"
    exit 1
  fi
}

sync_origin_repository () {
  echo 'Synching repository'
  git push origin master -f
}

release_production_build() {
  echo 'Switching to build branch'
  git branch -D build || true
  git checkout -b build
  git merge master

  sed '/_site\//d' ./.gitignore

  git add -f _site/.
  git commit -m 'Just another deploy'
  git push eyl build:master -f

  echo 'Switching to master branch'
  git checkout master
  git branch -D build || true
}

run_smoke_test() {
  echo 'Checking if the site is up'
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" $url)

  if [ $STATUS == '200' ]; then
    echo "Server responded successfully"
  else
    echo "[ERROR] Server responded with: $status"
    exit 1
  fi

  string="I'm Miguel"
  if curl -s $url | grep -q "$string"; then
    echo "Response contains the expected string"
  else
    echo "[ERROR] Expected '$string' not found"
    exit 1
  fi
}