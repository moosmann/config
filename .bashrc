# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


############################################################
## PERSONAL SETTINGS
############################################################

# and more some more ls aliases
alias lla='ls -lAF'
alias llh='ls -lh'
alias lah='ls -Ah'
alias lrt='ls -lrt'
alias lsa='ls -A'

# LaTeX, dvipdf, acroread
#alias lda='latex MHB_prl.tex && dvipdf MHB_prl.dvi && acroread MHB_prl.pdf &'

# acroread
function acro()
{
    acroread  $1 &
}

#grep aliases
# alias psgrep='ps -eo pid,user,ni,%cpu,%mem,time,etime,start,comm | grep -e PID -e'
function psgrep() 
{
    ps -eo pid,user,ni,%cpu,%mem,time,etime,start,comm | grep -e COMMAND -i -e $1
}

# convert endnote to ris
 function enw2ris()
{
    end2xml $1 | xml2ris > "${1/%enw/ris}"
}
 function ris2bib()
{
    ris2xml $1 | xml2bib > "${1/%ris/bib}"
}

# Set some generic aliases
alias o='less'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias cd..='cd ..'

# emacs
#export EDITOR=emacsclient
#export ALTERNATE_EDITOR=""
#alias emacs='/usr/bin/emacsclient -a /usr/bin/emacs'
# start emacs with and a file as parameter and quit
function emacsandquit ()
{
  emacs $1 &
}
alias e='emacsandquit'
alias nemacs='emacs -nw'
alias edit='emacs'
alias editemacsconfig='emacsandquit $HOME/.emacs.d/init.el'
alias ee='editemacsconfig'

# sourcing
alias bsource='source $HOME/.bashrc'
alias psource='source $HOME/.profile'
# Edit and reload .bashrd
alias editbashrc='emacs $HOME/.bashrc;source $HOME/.bashrc'
alias eb='editbashrc'
# Edit and reload .profile
alias editprofile='emacs $HOME/.profile;source $HOME/.profile'
alias ep='editprofile'

# MATLAB short cut
#alias ml='synclient HorizEdgeScroll=0 HorizTwoFingerScroll=0 && matlab -nosplash -desktop &'
alias ml='$HOME/bin/runMatlab.sh &'
alias mln='$HOME/bin/runMatlabConsole.sh'
#alias mln='matlab -nosplash -nodesktop -nodisplay'

# some ssh aliases
alias sufonoX='ssh hp9361@ufosrv1.anka.kit.edu'
alias sufo='sufonoX -X'
alias stomo2noX='ssh hp9361@anka-tomo2.anka.kit.edu'
alias stomo2='stomo2noX -X'
alias steslanoX='ssh hp9361@anka-tesla.anka.kit.edu'
alias stesla='steslanoX -X'
alias slasnoX='ssh hp9361@anka-las.anka.kit.edu'
alias slas='slasnoX -X'
alias smoos='ssh -X hp9361@iss-moosmann.anka.kit.edu'
alias sitp='ssh -X julian@ssh-itp.particle.uni-karlsruhe.de'
alias sanka8='ssh -XYp24 moosmann@anka8.anka.kit.edu'
alias sanka8noX='ssh -Xp24 moosmann@anka8.anka.kit.edu'
alias sjumo='ssh -X julian@192.168.0.101'
alias sesrf='ssh -Xp5022 ls2395@firewall.esrf.fr'
alias skth='ssh -X jmoosmann@130.237.41.55'

# port forwarding to computational server over anka8
function portforward ()
{    
    #local LOCALPORT=$1;
    LOCALPORT=$1;
    local SERVER=$2;
    if [ -z "${2}" ]; then
	SERVER=anka-tomo2;
    fi
    local SERVERLOGIN=$3;
    if [ -z "${3}" ]; then
	SERVERLOGIN=hp9361;
    fi
    local SECURECHANNEL=$4;
    if [ -z "${4}" ]; then
	SECURECHANNEL=anka8.anka.kit.edu;
    fi
    local SECURECHANNELPORT=$5;
    if [ -z "${5}" ]; then
	SECURECHANNELPORT=24;
    fi
    local SECURECHANNELUSER=$6;
    if [ -z "${6}" ]; then
	SECURECHANNELUSER=moosmann;
    fi
    if [ -z "${1}" ]; then
	echo -e USAGE: portforward LOCALPORT SERVER SERVERLOGIN SECURECHANNEL SECURECHANNELPORT SECURECHANNELUSER \(DEFAULT: \$1 $SERVER $SERVERLOGIN $SECURECHANNEL $SECURECHANNELPORT $SECURECHANNELUSER\);
	return
    fi
# Establish tunnel
  ssh -YX -f -L $LOCALPORT:$SERVER:22 $SECURECHANNELUSER@$SECURECHANNEL -p$SECURECHANNELPORT -N;
# Print information
  echo -e Local port $LOCALPORT is forwarded to port 22 of server $SERVER via port $SECURECHANNELPORT of $SECURECHANNELUSER@$SECURECHANNEL;

}

