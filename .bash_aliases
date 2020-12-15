# Config stuff
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias aliases='vim ~/.bash_aliases'
alias src='source ~/.zshrc'

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# kubernetes
alias k=kubectl
complete -F __start_kubectl k

# grep stuff
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias core='cd ~/code/src/'
alias e='emacs -nw'

alias dbed='~/code/src/experimental/bwithers/db_connect.sh -n eng-dev'

# TODO: Add git aliases
