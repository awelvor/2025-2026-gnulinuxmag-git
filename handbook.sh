#!/usr/bin/env bash

echo "handbook"
mkdir ocr1
cd ocr1
git init --object-format=sha1 --initial-branch=main
git config commit.gpgSign false
git config tag.gpgSign false
git config core.abbrev 5
export LANG=fr_FR.UTF-8
export LANGUAGE=$LANG
export GIT_AUTHOR_NAME=moi
export GIT_AUTHOR_EMAIL=moi@moi.com
export GIT_AUTHOR_DATE='1234567890 +0100'
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
export GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE

echo "README'> README
echo "test.rb" > test.rb
echo "LICENSE" > LICENSE
git add README test.rb LICENSE
git commit -m 'Initial commit'
git status
