# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export DOOM="/home/mdimitrov/.emacs.d/bin"
export GOPATH="/home/mdimitrov/code:/home/mdimitrov/code/src/plz-out/gen/third_party/go:/home/mdimitrov/code/src/plz-out/gen/third_party/go/kubernetes:/home/mdimitrov/code/src/plz-out/gen/third_party/go/operator-sdkcore3"
export ZSH="/home/mdimitrov/.oh-my-zsh"
export EDITOR='vim'

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting # Always put this as the last plugin to load.
)
source $ZSH/oh-my-zsh.sh

# Handle kubernetes.
source <(kubectl completion zsh)
complete -F __start_kubectl kubectl
export KUBECONFIG=/home/mdimitrov/.kube/config
for file in /home/mdimitrov/.kube/configs/*.yaml; do
  export KUBECONFIG=$KUBECONFIG:$file
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ -e ~/.profile_tm ]; then source ~/.profile_tm; fi
if [ -e ~/.bash_aliases ]; then  source ~/.bash_aliases; fi
