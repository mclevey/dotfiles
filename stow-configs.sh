#!/bin/sh

find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;
stow */

# if moved to ~/Documents:
# stow -t ~ */
