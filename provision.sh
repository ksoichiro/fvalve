#!/usr/bin/env bash

which vim > /dev/null 2>&1
if [ $? -ne 0 ]; then
  apt-get update
  apt-get install -y vim-gnome
  apt-get install -y language-pack-ja
  dpkg-reconfigure locales
  echo "set encoding=utf-8" >> ~vagrant/.vimrc
  echo "set fileencodings=utf-8" >> ~vagrant/.vimrc
  echo "set number" >> ~vagrant/.vimrc
  echo "set ts=4" >> ~vagrant/.vimrc
  echo "set listchars=tab:^-,eol:$" >> ~vagrant/.vimrc
  echo "set list" >> ~vagrant/.vimrc
  chown vagrant:vagrant ~vagrant/.vimrc
fi

which git > /dev/null 2>&1
if [ $? -ne 0 ]; then
  apt-get install -y git
fi

which bundle > /dev/null 2>&1
if [ $? -ne 0 ]; then
  gem install bundler
fi

which curl > /dev/null 2>&1
if [ $? -ne 0 ]; then
  apt-get install -y curl
fi

which rvm > /dev/null 2>&1
if [ $? -ne 0 ]; then
  curl -sSL https://get.rvm.io | bash -s stable
fi

grep rvm ~vagrant/.bashrc > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "source ~/.rvm/scripts/rvm" >> ~vagrant/.bashrc
  rvm install 1.9.3
  rvm use 1.9.3
fi

bundle install
