###################################################
# Editors
alias vim="nvim"
alias e="emacsclient -nw -c -a 'emacs'"
alias em="emacsclient -c -a 'emacs'"
alias estart="emacs --daemon"
alias estop='emacsclient -e "(kill-emacs)"'

# Shortcuts
alias conf="cd ~/.config/"
alias zshrc="e ~/.config/zsh/.zshrc"
alias paths="e ~/.config/zsh/paths.zsh"
alias src="source ~/.config/zsh/.zshrc"
alias aliases="e ~/.config/zsh/aliases.zsh"
alias cat="bat"
alias ls='lsd'
alias ll="ls -al"
alias grep="grep --color=auto"

# Userled
alias core="cd $USERLED_HOME"
alias be="cd $USERLED_HOME/backend"
alias fe="cd $USERLED_HOME/frontend"
alias sdk="cd $USERLED_HOME/sdk"
