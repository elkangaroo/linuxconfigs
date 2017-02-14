#!/usr/bin/env bash
SOURCE="$(dirname "$BASH_SOURCE")"

if [ "$1" == "--update" -o "$1" == "-u" ]; then
  git -C $SOURCE pull origin master
fi

git -C $SOURCE submodule update --init

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rsync --exclude ".git/" \
        --exclude ".gitignore" \
        --exclude ".gitmodules" \
        --exclude "dot.sh" \
        --exclude "README.md" \
        --archive --human-readable --verbose --no-perms $SOURCE/ ~
  source ~/.bash_profile
fi
