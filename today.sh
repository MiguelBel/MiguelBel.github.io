tracked_files=$(git diff --name-only)
untracked_files=$(git ls-files --others --exclude-standard)

for f in $tracked_files $untracked_files
do
  if [[ $f == *"_posts/20"* ]]; then
    year=$(date +"%Y")
    month=$(date +"%m")
    day=$(date +"%d")
    end_file=${f/20*-*-*-/$year-$month-$day-}
    echo "Moving $f to $end_file"

    mv $f $end_file

    echo "moved"
  fi
done