# Login to porforwarded server
function slocal () {
    local PORT=$1;
    local USER=$2;
    if [ -z "${2}" ]; then
	USER=hp9361;
    fi
    if [ -z "${1}" ]; then
	  echo -e USAGE: slocal PORT USERNAME \(DEFAULT: \$1 $USER\) \(ssh -XYpPORT USERNAME@localhost\)
	  return
    fi
    echo -e Login of user $USER  to localhost on port $PORT 
    ssh -XYp$PORT $USER@localhost
}
function slocalnoX () {
    local PORT=$1;
    local USER=$2;
    if [ -z "${2}" ]; then
	USER=hp9361;
    fi
    if [ -z "${1}" ]; then
	  echo -e USAGE: slocal PORT USERNAME \(DEFAULT: \$1 $USER\) \(ssh -XYpPORT USERNAME@localhost\)
	  return
    fi
    echo -e Login of user $USER  to localhost on port $PORT 
    ssh -p$PORT $USER@localhost
}

#ssh -f -L 12345:anka-nc-gpu1:22 anka8.anka.kit.edu -p24 -N

# ssh function 
function sncgpu ()
{
  ssh -X hp9361@anka-nc-gpu$1.anka.kit.edu
}
function snccpu ()
{
  ssh -X hp9361@anka-nc-cpu$1.anka.kit.edu
}

# ssh aliases for guake
alias ufo='guake -n UFO -r ufo -e sufo'
alias ufonoX='guake -n UFONOX -r ufonoX -e sufonoX'
alias tesla='guake -n TESLA -r tesla -e stesla'
alias teslanoX='guake -n TESLANOX -r teslanoX -e steslanoX'
alias tomo2='guake -n TOMO2 -r tomo2 -e stomo2'
alias tomo2noX='guake -n TOMO2NOX -r tomonoX -e stomo2noX'
alias las='guake -n LAS -r las -e slas'
alias lasnoX='guake -n LASNOX -r lasnoX -e slasnoX'
alias anka8='guake -n ANKA8 -r anka8 -e sanka8'
alias moschd='guake -n MOSCHD -r moschd -e smoschd'
alias esrf='guake -n ESRF -r esrf -e sesrf'
alias kth='guake -n KTH -r kth -e skth'

# ssh function for guake
function jumo ()
{
    guake -n JUMO -r jumo -e  sjumo
}
function ncgpu ()
{
    local VAR=$1;
    if [ -z "${1}" ]; then
	VAR=$[RANDOM % 4 + 1];
    fi
    guake -n NCGPU$VAR -r ncgpu$VAR -e  "ssh -X hp9361@anka-nc-gpu$VAR.anka.kit.edu"
}
function nccpu ()
{
    local VAR=$1;
    if [ -z "${1}" ]; then
	VAR=$[RANDOM % 4 + 1];
    fi
    guake -n NCCPU$VAR -r nccpu$VAR -e  "ssh -X hp9361@anka-nc-cpu$VAR.anka.kit.edu"
}
function ncgpunoX ()
{
    local VAR=$1;
    if [ -z "${1}" ]; then
	VAR=$[RANDOM % 4 + 1];
    fi
    guake -n NCGPUNOX$VAR -r ncgpunoX$VAR -e  "ssh hp9361@anka-nc-gpu$VAR.anka.kit.edu"
}
function nccpunoX ()
{
    local VAR=$1;
    if [ -z "${1}" ]; then
	VAR=$[RANDOM % 4 + 1];
    fi
    guake -n NCCPUNOX$VAR -r nccpunoX$VAR -e  "ssh hp9361@anka-nc-cpu$VAR.anka.kit.edu"
}

