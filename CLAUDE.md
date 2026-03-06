# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This repository contains personal dotfiles managed with GNU Stow. Each top-level directory is a stow package that mirrors `$HOME` structure. Running `stow <package>` from the repo root symlinks its contents into `~/`.

## Key Commands

```zsh
# Restow all packages (cleans .DS_Store and .pyc first)
cds

# Stow a single package
cd ~/dotfiles && stow <package>

# Unstow a package
cd ~/dotfiles && stow -D <package>

# Preview what stow would do (dry run)
cd ~/dotfiles && stow -n -v <package>
```

The `cds` function is defined in `zsh/.zshrc`. It runs automatically in a subshell on every new shell startup (last line of `.zshrc`), so dotfiles are always re-stowed.

## Stow Architecture

Most packages target `$HOME` by default. The `stow/.stowrc` sets `--target=~/.config` and `--ignore=.stowrc`, but this file only takes effect when it's symlinked to `~/.stowrc` (i.e., when the `stow` package is stowed). The repo-root `.stow-local-ignore` excludes `.DS_Store` and `reworking/*`.

Packages that place files directly in `$HOME`: `zsh` (`.zshrc`), `git` (`.gitconfig`, `.gitignore_global`), `tmux` (`.tmux.conf`, `.tmux/`), `conda` (`.condarc`), `goose` (`.goosehints`).

Packages that place files in `~/.config/`: `ghostty`, `nvim`, `starship`, `pypoetry`, `wezterm`, `yazi`, `zellij` (all via `.config/<app>/` subdirectories).

The `claude` package is special: it symlinks `~/.claude/` including `CLAUDE.md`, `settings.json`, `agents/`, and `commands/`. Because stow uses tree folding for directories, new agents or commands created in `~/.claude/` automatically land in the dotfiles repo.

## Platform Considerations

This repo is used on both macOS (ARM64, Homebrew) and Linux (x86_64, apt). The `package_manager` package tracks installed packages for both:

- `.leaves.txt` for Homebrew (macOS)
- `.packages.txt` for apt (Linux)

Some configs have macOS-specific paths (e.g., `.zshrc` references `/Users/johnmclevey/`). When editing, be aware these paths differ on Linux (`/home/mclevey/`).

## Neovim Config

NvChad v2.5 with Lazy.nvim. Entry point: `nvim/.config/nvim/init.lua`. Custom config lives in `nvim/.config/nvim/lua/` with `chadrc.lua` for theme settings, `options.lua`, `mappings.lua`, and `plugins/init.lua` for plugin specs. LSP config is in `lua/configs/lspconfig.lua`, formatting in `lua/configs/conform.lua`.

## Conventions

- Conventional commits for this repo
- When adding a new tool's config, create a new top-level directory mirroring the home directory structure
- Add a `.stow-local-ignore` if the package directory contains files that shouldn't be symlinked (see `claude/.stow-local-ignore` for an example)
- Test with `stow -n -v <package>` before stowing to catch conflicts
