
# Enable Powerlevel10k instant prompt. Put this at the top. Enables plugins to load
# in the background..
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###################################################
# Options
unsetopt menu_complete
unsetopt flowcontrol

#setopt auto_menu
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Regular expressions with * (globbing)
setopt nocaseglob                                               # Case insensitive globbing
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Append history instead of overwriting
setopt histignorealldups                                        # Don't duplicate history commands
setopt autocd                                                   # If only directory path is entered, cd there.

HISTFILE=~/.cache/zsh/zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
export EDITOR="emacsclient -nw"
export VISUAL="emacsclient -nw"
export TERM=xterm-256color

# Auto Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zmodload zsh/complist
compinit
_comp_options+=(globdots)

skip_global_compinit=1

# Edit line in vim with ctrl-e. 
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

###################################################
# Key bindings
# bindkey -v							                                        # Vim mode
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

###################################################
# Plugins.. To configure theme type p10k.
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/.p10k.zsh
source $ZDOTDIR/paths.zsh
source $ZDOTDIR/aliases.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# NVM
# source $(brew --prefix nvm)/nvm.sh
