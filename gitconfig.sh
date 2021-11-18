#!/bin/zsh

cd "$(dirname "$0")"
DOTFILES=$(pwd -P)

if [ $(uname) != 'Darwin' ]; then
    cat  $DOTFILES/shared/.gitconfig - <<EOS > .gitconfig

[credential]
    helper = /usr/lib/git-core/git-credential-gnome-keyring
EOS
fi

