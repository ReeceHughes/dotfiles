# Bash Aliases
# Reece Hughes

# File loaded by .bashrc on startup

# ls
alias ll='ls -alF --color=auto'
alias la='ls -lah --color=auto'
alias l='ls -CF --color=auto'
alias cla='clear && ls -la --color=auto'

# cd
alias ..='cd .. && la'

# rm
alias rm='gvfs-trash'

alias op='xdg-open'

# Programming
alias python='python3'

# fun
alias timeToGoHome='python3 ~/Documents/projects/timeToGoHome/ttgh.py'

