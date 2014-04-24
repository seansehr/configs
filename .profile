
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Get git branch for display
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion" # This adds rvm shell completion

# Git shell completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export CLICOLOR=1 # Adds colors to ls

PS1="$NO_COLOUR\w:$LIGHT_GRAY\$(~/.rvm/bin/rvm-prompt v)$NO_COLOUR:$CYAN\$(parse_git_branch)$NO_COLOUR\$ "
