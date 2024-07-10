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

**NOTE**: the config for `tmux` is not working as expected. I need to figure out what's going on there, but in the meantime you can still stow the others easily:

```zsh
stow nvim 
stow zsh
stow starship
```


## TODO

Eventually I should figure out how to use `git submodules` for my `nvim` and `tmux` configs.
