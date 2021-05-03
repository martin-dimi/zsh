# Enable colors and change prompt.
autoload -U colors && colors

# To Powerlevel10k prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

# Exports.
export DOOM="$HOME/.emacs.d/bin"
export ZDOTDIR="$HOME/.config/zsh"
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
export PATH=$PATH:"$HOME/.local/bin":$DOOM

# History.
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Auto complete and autocomplete with case insenstivity and dotfiles.
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vi mode.
bindkey -v
export KEYTIMEOUT=1

setopt extendedglob
unsetopt autocd beep

# Plugins.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Other.
source $ZDOTDIR/zsh_aliases.zsh
