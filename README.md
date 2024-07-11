# `dotfiles/`

John McLevey  
University of Waterloo 

This repository contains my personal dotfiles, managed with `git` and GNU `stow`. It's designed for my current setup on macOS 14.5 (Sonoma) and Ubuntu 24.4 LTS (Noble Numbat). I've stripped it down to the essentials and will add new configs if and when they are needed. For me, the essentials are currently:

# Essentials

```zsh
stow gnu_stow
stow zsh
stow starship
stow tmux
stow nvim 
stow git 
stow pypoetry
stow conda 
stow mamba
```

# Handling `.DS_Store` Files on macOS

`.DS_Store` files on macOS will often cause file conflicts. Sometimes I remove them by running `find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;` (aliased as `cds`), but it's better just to tell `stow` to ignore `.DS_Store` files. You do this locally with `.stow-local-ignore` or globally in `.stowrc`.   

## Stow everything

You can stow everything (assuming all configs are in subdirectories) with `stow */`. 

```zsh
cd dotfiles && stow */
```

# Package Installs

## macOS (Homebrew)

Export a list of installed packages from the old machine: 

```zsh
brew leaves > ~/dotfiles/homebrew/.leaves.txt
```

Alternatively, `stow homebrew`.

Fresh install on the new machine: 

```zsh
stow homebrew
xargs brew install < ~/.leaves.txt
```

## Ubuntu Linux (apt-get)

Export a list of installed packages from the old machine: 

```zsh
apt-mark showmanual > ~/dotfiles/apt/.packages.txt
```

Fresh install on the new machine: 

```zsh
stow apt
sudo apt-get update
xargs -a ~/.packages.txt sudo apt-get install -y
```