# sshfs
USERID=43637;#ID of hp9361
GROUPID=80605;#ANKA-universal-imaging-group
alias anka8_home='sshfs -p24 moosman@anka8.anka.kit.edu:/home/moosman /home/hp9361/mounts/anka8_home -o uid=$USERID -o gid=$GROUPID'
alias tesla_home='sshfs hp9361@anka-tesla.anka.kit.edu:/home/ws/hp9361 /home/hp9361/mounts/tesla_home -o uid=$USERID -o gid=$GROUPID'
alias tesla_lsdf='sshfs hp9361@anka-tesla.anka.kit.edu:/mnt/tomoraid-LSDF /home/hp9361/mounts/tesla_lsdf -o uid=$USERID -o gid=$GROUPID'
alias tomo2_home='sshfs hp9361@anka-tomo2.anka.kit.edu:/home/ws/hp9361 /home/hp9361/mounts/tomo2_home -o uid=$USERID -o gid=$GROUPID'
alias tomo2_lsdf='sshfs hp9361@anka-tomo2.anka.kit.edu:/mnt/tomoraid-LSDF /home/hp9361/mounts/tomo2_lsdf -o uid=$USERID -o gid=$GROUPID'
alias las_home='sshfs hp9361@anka-las.anka.kit.edu:/home/ws/hp9361 /home/hp9361/mounts/las_home -o uid=$USERID -o gid=$GROUPID'
alias las_lsdf='sshfs hp9361@anka-las.anka.kit.edu:/mnt/tomoraid-LSDF /home/hp9361/mounts/las_lsdf -o uid=$USERID -o gid=$GROUPID'
alias nccpu4_home='sshfs hp9361@anka-nc-cpu4.anka.kit.edu:/home/ws/hp9361 /home/hp9361/mounts/nccpu_home -o uid=$USERID -o gid=$GROUPID'
alias nccpu4_lsdf='sshfs hp9361@anka-nc-cpu4.anka.kit.edu:/mnt/LSDF /home/hp9361/mounts/nccpu_lsdf -o uid=$USERID -o gid=$GROUPID'
alias moschd_home='sshfs bembel@192.168.0.1:/home/bembel /home/hp9361/mounts/home_moschd -o uid=$USERID -o gid=$GROUPID'
alias lsdf_tomo2='sshfs hp9361@anka-tomo2.anka.kit.edu:/mnt/tomoraid-LSDF /mnt/tomoraid-LSDF -o uid=$USERID -o gid=$GROUPID'
alias lsdf_tesla='sshfs hp9361@anka-tesla.anka.kit.edu:/mnt/tomoraid-LSDF /mnt/tomoraid-LSDF -o uid=$USERID -o gid=$GROUPID'
alias lsdf_las='sshfs hp9361@anka-las.anka.kit.edu:/mnt/tomoraid-LSDF /mnt/tomoraid-LSDF -o uid=$USERID -o gid=$GROUPID'
function lsdf_ncgpu ()
{
    local VAR=$1;
    if [ -z "${1}" ]; then
	VAR=$[RANDOM % 4 + 1];
    fi
    echo "Mount LSDF on /mnt/LSDF/ using anka-nc-gpu$VAR.anka.kit.edu"
    sshfs hp9361@anka-nc-gpu$VAR.anka.kit.edu:/mnt/tomoraid-LSDF /home/hp9361/mounts/ncgpu_lsdf -o uid=$USERID -o gid=$GROUPID
}

# mayavi2
# function mavi ()
# {
#   mayavi2  -d $1 -m Outline -m GridPlane -m Axes -s "module_manager.scalar_lut_manager.show_scalar_bar = True"
# }
# function mavi2 ()
# {
#   mayavi2  -d $1 -m Axes -m Outline -m ContourGridPlane  -M newmanager -f Threshold -m SurfaceMap
# }

# gnuplot short cut
# alias gnuplot='gnuplot -persist -raise'
# function gnusplot ()
# {
# gb="'set pm3d map; splot \"$1\" binary;'"
# eval "gnuplot -e $gb"
# }

#alias xfiglatex='xfig -specialtext -latexfonts -startlatexFont default'

# ImageJ / Fiji
#alias imagej='$HOME/.imagej/ij'
#alias ij='imagej &'
alias imagej='$HOME/Software/ImageJ/ImageJ'
alias ij='imagej &'
alias fiji='$HOME/Software/Fiji.app/ImageJ-linux64'
alias fj='fiji &'
alias fiji_imagesequence='fiji --run "Image Sequence..."'

# top
alias topme='top -u $USER'
alias topm='topme'

