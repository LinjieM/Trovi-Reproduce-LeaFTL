#!/bin/bash
pushd .
LeaFTL=~/LeaFTL
cd $LeaFTL/wiscsee/leaftl_scripts

./batch memory_batch 20
./plot_all memory_batch

popd