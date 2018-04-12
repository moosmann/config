#!/bin/zsh
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
export CUDA_PATH=/usr/local/cuda-7.5
#export PATH=/usr/local/cuda-7.0/bin/:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/cuda-7.0/targets/x86_64-linux/lib/:$LD_LIBRARY_PATH
#export CUDA_HOME=/usr/local/cuda/
export PYTHONPATH=$CUDA_PATH/lib64/:$PYTHONPATH

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
export NO_AT_BRIDGE=1

# IDL unit test
#export PATH=/home/moosmanj/idl/mgunit/src/:$PATH

# Set timezone. If empty it can raise a Matlab warning when batch jops are executed
export TZ='Europe/Berlin'

# ASTRA
export PATH=/opt/matlab/R2016b/bin/:$PATH
export MATLAB_USER_PATH=/asap3/petra3/gpfs/common/p05/jm/matlab
# ASTRA 1.8 local
ASTRA_PATH=/asap3/petra3/gpfs/common/p05/astra/1.8
export LD_LIBRARY_PATH=$ASTRA_PATH/lib:$CUDA_PATH/lib64/:$LD_LIBRARY_PATH
export MATLABPATH=$ASTRA_PATH/matlab/mex/:$ASTRA_PATH/matlab/tools/:$ASTRA_PATH/samples/matlab/:$MATLABPATH
################ commented because of conda
#export PYTHONPATH=$ASTRA_PATH/python:$PYTHONPATH

#export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:$LD_LIBRARY_PATH

# local gcc 4.9
#export LD_LIBRARY_PATH=$HOME/gcc/gcc/lib64/:$LD_LIBRARY_PATH
#export PATH=$HOME/gcc/gcc/bin:$PATH
COMMON_HOME=/asap3/petra3/gpfs/common/p05/jm
export LD_LIBRARY_PATH=$COMMON_HOME/gcc/lib64/:$LD_LIBRARY_PATH
export PATH=$COMMON_HOME/gcc/bin:$PATH

# feh
export LD_LIBRARY_PATH=/asap3/petra3/gpfs/common/p05/jm/lib:$LD_LIBRARY_PATH

# xclip, feh
export PATH=/asap3/petra3/gpfs/common/p05/jm/bin:$PATH
export MANPATH=/asap3/petra3/gpfs/common/p05/jm/share/man:$MANPATH

# anaconda
# maxwell installation
# export PATH=/opt/anaconda/3/bin:$PATH
# local installation
export PATH=$HOME/anaconda3/bin:$PATH
export OPENCL_VENDOR_PATH=/etc/OpenCL/vendors
