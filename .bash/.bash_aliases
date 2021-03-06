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
alias rmForReal='rm'
alias rm='gvfs-trash'

# misc
alias op='xdg-open'
alias liveLog='less +F -R -S'

# Programming
alias python='python3'

# Git
alias gits='git status'
alias cgits='clear && git status'
alias gitp='git pull'

branchDiff() {
    git diff $1 --stat
}

# fun
alias timeToGoHome='python3 ~/Documents/projects/timeToGoHome/ttgh.py'

