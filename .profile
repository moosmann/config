# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Default EDITOR
export EDITOR=emacsclient

# LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# NVIDIA CUDA
#PATH=/usr/local/cuda/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# ASTRA
#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
# PyASTRA
export LD_LIBRARY_PATH=/usr/local/astra/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/usr/local/astra/python:$PYTHONPATH

# NiftyRec
export LD_LIBRARY_PATH=/usr/local/niftyrec:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/Software/NiftyRec/NiftyRec-2.0.1/build/bin:$LD_LIBRARY_PATH

# Python
export PYTHONSTARTUP=~/.pythonrc
export PYTHONPATH=~/git/LCR/libastra/python:$PYTHONPATH
export PYTHONPATH=~/git/LCR/libastra/pyastra:$PYTHONPATH
export PYTHON_NUMPY_INCLUDE_DIR=/usr/local/lib/python2.7/dist-packages/numpy/core/include

# FreeSurfer
export FREESURFER_HOME=/usr/local/freesurfer
# putting statement in bash, to check if it works
# source $FREESURFER_HOME/SetUpFreeSurfer.sh

# FSL
#export FSLDIR=`pwd`/fsl
#. ${FSLDIR}/etc/fslconf/fsl.sh

# required for building libwavelets
export MATLAB_ROOT=usr/local/MATLAB/R2014b
