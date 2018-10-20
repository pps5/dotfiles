#------------------------------------------
# PATH
#------------------------------------------
# local installed node-modules
export PATH=$PATH:./node_modules/.bin
# emacs cask
export PATH="/home/inab/.cask/bin:$PATH"
export PATH=/home/inab/.gem/ruby/2.4.0/bin:$PATH
# JAVA HOME
export JAVA_HOME="/usr/lib/jvm/$(archlinux-java get)"
# nvm
source /usr/share/nvm/init-nvm.sh
export PATH=/home/inab/Applications/flutter/bin:$PATH
# rust
export PATH="$HOME/.cargo/bin:$PATH"

#------------------------------------------
# History
#------------------------------------------
export HISTFILE=${HOME}/.zsh_histroy
export HISTSIZE=1000
export SAVEHIST=10000

# ignore/remove dupplicates
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
# write start and end time to history file
setopt EXTENDED_HISTORY
# reduce unnecessary blanks
setopt hist_reduce_blanks
# ignore line begin with space
setopt hist_ignore_space

#------------------------------------------
# Completion
#------------------------------------------
# enable completion
autoload -U compinit && compinit
# cycle candidates with TAB
setopt auto_menu
# resume suspended process when run same command
setopt auto_resume
# list candidates
setopt auto_list
# show file type in candidates list
setopt list_types
# auto add the last of directory
setopt auto_param_slash

#------------------------------------------
# Prompt
#------------------------------------------
# enable color
autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst
precmd() { echo ''; vcs_info }

zstyle ':vcs_infogit:*' check-for-changes true
zstyle ':vcs_infogit:*' unstagedstr '!'
zstyle ':vcs_infogit:*' stagedstr '%F{red}+'
zstyle ':vcs_info:*' formats ' %c%u%s:%b '
zstyle ':vcs_info:*' actionformats ' %c%u%s:%b|%a '

local SEPARATOR=$'\ue0b0 '
local GIT_ICON=$'\ue0a0 '
local PROMPT_ICON=$'\ue0b1 '

local USER_AND_HOST='%K{red}%F{white} %n@%m %f%k'
local SEPARATOR1=$'%K{yellow}%F{red}${SEPARATOR}%f%k'
local VCS_INFO='%K{yellow}%F{black}${GIT_ICON}${vcs_info_msg_0_}%f%k'
local SEPARATOR2=$'%K{magenta}%F{yellow}${SEPARATOR}%f%k'
local CURRENT_DIRECTORY='%K{magenta}%F{black} %~ %f%k'
local SEPARATOR3=$'%F{magenta}${SEPARATOR}%f'
PROMPT="${USER_AND_HOST}${SEPARATOR1}${VCS_INFO}${SEPARATOR2}${CURRENT_DIRECTORY}${SEPARATOR3}
> "

#------------------------------------------
# Aliases
#------------------------------------------
# cli
alias ls="ls -p"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -al"
alias cdp="cd ../"
alias cdpp="cd ../../"
alias git="hub"
# gui
alias clip="xclip -sel clipboard"
alias open="xdg-open"
alias hdmi="xrandr --output HDMI-1 --auto --above eDP-1"
# Global aliases
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g M='| more'
alias -g G='| grep'
alias -g GI='| grep -i'

#------------------------------------------
# others
#------------------------------------------
# disable spell check
unsetopt correctall
# bell
xset b off
