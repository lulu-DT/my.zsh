# damn-mac.zsh-theme
#
# Author: @lxsameer <lxsameer@gnu.org>
# Repo: https://github.com/lxsameer/My.Zsh
#
# Created on:		Apr 10, 2012

nfunction my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  #echo "$ZSH_THEME_GIT_PROMPT_PREFIX %F{007}$(parse_git_dirty)%F{005}${ref#refs/heads/} %F{007}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  #echo "$(git_super_status)"
}

function get_pwd() {
   echo "${PWD/$HOME/~}"
}
function spaces() {
    local git=$(my_git_prompt_info)

    if [ ${#git} != 0 ]; then
	local clean=$(parse_git_dirty)
	if [ ${#clean} != 0 ]; then
	    (( git = ${#git} - 34 - ${#clean} + 1 ))
	else
	    (( git = ${#git} - 34 ))
	fi
    else
	git=0
    fi

    local termwidth
    (( termwidth = ${COLUMNS} - 3 - ${#$(get_pwd)} - ${git} ))

    local spacing=" "
    for i in {1..$termwidth}; do
	spacing="${spacing}-"
    done
    echo $spacing
}

function user_prompt () {
    if [ $UID != 0 ]; then
	echo "%F{007}%F{002}> "
    else
	echo "%F{001}# "
    fi
}


PROMPT='%F{005}%~%F{008} $(git_super_status)$(user_prompt)%f'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%F{002}["
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{003}*"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{002}]"
