#!/bin/zsh

cd "$(dirname "$0")"
DOTFILES=$(pwd -P)

if [ $(uname) = 'Darwin' ]; then
    COPY_COMMAND='pbcopy'
else
    COPY_COMMAND="set -g @override_copy_command 'xsel'"
fi

cat > $DOTFILES/.tmux.conf << EOS -  $DOTFILES/shared/.tmux.conf
#------------------------------------
# plugins
#------------------------------------
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @override_copy_command '$COPY_COMMAND'
EOS

