# `dotfiles/`

John McLevey  
University of Waterloo 

`stow` runs into all kinds of trouble with `.DS_Store` files on macOS. Using `.stow-local-ignore` doesn't seem to work consistently, so instead I am just removing them. 

```zsh
find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;
```

Once you've run that command you can just

```zsh
stow */
```

to symlink everything to `.config`. 

## TODO

Eventually I should figure out how to use `git submodules` for my `nvim` and `tmux` configs.
