#!/usr/bin/env bash

# Install zgen
if [ ! -f ~/.zgen ]
then
  git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

# Setup dotfile symlinks
cd stow
for app in */
do
  stow -t ~/ $app
done
