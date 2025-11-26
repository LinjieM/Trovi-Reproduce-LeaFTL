#!/bin/bash

sudo apt update
sudo apt install -y python3-pip unzip
sudo apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran

pushd .
cd ~
git clone https://github.com/my-HenryS/LeaFTL.git
LeaFTL=~/LeaFTL
cd LeaFTL
pushd .
# Download traces
cd wiscsee/leaftl_scripts
pip3 install gdown
export PATH="$HOME/.local/bin:$PATH"
echo "PATH=$HOME/.local/bin:$PATH" >> ~/.bashrc
gdown 13gS89MNWESywUA3ZGycSwYTFjZ29qdGu
unzip leaftl_traces.zip
popd

# Set Env Variables
export PYTHONPATH=$PYTHONPATH:$(pwd)/wiscsee
echo "PYTHONPATH=$PYTHONPATH:`pwd`/wiscsee" >> ~/.bashrc

# Install Pypy to speedup the experiment running
# You can run WiscSim 2-3× faster with Pypy. You can install Pypy2 with this guide: https://doc.pypy.org/en/latest/install.html.
wget https://downloads.python.org/pypy/pypy2.7-v7.3.9-linux64.tar.bz2
tar xf pypy2.7-v7.3.9-linux64.tar.bz2
export PATH=$PATH:$(pwd)/pypy2.7-v7.3.9-linux64/bin
echo "PATH=$PATH:`pwd`/pypy2.7-v7.3.9-linux64/bin" >> ~/.bashrc
pypy -m ensurepip

# Install dependencies
popd