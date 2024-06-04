# New Dotfiles
# John McLevey
# Spring 2024

# Aliases
alias buffy='ssh -p 2201 mclevey@198.84.193.35'
alias repos="cd /home/mclevey/fast-data/john/repos/"

alias cdc="cd ~/.config/"
alias c='clear'
alias ls='ls --color=auto -F'
alias ll='ls -la'


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

eval "$(starship init zsh)"
