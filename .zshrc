# ~/.zshrc

# Only run interactively
[[ $- != *i* ]] && return

# --- Vi mode ---
bindkey -v

# --- Environment ---
export EDITOR=nvim
export PAGER="less"
export LC_COLLATE=C
export PIPENV_VENV_IN_PROJECT=1
export JAVA_HOME="/opt/jdk-21.0.2.jdk/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"
export PATH="$PATH:$HOME/.local/bin:$HOME/Library/Python/3.9/bin:/opt/nvim-macos-arm64/bin:$JAVA_HOME/bin"
export HOMEBREW_PREFIX=/opt/homebrew

# --- NVM Setup ---
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# --- Aliases ---
alias vim=nvim
alias vimdiff='nvim -d'

alias ll='ls -alFG'
alias la='ls -lahG'
alias l='ls -CFG'
alias cla='clear && ls -lahG'

alias ..='cd .. && la'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias python='python3'
alias liveLog='less +F -R -S'
alias local-portscan='nmap -F 192.168.1.1/24'

alias gits='git status'
alias cgits='clear && git status'
alias gitp='git pull'

# Git Completion
autoload -Uz compinit && compinit

# --- Git-aware prompt (vcs_info) ---
autoload -Uz vcs_info add-zsh-hook

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}'
zstyle ':vcs_info:git:*' formats '%u%c(%b)%f '
zstyle ':vcs_info:git:*' actionformats '%u%c(%b|%a)%f '

# Ahead/behind/diverged arrows
function _git_remote_status() {
    _git_remote=""
    local ahead behind
    ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
    behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)
    if [[ $ahead -gt 0 && $behind -gt 0 ]]; then
        _git_remote="↕"
    elif [[ $ahead -gt 0 ]]; then
        _git_remote="↑"
    elif [[ $behind -gt 0 ]]; then
        _git_remote="↓"
    fi
}

function _precmd_prompt() {
    vcs_info
    _git_remote_status
}
add-zsh-hook precmd _precmd_prompt

# Virtualenv (disable default prefix)
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Prompt: clean=green (default from formats), staged=yellow, dirty=red
# Uses %(1V..) conditional to show virtualenv only when set
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f ${VIRTUAL_ENV:+"%F{green}[${VIRTUAL_ENV:t}]%f "}${vcs_info_msg_0_}${_git_remote}
--> %F{green}%n@%m%f%(?.$.%F{red}$%f) '
