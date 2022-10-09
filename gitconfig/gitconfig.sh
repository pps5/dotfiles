#!/bin/zsh

cd "$(dirname "$0")"
DOTFILES=$(pwd -P)

read "EMAIL?email: "

sed "s/{{EMAIL}}/$EMAIL/" gitconfig_template > ~/.gitconfig

