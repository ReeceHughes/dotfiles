# Bash Aliases
# Reece Hughes

# File loaded by .bashrc on startup

# ls
alias ll='ls -alF --color=auto'
alias la='ls -lah --color=auto'
alias l='ls -CF --color=auto'
alias cla='clear && ls -lah --color=auto'

# cd
alias ..='cd .. && la'

# misc
alias op='xdg-open'
alias liveLog='less +F -R -S'
alias local-portscan='nmap -F 192.168.1.1/24'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Programming
alias python='python3'

# Git
alias gits='git status'
alias cgits='clear && git status'
alias gitp='git pull'

branchDiff() {
    git diff $1 --stat
}

