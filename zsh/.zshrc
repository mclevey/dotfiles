# John McLevey
# Spring 2024

# Aliases
alias buffy='ssh -p 22 mclevey@198.84.193.35'
alias repos="cd /home/mclevey/lab/john/repos/"

alias cdc="cd ~/.config/"
alias c='clear'
alias ls='ls --color=auto -F'
alias ll='ls -la'

# Locale
export LANG="en_CA.UTF-8"
export LANGUAGE="en_CA:en"
export LC_ALL="en_CA.UTF-8"

# Enable autocompletions for pipx
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit 
eval "$(register-python-argcomplete pipx)"

# Created by `pipx` on 2024-06-30 11:34:59
export PATH="$PATH:/Users/johnmclevey/.local/bin"

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
