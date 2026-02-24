# LOCALE SETTINGS
export LANG="en_CA.UTF-8"
export LANGUAGE="en_CA:en"
export LC_ALL="en_CA.UTF-8"

# ALIASES 

# Machines and Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias dfs="cd ~/dotfiles"
alias repos='[ "$(uname)" = "Darwin" ] && cd /Users/johnmclevey/Documents/Repos/ || cd /home/mclevey/lab/john/repos/'

# Run pre-commit hooks
alias pcr="pre-commit run --all-files"

# PDPP
alias pg="pdpp graph --files png --style default"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull --rebase"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git stash'
alias gr='git remote'
alias gre='git reset'

# Eza and FZF
alias ls="eza"
alias l="eza -l --icons --git -a"
alias ll="eza --tree --level=2 --long --icons --git"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
source <(fzf --zsh)

# Misc
alias c=clear
alias cat=bat
alias rr='ranger'

# FUNCTIONS

# Clean .DS_Store files and stow all configs
cds() {
  cd ~/dotfiles
  find . -name .DS_Store -exec rm -f {} +
  find . -name '*.pyc' -exec rm -f {} +
  stow --restow */
  echo "👋 stowed dotfiles/"
  # echo " Stowed: $(ls -d */ | tr -d '/' | tr '\n' ' ')"
}

# search for files or subdirectories in the current directory (not it's subdirectories) and print to screen with git info
# e.g., `sl tmux` reproduces the tmux example in dotfiles/tmux.png
sl() {
    local pattern="$1"
    find . -maxdepth 1 -name "*$pattern*" | xargs -I {} eza --tree --level=2 --long --icons --git {}
}

# PIPX

# autocompletions + path (cached, regenerated daily)
autoload -U +X compinit
if [[ -f ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
autoload -U +X bashcompinit && bashcompinit
eval "$(register-python-argcomplete pipx)"
export PATH="$PATH:/Users/johnmclevey/.local/bin"

# CONDA

# Lazy-load conda — only runs the expensive init when you first use it
conda() {
  unfunction conda
  eval "$('/Users/johnmclevey/miniconda3/bin/conda' 'shell.zsh' 'hook')"
  conda "$@"
}

# ZOXIDE AND STARSHIP
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Antigravity
export PATH="/Users/johnmclevey/.antigravity/antigravity/bin:$PATH"

# opencode
export PATH=/Users/johnmclevey/.opencode/bin:$PATH

# sentry
export PATH="/Users/johnmclevey/.sentry/bin":$PATH

# Auto-run cds on new shell instances
cds
