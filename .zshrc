#------------------------------------------
# PATH
#------------------------------------------
# local installed node-modules
export PATH=$PATH:./node_modules/.bin
# common scripts
export PATH=$PATH:/home/inab/scripts/


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
autoload -U compinit
compinit

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
autoload -U colors
colors
setopt prompt_subst

# color definition
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local LIGHTBLUE=$'%{\e[38;5;39m%}'
local DEFAULT=$'%{\e[1;m%}'

# left/right prompts
PROMPT=$LIGHTBLUE'[%n@%m]%# '$DEFAULT
RPROMPT=$GREEN'[%~]'$DEFAULT
setopt transient_rprompt


#------------------------------------------
# misc
#------------------------------------------
# disable spell check
unsetopt correctall
export IBUS_ENABLE_SYNC_MODE=1


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
alias emacs="emacs -nw"
alias emacsc="emacsclient"
alias cputemp="cat /sys/class/thermal/thermal_zone0/temp | cut -c 1-2"
alias ssdtemp="telnet localhost 7634 &> /dev/null | grep /dev/sda"

# GUI apps
alias clip="xclip -sel clipboard"

# screen
alias hdmi="xrandr --output eDP1 --auto; xrandr --output HDMI1 --auto --above eDP1"

# adb
alias pulldroid="adb pull /storage/sdcard0/Android/data/com.example.naoki.rssireader4/files/"
alias rmdroid="adb shell 'rm /storage/sdcard0/Android/data/com.example.naoki.rssireader4/files/*'"
alias lsdroid="adb shell 'ls /storage/sdcard0/Android/data/com.example.naoki.rssireader4/files/'"

# pyvenv
alias venv="python3.6 -m venv"
alias pyactivate="source ./env/bin/activate"

# google-drive-ocamlfuse
alias mount-gdrive="google-drive-ocamlfuse /home/inab/GoogleDrive"
alias umount-gdrive="fusermount -u /home/inab/GoogleDrive"

# mysql
alias start-mysql="systemctl start mysqld.service"
alias stop-mysql="systemctl stop mysqld.service"

# xss-lock
alias xss-start="(xss-lock -- xscreensaver-command -lock &)"
alias xss-stop="pgrep xss-lock | xargs kill &> /dev/null"

# others
alias git="hub"
alias plantuml="java -jar /home/inab/Applications/plantuml.jar"
alias octave="octave --no-gui"


#------------------------------------------
# Global aliases
#------------------------------------------
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g M='| more'
alias -g G='| grep'
alias -g GI='| grep -i'


#------------------------------------------
# others
#------------------------------------------
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# emacs cask
export PATH="/home/inab/.cask/bin:$PATH"
export PATH=/home/inab/.gem/ruby/2.4.0/bin:$PATH
