#!/bin/bash
pushd .

LeaFTL=~/LeaFTL

export PYTHONPATH=$PYTHONPATH:$LeaFTL/wiscsee
export PATH=$PATH:$LeaFTL/pypy2.7-v7.3.9-linux64/bin

cd $LeaFTL/wiscsee/leaftl_scripts

./batch memory_batch 20
./plot_all memory_batch

popd