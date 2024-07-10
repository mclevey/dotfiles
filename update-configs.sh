#!/bin/sh

find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;
echo Removed .DS_Store files to prevent conflicts.
stow */
echo Updates stowed!
