# Zsh configuration

## Installation
1. Install ***zsh**:
`sudo apt-get install zsh`
`sudo brew install zsh`

2. Install **oh-my-zsh**
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Note, this will replace your `zshrc` and make a copy/backup of your old one. The new one is filled with comments and non-sense...

3. Install **powerlevel10k** theme:
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

4. Install pluggins needed:
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
