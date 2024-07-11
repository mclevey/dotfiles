# `dotfiles/`

John McLevey
University of Waterloo

This repository contains my personal dotfiles, managed with `git` and GNU `stow`. It's designed for my current setup on macOS (currently 14.5, Sonoma) and Linux (Ubuntu 24.4 LTS, Noble Numbat).

```zsh
stow */
```

# Handling `.DS_Store` Files on macOS

`.DS_Store` files on macOS often cause file conflicts with `stow`. Sometimes I remove them by running `find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;` (aliased as `cds`), but it's better just to tell `stow` to ignore `.DS_Store` files. You do this globally in `.stowrc`, or locally with a `.stow-local-ignore` file.

## Stow everything

You can stow everything (assuming all configs are in subdirectories) with `stow */`.

```zsh
cd dotfiles && stow */
```

## SSH Config

I don't keep my `~/.ssh` in `dotfiles/`, but my config looks like this:

```
Host <HOST>
  HostName <IP-ADDRESS>
  User <USERNAME>
  Port <PORT>

Host *
  SendEnv LANG LC_*
  MACs hmac-sha2-256,hmac-sha2-512
  ForwardX11 no
  ForwardAgent yes
  ServerAliveInterval 15
  ConnectTimeout 20
  Compression yes
  ControlMaster auto
  ControlPath ~/.ssh/cm-%r@%h:%p
  ControlPersist 600
  TCPKeepAlive yes
  ServerAliveCountMax 3
  LogLevel VERBOSE
```

which enables `ssh <HOST>`.

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
