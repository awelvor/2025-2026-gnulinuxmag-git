#!/usr/bin/env bash
sudo apt install qpdf

rm -rf /tmp/linuxmag-repo-test
mkdir -p /tmp/linuxmag-repo-test
cd /tmp/linuxmag-repo-test
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
echo "my content" > my-file.txt
chmod 0644 my-file.txt
touch --date='@1234567890' my-file.txt
git add my-file.txt
git commit --message="Initial version"

git log
echo "3.2 Le commit"
echo "od -txla"
zlib-flate -uncompress < .git/objects/09/a7b88683a6f2216a99228a9d6d18e46e61c1aa | od -tx1a
echo "tr 0 n"
zlib-flate -uncompress < .git/objects/09/a7b88683a6f2216a99228a9d6d18e46e61c1aa | tr '\0' '\n'

zlib-flate -uncompress < .git/objects/32/e678b70ec5d0becd6a1e7faf4be869df9e4317 | od -tx1a
echo "nom du fichier"
git cat-file -p 32e678b70ec5d0becd6a1e7faf4be869df9e4317
echo "contenu du fichier"
zlib-flate -uncompress < .git/objects/02/5d08be7f4781ef51ae7a593cc47776d0a5da17 | tr '\0' '\n'

git commit --amend --only --message="First commit"

git log

zlib-flate -uncompress < .git/objects/09/a7b88683a6f2216a99228a9d6d18e46e61c1aa | tr '\0' '\n'

git reflog expire --all --expire=all

git prune --dry-run

git prune --expire now --verbose

ls .git/objects/09/a7b88683a6f2216a99228a9d6d18e46e61c1aa

cp my-file.txt my-file2.txt
git add my-file2.txt
git commit --quiet --message "Add my-file2.txt"
git log  --oneline --graph HEAD

git cat-file -p 'HEAD^{tree}'

ls .git/refs/heads/

cat .git/refs/heads/main

git config branch.main.description "A description for the branch"

git config branch.main.description

cat .git/config
echo "3.4 Le tag"
git tag wip-tag HEAD

cat .git/refs/tags/wip-tag

cat .git/refs/heads/main

git tag --message "Release of v0.1.0, the beginning of a great adventure" v0.1.0 HEAD

cat .git/refs/tags/v0.1.0

zlib-flate -uncompress < .git/objects/03/302b9ac5c5b0e99685dd5eeb7abc5cb801add0 | tr '\0' '\n'
echo "3.5 L repertoire de travail"
rm -rf /tmp/linuxmag-repo-test-old
git worktree add /tmp/linuxmag-repo-test-old ff173

ls -Ap /tmp/linuxmag-repo-test

ls -Ap /tmp/linuxmag-repo-test-old

cat /tmp/linuxmag-repo-test-old/.git

ls -Ap /tmp/linuxmag-repo-test/.git/worktrees/linuxmag-repo-test-old
echo "3.6 Le depot"

ls -Ap /tmp/linuxmag-repo-test/.git
echo "3.7 Le remote"
rm -rf /tmp/linuxmag-repo-test-clone
git clone --quiet file:///tmp/linuxmag-repo-test /tmp/linuxmag-repo-test-clone

git -C /tmp/linuxmag-repo-test-clone remote -v

ls -Ap /tmp/linuxmag-repo-test-clone/.git/

git -C /tmp/linuxmag-repo-test branch new-branch HEAD
git -C /tmp/linuxmag-repo-test commit --allow-empty --message "New commit"
git -C /tmp/linuxmag-repo-test-clone fetch --quiet origin

ls /tmp/linuxmag-repo-test-clone/.git/refs/remotes/origin

cat /tmp/linuxmag-repo-test-clone/.git/refs/remotes/origin/main

git -C /tmp/linuxmag-repo-test remote add my-clone file:///tmp/linuxmag-repo-test-clone
git -C /tmp/linuxmag-repo-test remote -v

git -C /tmp/linuxmag-repo-test fetch --quiet my-clone
ls /tmp/linuxmag-repo-test/.git/refs/remotes/my-clone
echo "3.8 L'indes"
git rm --quiet my-file2.txt
git status

stat \
    --printf='ctime=%Z\nmtime=%Y\ndevice=%Hd %Ld\ninode=%i\nperm=%a\nuid=%u\ngid=%g\nsize=%s\n' \
    my-file.txt

od -tx1a .git/index

git ls-files --stage --debug
echo "3.9 HEAD"
cat /tmp/linuxmag-repo-test/.git/HEAD

git checkout ff173

git status

cat /tmp/linuxmag-repo-test/.git/HEAD

git checkout main
echo "3.10 Le stash"
cat .git/HEAD ; cat .git/refs/heads/main ; cat my-file.txt

echo "changes to commit" > my-file.txt
touch --date='@1234567890' my-file.txt
git add my-file.txt
echo "wip in my-file.txt" > my-file.txt
echo "wip in my-file3.txt" > my-file3.txt
chmod 0644 my-file3.txt
touch --date='@1234567890' my-file.txt my-file3.txt

git status

git stash --include-untracked --message "My stash"

git status

cat my-file.txt

cat my-file3.txt

cat .git/refs/stash

zlib-flate -uncompress < .git/objects/98/7aca4a11a1c781f7947fda782b818e5a3f1277 | tr '\0' '\n'; echo

git cat-file -p acfdcee3787d0464748ce3c8e2d88690a35924e2

git cat-file -p be29c7b79931ba3ea9e2bc2588f3736ddbbf46cf

zlib-flate -uncompress < .git/objects/3d/3511523761e411f927d41b146afbaed7407c44 | tr '\0' '\n'

git cat-file -p c51ba84471465347523a7e980826b650fb2a9a6c

git cat-file -p 3959090f2f1226254c8ac27a511c8da932584b42

zlib-flate -uncompress < .git/objects/48/8d56a4ba7851f3673ae27745d2c506328e8ee7 | tr '\0' '\n'

git cat-file -p 24b26aed4f436f0a6614e2a6774f6d7540c64b6d

git cat-file -p 9688c0b4b4694ead6a1514099bb8f8e7c6883ccd

echo "another wip" > my-file.txt
touch --date='@1234567890' my-file.txt
git stash --message "Second stash"

cat .git/refs/stash

git reflog stash

git stash list --format=oneline
echo "3.11 Le reflog"
tree .git/logs

cat .git/logs/refs/heads/main

cat .git/logs/refs/stash
