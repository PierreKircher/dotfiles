#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
#export PS1="\[$(tput setaf 0)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\] \$(git_branch) \]"

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

#gb() {
 #       echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
#}
#git_branch() {
#        gb | sed 's/()//'
#}







# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
VIOLET="\[\033[0;35m\]"
BG_RED="\[\033[0;41m\]"
BG_ORANGE="\[\033[0;43m\]"
BG_BLUE="\[\033[0;44m\]"
BG_GREEN="\[\033[0;46m\]"
BG_STASH="\[\033[0;45m\]"
BG_RED2="\[\033[11;43m\]"
PUREWHITE="\[\033[0;40m\]"

 
function color_my_prompt {
  local __user_and_host="\[$(tput setaf 0)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]]\[$(tput setaf 4)\]" 
 #  local __user_and_host="\[$(tput setaf 0)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 4)\]" 
  local __cur_location="$BLUE\W "           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$BG_GREEN"
  local __prompt_tail="$VIOLET $"
  local __user_input_color="$PUREWHITE"
  local __git_branch="$(__git_ps1) "; 
  
  # colour branch name depending on state
  if [[ "${__git_branch}" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$BG_RED2"
  elif [[ "${__git_branch}" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$BG_STASH"
  elif [[ "${__git_branch}" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$BG_ORANGE"
  elif [[ "${__git_branch}" =~ "+" ]]; then   # if there are staged files
    __git_branch_color="$BG_BLUE"
  fi
   
  # Build the PS1 (Prompt String)
  PS1="$__user_and_host $__cur_location$__git_branch_color$__git_branch$__prompt_tail $__user_input_color "
}
 
# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt
 
# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=false
  . ~/.git-prompt.sh
fi













#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$  \n| => "
#export PS2="|==> "

#export PS1="\$(git_branch)"

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export DOKKU_HOST=pkcluster.co

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

alias dokku='/home/o_0/.dokku/contrib/dokku_client.sh'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
