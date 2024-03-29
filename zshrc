#------------------------------------------
# PATH
#------------------------------------------
# local installed node-modules
export PATH=$PATH:./node_modules/.bin
# yarn
if command -v yarn > /dev/null 2>&1; then
    export PATH=$PATH:$(yarn global bin)
fi

if [ $(uname) = 'Darwin' ]; then
    export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/
fi

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
precmd() {
    vcs_info;
    if [ -z "$vcs_info_msg_0_" ]; then
        GIT_BRANCH=''
    else
        GIT_BRANCH="%F{red}:${vcs_info_msg_0_}%f"
    fi
}

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '!'
zstyle ':vcs_info:git:*' unstagedstr '+'
zstyle ':vcs_info:*' formats '%c%u%b'
zstyle ':vcs_info:*' actionformats '%c%u%b|%a'
PROMPT=$'
[%F{cyan}%n@%m%f] %(5~,%-2~/.../%2~,%~$GIT_BRANCH)
%F{red}>>>>%f '

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
# reset keybind
bindkey -e

if command -v anyenv > /dev/null 2>&1; then
    eval "$(anyenv init -)"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
