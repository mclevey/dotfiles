# `dotfiles/`

John McLevey<br>University of Waterloo<br><john.mclevey@uwaterloo.ca>

This repository contains my personal dotfiles, managed with `git` and GNU `stow`. It's designed for my current setup on **macOS** (currently 14.5 "Sonoma") and **Linux** (currently Ubuntu 24.4 LTS, "Noble Numbat").

Using `stow` to manage dotfiles requires adopting a strict directory structure. Each `dotfiles` subdirectory is a representation of the home directory (`~/`) containing the configuration files for a given program or category of programs (e.g., `nvim`, `tmux`). The trick is to organize the config files for each program or category of programs inside the subdirectory *exactly* as they should appear in `~/`. Then, when you run `stow <directory_name>`, `stow` will symlink the configs to the home directory. In other words, running `stow zsh` will symlink `dotfiles/zsh/.zshrc` to `~/.zshrc`.

This works for files and subdirectories, even when they are hidden. For example, `~/dotfiles/tmux` contains `.tmux.conf` and `.tmux`, which contains `.tmux/plugins/...` and `.tmux/themes/...`. Running `stow tmux` symlinks the hidden config file to `~/.tmux.conf` and the hidden config subdirectory to `~/.tmux`. 

![](tmux.png)

This approach allows me to keep all my configs in one centralized directory under version control, which makes them more portable across different systems (macOS and Linux, in my case) as well as easier to manage and update.

To stow all configurations at once, run:

```zsh
cd dotfiles && stow */
```

## Handling `.DS_Store` Files on macOS

`.DS_Store` files on macOS often cause file conflicts with `stow`. There are a few ways to handle this issue. One is to simply find and remove them by running:

```zsh
find ~/dotfiles -name ".DS_Store" -exec rm -f {} \;
```

(or using the `cds` function defined in `.zshrc`). However, a better approach is to configure `stow` to ignore `.DS_Store` files. You can do this globally in a `.stowrc` file (`~/dotfiles/stow`) or locally using `.stow-local-ignore` files.

## SSH Config

I don't keep my `~/.ssh` directory in `dotfiles/`, but my SSH config looks like this:

```ssh
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

This configuration allows me to connect to a host with `ssh <HOST>`.

## Installs

Exporting and importing lists of installed packages from a package manager simplies the process of installing important packages on a new machine. 

### On macOS

Export a list of installed packages using Homebrew:

```zsh
brew leaves > ~/dotfiles/package_manager/.leaves.txt
```

To install these packages on a new machine:

```zsh
stow package_manager
xargs brew install < ~/.leaves.txt
```

### On Linux

Export a list of manually installed packages using `apt-mark`:

```zsh
apt-mark showmanual > ~/dotfiles/package_manager/.packages.txt
```

To install these packages on a new machine:

```zsh
stow package_manager
sudo apt-get update
xargs -a ~/.packages.txt sudo apt-get install -y
```
