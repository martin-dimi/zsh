PLUGIN_DIR=$HOME/.config/zsh/plugins

echo "Installing xterm-24bit colors"
/usr/bin/tic -x -o ~/.terminfo ./xterm-24bit.terminfo

echo "Installing plugins"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGIN_DIR/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGIN_DIR/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PLUGIN_DIR/powerlevel10k

echo "Setting up history"
mkdir ~/.cache/zsh
touch ~/.cache/zsh/zhistory

echo "Done"
source $HOME/.config/zsh/.zshrc
