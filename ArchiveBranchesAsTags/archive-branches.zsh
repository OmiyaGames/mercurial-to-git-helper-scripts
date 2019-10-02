#!/bin/zsh

export IFS=","
cat "$1" | while read b t; do
  #git checkout -b camera-effects origin/Template_-_Camera_Effects
  echo "git checkout -b \"$t\" \"origin/$b\"";
  git checkout -b "$t" "origin/$b";
  echo "----------------------------------";

  #git tag archive/<branchname> <branchname>
  echo "git tag \"archive/$t\" \"$t\"";
  git tag -a "archive/$t" "$t" -m "Archiving a closed Mercurial branch, $b";
  echo "----------------------------------";

  #git push origin <tag_name>
  echo "git push origin \"archive/$t\"";
  git push origin "archive/$t";
  echo "----------------------------------";

  #git checkout develop
  echo "git checkout develop";
  git checkout develop
  echo "----------------------------------";

  #git push <remote_name> --delete <branch_name>
  echo "git push origin --delete \"$b\"";
  git push origin --delete "$b";
  echo "----------------------------------";

  #git branch -d <branchname>
  echo "git branch -D \"$t\"";
  git branch -D "$t";
  echo "==================================";
done

echo "git fetch --all --prune";
git fetch --all --prune
