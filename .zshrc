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

# Anaconda maxwell installation
# export PATH=/opt/anaconda/3/bin:$PATH

# Anaconda local installation
# uncomment for ASTRA Installation
#export PATH=$HOME/anaconda3/bin:$PATH
#export PYTHONPATH=/anaconda3/bin:$PYTHONPATH

# gcc 4.9, local installation
##### CLEAN UP THAT MESS
# for Matlab < 2018a
export LD_LIBRARY_PATH=$HOME/gcc/gcc/lib64/:$LD_LIBRARY_PATH
export PATH=$HOME/gcc/gcc/bin:$PATH
# for Matlab >=2018a
#export LD_LIBRARY_PATH=/opt/rh/devtoolset-6/root/lib64:$LD_LIBRARY_PATH
#export PATH=/opt/rh/devtoolset-6/root/bin:$PATH
#COMMON_HOME=/asap3/petra3/gpfs/common/p05/jm
#$export LD_LIBRARY_PATH=$COMMON_HOME/gcc/lib64/:$LD_LIBRARY_PATH
#export PATH=$COMMON_HOME/gcc/bin:$PATH


# NVIDIA CUDA
export CUDA_PATH=/usr/local/cuda-7.5
#export PATH=/usr/local/cuda-7.0/bin/:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/cuda-7.0/targets/x86_64-linux/lib/:$LD_LIBRARY_PATH
#export CUDA_HOME=/usr/local/cuda/
export PYTHONPATH=$CUDA_PATH/lib64/:$PYTHONPATH

# NVIDIA cuDNN
# probably conflicts with cuda-9.0
#export LD_LIBRARY_PATH=/asap3/petra3/gpfs/common/p05/jm/cuda/lib64:$LD_LIBRARY_PATH


# ASTRA
#export PATH=/opt/matlab/R2016b/bin/:$PATH
export MATLAB_USER_PATH=/asap3/petra3/gpfs/common/p05/jm/matlab

# ASTRA 1.8 local
ASTRA_PATH=/asap3/petra3/gpfs/common/p05/astra/1.8
export LD_LIBRARY_PATH=$ASTRA_PATH/lib:$CUDA_PATH/lib64/:$LD_LIBRARY_PATH
export MATLABPATH=$ASTRA_PATH/matlab/mex/:$ASTRA_PATH/matlab/tools/:$ASTRA_PATH/samples/matlab/:$MATLABPATH
# ASTRA python wrapper, local compilation, commented because of conda
#export PYTHONPATH=$ASTRA_PATH/python:$PYTHONPATH

# resize/move window issues, test:
AWT_TOOLKIT=MToolkit
