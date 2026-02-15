#!/bin/zsh

SCRIPT_PATH="${(%):-%x}"
DOTFILES_DIR="$(cd -- "$(dirname -- "$SCRIPT_PATH")" && pwd -P)"

# zshrc
cp "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
