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

# PDPP
alias pg="pdpp graph --files png --style default"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Eza and FZF
alias ls="eza"
alias l="eza -l --icons --git -a"
alias ll="eza --tree --level=2 --long --icons --git"

# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Misc
alias c=clear
alias cat=bat
alias rr='ranger'

# FUNCTIONS

# Clean .DS_Store files and stow all configs
cds() { 
  cd ~/dotfiles
  find ~/dotfiles -name .DS_Store -exec rm -f {} \;
  stow */
}

# search for files or subdirectories in the current directory (not it's subdirectories) and print to screen with git info
# e.g., `sl tmux` reproduces the tmux example in dotfiles/tmux.png
sl() {
    local pattern="$1"
    find . -maxdepth 1 -name "*$pattern*" | xargs -I {} eza --tree --level=2 --long --icons --git {}
}

# PIPX 

# autocompletions + path
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit 
eval "$(register-python-argcomplete pipx)"
export PATH="$PATH:/Users/johnmclevey/.local/bin"

# CONDA

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/johnmclevey/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/johnmclevey/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/johnmclevey/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/johnmclevey/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ZOXIDE AND STARSHIP
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
