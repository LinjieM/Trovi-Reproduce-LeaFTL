#!/bin/bash

LeaFTL=~/LeaFTL
pushd .

cd $LeaFTL/wiscsee/leaftl_scripts
mkdir -p raw_results plots
sudo apt install -y pypy-dev
pip3 install psutil simpy bitarray bidict scipy pandas matplotlib
pypy -m pip install --upgrade "pip==20.3.4" "setuptools==44.1.1"  "wheel==0.37.1"
pypy -m pip install "numpy==1.16.6"
pypy -m pip install "scipy==1.2.3"
pypy -m pip install "objgraph==3.5.0"
pypy -m pip install mmh3==2.5.1 config workflow simpy bitarray==2.9.3 bidict

popd