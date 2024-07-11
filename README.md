# `dotfiles/`

John McLevey  
University of Waterloo 

This repository contains personal dotfiles, managed with `git` and GNU `stow`. It's designed for my current setup on macOS 14.5 (Sonoma) and Ubuntu 24.4 LTS (Noble Numbat). I've stripped it down to the essentials and will add new configs if and when they are needed. For me, the essentials are `stow` itself, `zsh`, `starship`, `tmux`, `nvim`, `git`, `pypoetry`, `conda`, and `mamba`.  


# Essentials

## GNU `stow`

```zsh
stow gnu_stow
```

## `zsh` and `starship`

```zsh
stow zsh
stow starship
```

## `tmux` and `neovim`

```zsh
stow tmux
stow nvim 
```

## `git`

```zsh
stow git 
```

## `pypoetry`, `conda`, and `mamba`

```zsh
stow pypoetry
stow conda 
stow mamba
```

# Handling `.DS_Store` Files on macOS

`stow` ignores the files listed in `.stowrc` (global) and `.stow-local-ignore` (local), but for some reasome reason I find both to be a little unreliable when it comes to `.DS_Store` metadata files on macOS. Most of the time I end up removing these files by running the command below (aliased as `cds` for clean DS Store in `.zshrc`) whenever `stow` complains about file conflicts.  

```zsh
find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;
```

## Stow everything

You can stow everything (assuming all configs are in subdirectories) with `stow */`, which is especially useful when you need to get up and running in on a new machine. 

```
cd dotfiles && stow */
```

# Package Installs

## macOS (Homebrew)

Export a list of installed packages from the old machine: 

```zsh
brew leaves > ~/.leaves.txt
```

Alternatively, `stow homebrew`.

Fresh install on the new machine: 

```zsh
xargs brew install < ~/.leaves.txt
```

## Ubuntu Linux (apt-get)

Export a list of installed packages from the old machine: 

```zsh
apt-mark showmanual > ~/.packages.txt
```

Fresh install on the new machine: 

```zsh
sudo apt-get update
xargs -a ~/.packages.txt sudo apt-get install -y
```
