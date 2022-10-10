#!/bin/zsh

cd "$(dirname "$0")"
DOTFILES=$(pwd -P)

# zshrc
cp $DOTFILES/zshrc $HOME/.zshrc

# tmux
if [ -e $HOME/.tmux/plugins/tpm ]; then
    rm -rf $HOME/.tmux/plugins/tpm
fi
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
zsh $DOTFILES/tmux/tmux.conf.sh

# nvim
if [ -e $HOME/.config/nvim ]; then
    rm -rf $HOME/.config/nvim
fi

mkdir -p $HOME/.config/nvim
cp $DOTFILES/init.lua $HOME/.config/nvim/init.lua
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# gitconfig
zsh $DOTFILES/gitconfig/gitconfig.sh

