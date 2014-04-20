#!/usr/bin/env bash

which vim > /dev/null 2>&1
if [ $? -ne 0 ]; then
  apt-get update
  apt-get install -y vim-gnome
  apt-get install -y language-pack-ja
  dpkg-reconfigure locales
  echo "set encoding=utf-8" >> ~vagrant/.vimrc
  echo "set fileencodings=utf-8" >> ~vagrant/.vimrc
  chown vagrant:vagrant ~vagrant/.vimrc
fi

which git > /dev/null 2>&1
if [ $? -ne 0 ]; then
  apt-get install -y git
fi
