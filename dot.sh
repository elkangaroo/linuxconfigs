#!/usr/bin/env bash
SOURCE="$(dirname "$BASH_SOURCE")"
GIT_VERSION="$(git --version | awk '{print $3}')"
TMUX_VERSION="$(tmux -V | awk '{print $2}')"
VIM_VERSION="$(vim --version | head -1 | awk '{print $5}')"
NEOVIM_VERSION="$(nvim --version | head -1 | awk '{print $2}')"

if [ "$1" == "--update" -o "$1" == "-u" ]; then
  git -C $SOURCE pull origin master
  eval "$BASH_SOURCE"
  exit 0
fi

echo -e "TMUX \tinstalled: $TMUX_VERSION \trequired: 2.4"
echo -e "GIT \tinstalled: $GIT_VERSION \trequired: 1.8.0"
echo -e "VIM \tinstalled: $VIM_VERSION \t\trequired: 7.4"
echo -e "NEOVIM \tinstalled: $NEOVIM_VERSION \trequired: 0.1.5"
echo "";

echo "This may overwrite existing files in your home directory.";
read -p "Continue? (y/n) " -n 1;
echo "";

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi

git -C $SOURCE submodule update --init

rsync --exclude ".git/" \
			--exclude ".gitignore" \
			--exclude ".gitmodules" \
			--exclude "dot.sh" \
			--exclude "README.md" \
			--archive --human-readable --verbose --no-perms $SOURCE/ ~
source ~/.bash_profile

