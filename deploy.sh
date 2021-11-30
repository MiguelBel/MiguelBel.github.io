set -e

branch_name="$(git symbolic-ref HEAD 2>/dev/null)" branch_name=${branch_name##refs/heads/}
url='http://miguel.im'

source deploy/functions.sh

if [ $branch_name = "master" ]; then
  echo 'Deploying...'

  check_local_changes
  build_project
  check_local_links
  sync_origin_repository
  run_smoke_test

  echo '[SUCCESS] Done'
else
  echo 'Deploy script must be run in master'
fi
