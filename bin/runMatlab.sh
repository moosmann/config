#!/bin/sh
LIB_GCC=/usr/lib/gcc/x86_64-linux-gnu/4.8/ LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:$LIB_GCC/libgfortran.so:$LIB_GCC/libgcc_s.so:$LIB_GCC/libstdc++.so:$LIB_GCC/libgomp.so LD_LIBRARY_PATH=/usr/local/lib:/usr/local/cuda/lib64:/usr/local/astra/lib:/usr/lib/gcc/x86_64-linux-gnu/4.8/:$LD_LIBRARY_PATH /usr/local/bin/matlab -nosplash -desktop

# export LIB_GCC=/usr/lib/gcc/x86_64-linux-gnu/4.8/
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/gcc/x86_64-linux-gnu/4.8/:/
# export LD_PRELOAD=$LIB_GCC/libgfortran.so:$LIB_GCC/libgcc_s.so:$LIB_GCC/libstdc++.so:$LIB_GCC/libgomp.so
# matlab $* -singleCompThread -r "addpath('./build/'); addpath('./test_release'); setenv('MKL_NUM_THREADS','1'); setenv('MKL_SERIAL','YES');"


#LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6 LD_LIBRARY_PATH=/usr/local/astra/lib:/usr/local/cuda/lib64:$LD_LIBRARY_PATH /usr/local/bin/matlab -nosplash

