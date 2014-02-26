#!/bin/bash
source ~/.rvm/scripts/rvm
set -x
cd sound
git fetch origin
if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]
then
  git rebase origin/master
  killall ruby
  killall mpg123
  nohup rake &
fi
