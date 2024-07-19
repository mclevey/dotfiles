#!/bin/sh

find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;
stow */

# if repo moved outside home
# stow --target ~ */
