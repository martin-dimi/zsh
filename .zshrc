# PATHS
ZSH_HOME=~/.zsh
FLUTTER_HOME='/Users/mitch/.flutter'
GO_PATH='/usr/local/go/bin'
POSTGRESS_PATH='/Applications/Postgres.app/Contents/Versions/latest/bin'
DOOM='/Users/mitch/.emacs.d/bin'
PATH="$PATH:$FLUTTER_HOME/bin:$GOPATH:$POSTGRESS_PATH:$DOOM"

### EXPORT
export TERM="xterm-256color"              # getting proper colors
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
#export EDITOR="emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
#export VISUAL="emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZSH_HOME/history
setopt appendhistory

# Basic auto/tab complete
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ''
autoload -U compinit  && compinit
setopt MENU_COMPLETE
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_HOME/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure`
[[ ! -f $ZSH_HOME/p10k.zsh ]] || source $ZSH_HOME/p10k.zsh
