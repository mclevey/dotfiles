# `dotfiles/`

John McLevey<br>
Professor & Head, Sociology and Criminology<br>
Memorial University of Newfoundland<br>
mclevey@mun.ca<br>

> Personal dotfiles managed with git and GNU stow, designed for macOS (ARM64) and Linux (x86_64, Ubuntu).

## How Stow Works

Each subdirectory in `dotfiles/` mirrors the home directory structure for a given program. Running `stow <directory>` creates symlinks from `~/` pointing into the dotfiles repo. For example, `stow zsh` symlinks `dotfiles/zsh/.zshrc` to `~/.zshrc`.

This works for files and nested subdirectories, including hidden ones. Everything stays in one version-controlled directory, portable across machines.

To stow all packages at once:

```zsh
cds
```

The `cds` function (defined in `.zshrc`) cleans `.DS_Store` and `.pyc` files, then runs `stow --restow */` across all packages.

## Packages

| Package           | What it manages                                                       |
| ----------------- | --------------------------------------------------------------------- |
| `atuin`           | Shell history sync and search                                         |
| `claude`          | Claude Code config: global CLAUDE.md, settings.json, agents, commands |
| `conda`           | `.condarc` (channel and solver defaults)                              |
| `ghostty`         | Ghostty terminal config                                               |
| `git`             | `.gitconfig` and `.gitignore_global`                                  |
| `goose`           | `.goosehints` (Goose AI assistant preferences)                        |
| `matplotlib`      | Matplotlib style and config                                           |
| `nvim`            | Neovim config (NvChad)                                                |
| `package_manager` | Brew leaves (macOS) and apt packages (Linux)                          |
| `pypoetry`        | Poetry configuration                                                  |
| `starship`        | Starship prompt config                                                |
| `stow`            | Stow's own config (`.stowrc`)                                         |
| `tmux`            | Tmux config, plugins, and themes                                      |
| `wezterm`         | WezTerm terminal config                                               |
| `yazi`            | Yazi file manager config                                              |
| `zellij`          | Zellij terminal multiplexer config                                    |
| `zsh`             | `.zshrc` with aliases, functions, and environment setup               |

## Claude Code

The `claude` package manages Claude Code configuration as a stow package. Stow creates directory symlinks (tree folding) for `agents/` and `commands/`, so new agents or commands created within Claude Code automatically land in the dotfiles repo.

Contents:

- `CLAUDE.md` — Global context loaded every session (identity, coding standards, writing preferences, workflow conventions)
- `settings.json` — Tool permissions (allow/deny lists) and a PostToolUse hook for auto-formatting Python with ruff
- `agents/` — Task specialists (meeting minutes, data analysis, research writing, admin drafting, concept explanation)
- `commands/` — Reusable slash commands (commit, review, meeting pipeline)

## Git Configuration

`.gitconfig` includes a global gitignore (`~/.gitignore_global`) and references external tools (meld for diff/merge). For machine-specific overrides (email, CUDA tools, editor), create a `~/.gitconfig-local` file (not stow-managed) and add to `.gitconfig`:

```ini
[includeIf "gitdir:~/"]
    path = ~/.gitconfig-local
```

## Handling .DS_Store Files

`.DS_Store` files cause stow conflicts on macOS. The `cds` function handles this automatically. The repo also has a `.stow-local-ignore` in packages where needed.

## SSH Config

SSH configuration is not stow-managed. See `~/.ssh/config` directly.

## Package Manager Exports

### macOS (Homebrew)

```zsh
brew leaves > ~/dotfiles/package_manager/.leaves.txt
```

Install on a new machine:

```zsh
stow package_manager
xargs brew install < ~/.leaves.txt
```

### Linux (apt)

```zsh
apt-mark showmanual > ~/dotfiles/package_manager/.packages.txt
```

Install on a new machine:

```zsh
stow package_manager
sudo apt-get update
xargs -a ~/.packages.txt sudo apt-get install -y
```