# convert images of format $1 to fomrat $2
function imconverter ()
{
    if [ -z "${1}" ]; then
	echo -e USAGE: imconverter FORMAT1 FORMAT2
	return
    fi
    echo -e \n'Convert' $1 'images to' $2 'images\n'
    for file in *.$1;do convert "$file" "${file/%$1/$2}";done
}
alias convertimages='imconverter'

# convert videos of input format $1 to format msmpeg4 compatible with Microsoft Office 2010 64-bit
function vidconverter ()
{
    if [ -z "${1}" ]; then
	echo -e USAGE: vidconverter INPUTFORMAT BITRATE \(DEFAULT: vidconverter \$1 8000k\)
	return
    fi
    if [ -z "${2}" ]; then
	BITRATE=8000k
    fi
    for f in *.$1
    do avconv -i $f -vcodec msmpeg4 -vb $BITRATE -an ${f/%$1/avi};
    done
}

# create poster images from video
function posterimage ()
{
    local file=$1
    avconv -i $file -vframes 1 -an -f image2 -y ${file/.avi/}.jpg
}


# cd aliases for LSDF directories
#if [ -f /mnt/tomoraid-LSDF/users/moosmann/bash_lsdf_aliases ]; then
#    . /mnt/tomoraid-LSDF/users/moosmann/bash_lsdf_aliases
#fi

# mount and unmount mtp phone
#alias phone='jmtpfs ~/mounts/phone/'
#alias uphone='fusermount -u ~/mounts/phone'
# mount and unmount exfat partition
#alias exfat='sudo mount -t exfat /dev/mmcblk0p1 ~/mounts/exfat'
#alias uexfat='sudo umount ~/mounts/exfat'

# recursively count files in current folder
alias countfiles='echo -e "Current folder: $PWD\nNumber of files contained in current folder: ";find . -type f -print | wc -l'
# recursively count folders in current folder
function countdir ()
{    
    local OUTPUT;
    OUTPUT=$(find . -type d | wc -l);
    echo $OUTPUT-1 | bc
}
alias countfolders='countdir'
 
# connect smartphone camera via usb to laptop
#alias usbcam='adb forward tcp:4747 tcp:4747 && droidcam &'

# screen
alias screenl='screen -list'
alias screenr='screen -r'

# extract and compress using tar and gz
# Compress: tar -cvzf filename.tar.gz FILES_OR_DIRECTORIES
# Extract: tar -xvzf filename.tar.gz
alias tarc='tar -cvzf'
alias tarx='tar -xvzf'

# gnome-terminal alias
#alias max='gnome-terminal --maximize'

# tree command
alias treed='tree -d'

# CWI specific 
# SSH
#alias scromba='ssh -XY moosmann@cromba.sen.cwi.nl'
#alias scrombanoX='ssh -x  moosmann@cromba.sen.cwi.nl'
#alias cromba='$HOME/bin/open-new-tab-in-gnome-terminal && scromba'
#alias cormba_scratch1='sshfs moosmann@cromba.sen.cwi.nl:/export/scratch1/moosmann $HOME/scratch1 -o uid=$USERID -o gid=$GROUPID'
#
# MATLAB short cut
#alias ml='$HOME/ASTRAToolbox/runMatlab.sh &'
#alias mln='$HOME/ASTRAToolbox/runMatlabConsole.sh'
#
# cd
#alias cdscratch='cd /export/scratch1/moosmann/'

# open files
#alias gnomeshorts='emacs $HOME/Documents/gnomeShorts.txt '&
#alias shorts='gnomeshorts'
alias wiki='emacs $HOME/wiki.txt &'
alias media='/usr/bin/libreoffice -o $HOME/Dropbox/doc_conf/media.ods &'

# start globus connect
alias globusconnect='~/bin/globusconnectpersonal-2.0.2/globusconnect &'
alias gb='globusconnect'

# define phd working directory in  bash variable
pd=~/LATEX/phdthesis/
# open phdthesis.tex
#alias phd='cd ~/LATEX/phdthesis/;emacs phdthesis.tex&'
function phd ()
{
    guake -n phd -r phd -e "cd ~/LATEX/phdthesis/ && e phdthesis.tex "
}

# fex belwue
alias fexsend='$HOME/bin/fex/fexsend'
alias fexget='$HOME/bin/fex/fexget'

# check 3D-support
alias checkunity3d='sudo /usr/lib/nux/unity_support_test -p'

# jabref
alias jr='jabref -s &'

