#!/usr/bin/env bash

# Turns the Meta Key on
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
shift;shift; # I have no idea what set seems to append it args to $*, weird.

# doesnt tab complete hidden files like .svn files
bind 'set match-hidden-files off'

export PATH=$BASH_COMMON_PATH/bin:$PATH
export HOSTFILE=$BASH_COMMON_PATH/hosts
export SVN_EDITOR='vi'
export EDITOR='vi'
export GEM_EDITOR='mate'
export HISTCONTROL=erasedups
export HISTSIZE=10000

# Amazon EC2
export EC2_PRIVATE_KEY=/Users/deadlyicon/.ec2/pk-ZA6KSNJWK3BSMDIPEL65YEW2RO7HT6OK.pem
export EC2_CERT=/Users/deadlyicon/.ec2/cert-ZA6KSNJWK3BSMDIPEL65YEW2RO7HT6OK.pem
export EC2_HOME=/Applications/java/ec2-api-tools-1.3-34128
export PATH=$EC2_HOME/bin:$PATH

shopt -s cmdhist
shopt -s histappend # this ensures history is written
shopt -s lithist

source $BASH_COMMON_PATH/aliases
source $BASH_COMMON_PATH/gemdoc
source $BASH_COMMON_PATH/title
source $BASH_COMMON_PATH/git-completion
complete -C $BASH_COMMON_PATH/rake_completion -o default rake

export PROMPT_COLOR=33
_set_ps1(){
  PS1="\[\033[4;1;${PROMPT_COLOR}m\]\w\[\033[0m\]$(__git_ps1 '[%s]') "
}
export PROMPT_COMMAND="_set_ps1; $PROMPT_COMMAND"

# laod system specific bash files
[[ -f "$BASH_COMMON_PATH/commons/`uname`" ]] && source "$BASH_COMMON_PATH/commons/`uname`"

[[ -d /usr/sbin/     ]] && PATH=/usr/sbin/:$PATH
[[ -d /usr/local/bin ]] && PATH=/usr/local/bin:$PATH
[[ -d ~/bin/         ]] && PATH=~/bin/:$PATH

# adds ./.bin ./bin and ./script to your path
PATH=.bin:bin:script:$PATH # WARNING: leave this at the bottom of this script!
export PATH