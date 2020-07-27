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

# Aliases
source $HOME/.aliases

# GTK accessibility warning 
export NO_AT_BRIDGE=1

# Set timezone. If empty it can raise a Matlab warning when batch jops are executed
export TZ='Europe/Berlin'

# feh
export LD_LIBRARY_PATH=/asap3/petra3/gpfs/common/p05/jm/lib:$LD_LIBRARY_PATH

# xclip, feh
export PATH=/asap3/petra3/gpfs/common/p05/jm/bin:$PATH
export MANPATH=/asap3/petra3/gpfs/common/p05/jm/share/man:$MANPATH
# ???
export OPENCL_VENDOR_PATH=/etc/OpenCL/vendors

# gcc 4.9, local installation
##### CLEAN UP THAT MESS
export LD_LIBRARY_PATH=$HOME/gcc/gcc/lib64/:$LD_LIBRARY_PATH
export PATH=$HOME/gcc/gcc/bin:$PATH

# NVIDIA CUDA
export CUDA_PATH=/usr/local/cuda
export PYTHONPATH=$CUDA_PATH/lib64:$PYTHONPATH
# NVIDIA NVCC
export PATH=$PATH:$CUDA_PATH/bin
# NVIDIA cuDNN
# probably conflicts with cuda-9.0
# deleted cuda path in p05 common
#export LD_LIBRARY_PATH=/asap3/petra3/gpfs/common/p05/jm/cuda/lib64:$LD_LIBRARY_PATH

# ASTRA
export MATLAB_USER_PATH=/asap3/petra3/gpfs/common/p05/jm/matlab
#export MATLAB_VERSION=R2017b
export MATLAB_VERSION=R2018a
#export MATLAB_VERSION=R2018b # par pool not working
#export MATLAB_VERSION=R2019a # par pool not working as 2018b + crashes when executing ASTRA iteration on GPU?
#export MATLAB_VERSION=R2020a

# ASTRA 
#export ASTRA_PATH=/asap3/petra3/gpfs/common/p05/astra/1.9
export ASTRA_PATH=/asap3/petra3/gpfs/common/p05/astra/astra
export LD_LIBRARY_PATH=$ASTRA_PATH/lib:$CUDA_PATH/lib64:$LD_LIBRARY_PATH
export MATLAB_PATH=$ASTRA_PATH/matlab/mex/:$ASTRA_PATH/matlab/tools/:$ASTRA_PATH/samples/matlab:$MATLABPATH
# ASTRA python wrapper, local compilation, commented because of conda
#export PYTHONPATH=$ASTRA_PATH/python:$PYTHONPATH

# FFTW path for SAVU compilation
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH

# set title
case $TERM in
  xterm*)
    #precmd () {print -Pn "\e]0;%~\a"}
    precmd () {print -Pn "\e]0;$HOSTNAME\a"}
    ;;
esac
