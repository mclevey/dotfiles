# `dotfiles/`

John McLevey  
University of Waterloo 

Each top-level directory within `dotfiles/` contains a `.config` directory. This is to enable the use of GNU `stow`, which needs everything inside `dotfiles/` to be organized as if they were inside the home folder.  

```bash
stow .
```

to move everything into place, or


```bash
stow */
```

to move directories only. Alternatively, you can specify the specific tool / directory whose dotfiles you want to update.

```bash
stow zsh
```

Note that `stow` will ignore `.git` and `.gitignore` by default. You can add others to the `.stow-local-ignore` file.
