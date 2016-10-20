#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors

source $HOME/.aliases

# PYTHON_PATH
#export PYTHONPATH=$HOME/.local/lib/python2.7/
#export PYTHONPATH=$HOME/.local/lib/python3.4/
# export PYTHONPATH=$HOME/hzg/:$PYTHONPATH
#PYTHONPATH=$PYTHONPATH:$HOME/.local/bin/

# LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/lib/

# NVIDIA CUDA
#export PATH=/usr/local/cuda/bin/:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/cuda-7.0/targets/x86_64-linux/lib/:$LD_LIBRARY_PATH
#export CUDA_HOME=/usr/local/cuda/
#export PYTHONPATH=/usr/local/cuda/lib64/:$PYTHONPATH

# ASTRA
# local
#export PYTHONPATH=$HOME/astra/python/:$PYTHONPATH
#export LD_LIBRARY_PATH=$HOME/astra/lib/:$LD_LIBRARY_PATH
# glocal ASTRA
#export LD_LIBRARY_PATH=/usr/local/astra/lib:$LD_LIBRARY_PATH

# Virtualenvwrapper
#export WORKON_HOME=$HOME/virtual_env

# matplotib backend to use, necessary for virtualenv
#export MPLBACKEND="module://PyQt4"

# GTK accessibility warning 
# export NO_AT_BRIDGE=1

# IDL unit test
export PATH=/home/moosmanj/idl/mgunit/src/:$PATH

# ASTRA 1.7.1
export LD_LIBRARY_PATH=/opt/xray/astra-toolbox/1.7.1/lib:/usr/local/cuda-7.0/lib64/:$LD_LIBRARY_PATH
export MATLABPATH=/opt/xray/astra-toolbox/1.7.1/matlab/mex:/opt/xray/astra-toolbox/1.7.1/matlab/tools:$MATLABPATH
export PATH=/opt/matlab/R2016b/bin/:$PATH
export PYTHONPATH=/opt/xray/astra-toolbox/1.7.1/python:$PYTHONPATH

