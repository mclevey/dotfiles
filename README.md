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

# Installs

On macOS, export a list of installed packages (from the old machine) using Homebrew:

```zsh
brew leaves > ~/dotfiles/package_manager/.packages.txt
```

On Linux, use `apt-mark`:

```zsh
apt-mark showmanual > ~/dotfiles/apt/.packages.txt
```

To install the packages on a new machine running macOS:

```zsh
stow package_manager
xargs brew install < ~/.packages.txt
```

To install the packages on a new machine running Linux:

```zsh
stow package_manager
sudo apt-get update
xargs -a ~/.packages.txt sudo apt-get install -y
```
