#!/bin/zsh

cd "$(dirname "$0")"
DOTFILES=$(pwd -P)

# zshrc
ln -snf $DOTFILES/shared/.zshrc $HOME/.zshrc

# tmux
if [ -e $HOME/.tmux/plugins/tpm ]; then
    rm -rf $HOME/.tmux/plugins/tpm
fi
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
zsh $DOTFILES/tmux.conf.sh
ln -snf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# nvim
if [ -e $HOME/.config/nvim ]; then
    rm -rf $HOME/.config/nvim
fi

mkdir -p $HOME/.config/nvim
ln -snf $DOTFILES/shared/.vimrc $HOME/.config/nvim/init.vim

curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# gitconfig
zsh $DOTFILES/gitconfig/gitconfig.sh

