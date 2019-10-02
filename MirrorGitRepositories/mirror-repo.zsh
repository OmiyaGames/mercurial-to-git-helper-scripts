#!/bin/zsh

export IFS=","
cat "$1" | while read d o n; do
#  echo "git clone --mirror \"$o\" \"$d\";"
  git clone --mirror "$o" "$d";
#  echo "cd \"$d\";"
  cd "$d";
#  echo "git push --mirror \"$n\";"
  git push --mirror "$n";
#  echo "cd ..;"
  cd ..;
done
