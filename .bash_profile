# Environment variables
export VISUAL="/usr/local/bin/vim"
export EDITOR="usr/local/bin/vim"

# Setup prompt for git repos
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    export PS1='\n\[\e[0;32m\]\u@\h \[\e[0;33m\]\w \[\e[0;36m\]$(__git_ps1 "(%s)")\[\e[1;37m\]\n$ \[\e[0;37m\]'
fi

# Source Node Version Manager
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Enable NVM tab completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

#---------------------------------------------
# git-flow bash completion
#---------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#---------------------------------------------
# Path
#---------------------------------------------
# Android SDK
export PATH=${PATH}:/Users/calebscholze/Library/Android/sdk/platform-tools

#---------------------------------------------
# Aliases
#---------------------------------------------
# Docker
alias dc="docker-compose"
alias ds="docker-sync"
alias dss="docker-sync-stack"

# Git
alias gs="git status"
alias gd="git diff"
alias gc="git checkout"

# Modifed commands
alias la="ls -lA"

#---------------------------------------------
# Agilea Environment
#---------------------------------------------
export AGILEA_JIRA_HOSTNAME="atibasoftware-dev.atlassian.net"
export AGILEA_JIRA_USERNAME="admin"
export AGILEA_JIRA_PASSWORD="1atiba@atlassian.dev"
export AGILEA_JIRA_PROJECT_KEY="ABF"

export AGILEA_DEV_DATABASE="agilea_dev"
export AGILEA_DEV_DB_HOST="localhost"
export AGILEA_DEV_DB_PORT="3306"
export AGILEA_DEV_DB_USER="root"
export AGILEA_DEV_DB_PASS="root"
#export DB_CONNECTION_STRING=""

export AGILEA_BDD_ENGINE_URL="http://0.0.0.0:8000"
export AGILEA_BDD_SERVICE_URL="http://10.60.1.117:3000"
export AGILEA_SELENIUM_HUB_URL="http://localhost:4444/wd/hub"
eval "$(jenv init -)"
export PATH="$HOME/.jenv/bin:$PATH"
