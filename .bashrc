#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"


## user section ###########

alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

alias lt='ls -lt'
alias lrt='ls -lrt'
alias la='ls -A'
alias llh='ls -lh'
alias lla='ls -lA'
alias l1='ls -1'
alias l1a='ls -1A'

# Emacs
alias e='emacs &'

# source
alias sourcealiases='source $HOME/.aliases'
alias sourcezshr='source $HOME/.zshrc'

# edit
#alias editaliases='emacs -nw $HOME/.aliases'
alias editprofile='emacs -nw $HOME/.profile'
alias editemacs='emacs -nw $HOME/.emacs'
function editbashrc {
	 local ALIASES=$HOME/.bashrc
	 emacs -nw $ALIASES
	 source $ALIASES
}
alias editgit='emacs -nw $HOME/.gitconfig'

# environment variables
alias echoshell='echo $0'
function echos {
	 echo -e '\nHOME:' $HOME
	 echo -e 'HOST:' $HOST
	 echo -e 'SHELL:' $SHELL
	 echo -e 'PS1:' $PS1
	 echo -e 'TZ:' $TZ
	 echo -e 'PATH:' $PATH
	 echo -e 'LD_LIBRARY_PATH:' $LD_LIBRARY_PATH
	 echo -e 'PYTHONPATH:' $PYTHONPATH
	 echo -e 'MATLABPATH:' $MATLABPATH
	 echo -e 'CUDA_PATH:' $CUDA_PATH
	 echo -e 'ASTRA_HOME:' $ASTRA_HOME
	 echo -e '\n'
}

# print processes matching PATTERN
# alias psgrep='ps -eo pid,user,ni,%cpu,%mem,time,etime,start,comm | grep -e PID -e'
function psgrep() 
{
    ps -eo pid,user,ni,%cpu,%mem,time,etime,start,comm | grep -e COMMAND -i -e $1
}



# convenience cd functions
# save PWD to file
function saveworkingdirectory {
	 echo $PWD > $HOME/.savedworkingdirectory
	 echo $PWD | tr -d '\n' | xclip -sel clipboard
	 echo "Working directory saved. Return with: back"
	# echo "Return to saved directory with one of the following equivalent command:\ncdswd gotoswd gotosavedworkingdirectory"

}
alias swd='saveworkingdirectory'
alias savewd='saveworkingdirectory'
alias save='saveworkingdirectory'

# go to saved working directory
function gotosavedworkingdirectory {
	 local swd=$(<$HOME/.savedworkingdirectory)
	 cd $swd
}
alias gotoswd='gotosavedworkingdirectory'
alias cdswd='gotosavedworkingdirectory'
alias back='gotosavedworkingdirectory'

# To enable the keyring for applications run through the terminal, such as SSH
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# system infos
function info_kernel {
    echo cat /proc/version
    cat /proc/version
}

function echo_and_execute () { 
    echo $1;
    $1;
}

function info_kernel2() {
    echo_and_execute 'uname -a'
    echo_and_execute 'cat /proc/version'
}


# detect keycode using: sudo showkeys

# Hit unrecognized key and look at dmesg out:
# Unknown key released (translated set 2, code 0xab on isa0060/serio0).
#atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
alias setkeycode_flightmode='sudo setkeycodes e02b 120'

# add setkeycodes e02b 120 to rc.local
#sudo emacs /etc/rc.local


alias info_keycodes='echo_and_execute "xmodmap -pke"'

# top of user
alias topm='top -u $USER'

# disk usage
alias dus='du -s'
alias duhs='du -hs'
alias du1='du -hd1'
alias du2='du -hd2'

# xclip
alias test_xclip_primary='echo ''test primary'' | xclip -sel primary'
alias test_xclip_secondary='echo ''test  secondary '' | xclip -sel  secondary XA_SECONDARY'
alias test_xclip_clipboard='echo ''test clipboard '' | xclip -sel clipboard'
function echo_clipboard {
    echo 'test primary' | xclip -sel primary
    echo 'test secondary' | xclip -sel secondary
    echo 'test clipboard' | xclip -sel clipboard
    echo -e '\nXA_PRIMARY:' $XA_PRIMARY
    echo -e 'XA_SECONDARY:' $XA_SECONDARY
    echo -e 'XA_PRIMARY:' $XA_PRIMARY '\n'
}