# XOP
alias xop='/home/hp9361/Software/imaging/xop/xop2.3/xop &'

# cd aliases
alias cdphd='cd ~/LATEX/phdthesis'
alias cdfig='cd ~/LATEX/phdthesis/figures'
alias cdref='cd ~/Dropbox/REFERENCES'
alias cdrefile='cd ~/Dropbox/REFERENCES/Files'
alias cdlcr='cd ~/git-kth/LCR'
alias cdastra='cd /usr/local/astra'
alias cdpyastra='cd /usr/local/astra/python'

# Show graphics cards and drivers
alias lsvga='lspci | grep -i VGA'
alias lsvgakernel='lspci -knn | grep -A2 VGA'
alias catdriver='cat /proc/driver/nvidia/version'

# echo 
alias echold_library_path='echo $LD_LIBRARY_PATH'
alias echolibrary_path='echo $LIBRARY_PATH'
alias echopath='echo $PATH'
alias echocudaroot='echo $CUDA_ROOT'

# ParaView
#alias paraview='$HOME/Software/ParaView/ParaView-4.3.1-Linux-64bit/bin/paraview'
#alias pv='paraview'

# FreeSurfer Tutorial
function freesurfer_tutorial() 
{
    #Set variables to point FreeSurfer to data
    export TUTORIAL_DATA=/media/datadrive/FreeSurfer_Tutorial_Datasets
    export SUBJECTS_DIR=$TUTORIAL_DATA/buckner_data/tutorial_subjs/
    #source $FREESURFER_HOME/SetUpFreeSurfer.sh
    cd $SUBJECTS_DIR
}

# X-server
alias xstop='sudo service lightdm stop'
alias xstart='sudo service lightdm restart'

# PyCharm
alias pycharm-professional='/usr/local/pycharm/bin/pycharm.sh'
alias pycharm-community='/usr/local/pycharm-community/bin/pycharm.sh'
#alias pycharm='pycharm-professional'
alias pycharm='pycharm-community'

# Install PyCharm
function installPyCharmCommunity(){
    
    # Arguments and variables
    local FILE=$1
    local INSTALLDIR=$2
    local SYMLINK=$3
    local PYCHARM=${FILE%.tar.gz}    
    if [ -z "${2}" ]; then
	INSTALLDIR=/usr/local/
    fi
    if [ -z "${3}" ]; then
	SYMLINK=pycharm-community
    fi

    # Usage
    if [ -z "${1}" ]; then
	echo -e USAGE: installPyCharm TARGZFILE INSTALLDIR SYMLINKNAME \(DEFAULT: \$1 $INSTALLDIR $SYMLINK\);
	return
    fi

    echo -e Unpack $FILE to $INSTALLDIR
    sudo tar xfz $FILE --directory $INSTALLDIR

    echo -e Remove symbolic link \'$SYMLINK\' to
    readlink $INSTALLDIR$SYMLINK
    sudo rm $INSTALLDIR$SYMLINK

    echo -e Create new symbolic link \'$SYMLINK\' to $INSTALLDIR$PYCHARM:
    sudo ln -rs  $INSTALLDIR/$PYCHARM $INSTALLDIR$SYMLINK
    readlink $INSTALLDIR$SYMLINK

    echo -e To open PyCharm run pycharm.sh from the bin subdirectory:
    ls $INSTALLDIR$SYMLINK/bin/pycharm.sh
    
    echo Optionally, delete deprecated pycharm installations
}


# Spyder with multithread
alias spydermt='spyder --multithread &'

# git
alias gitShowTrackedFiles='git ls-tree -r master --name-only'

function gitStatus()
{    
    local cwd=$(pwd)

    echo -e "\nConfig repo: .bashrc, .profile, bin, ..."
    cd ~/
    git status 

    echo -e "\nEmacs repo:"
    cd ~/.emacs.d
    git status 

    echo -e "\nMATLAB repo:"
    cd ~/matlab
    git status 

    echo -e "\n"
    
    cd $cwd
}

# Restart ssh daemon sshd
#alias sshdrestart='sudo /etc/init.d/sshd restart'
#alias sshdrestart='sudo service ssh restart'
alias sshdrestart='sudo restart ssh'

######################################################################
# temporary project links
alias cdhamburg='cd ~/latex/beamer/2015-08-17_Moosmann_Hamburg-Philipps'
alias hamburg='pdfpc ~/latex/beamer/2015-08-17_Moosmann_Hamburg-Philipps/hamburg.pdf'
