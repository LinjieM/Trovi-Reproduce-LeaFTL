#!/bin/bash
set -x
sudo apt update
sudo apt install -y python3-pip unzip
sudo apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran

pushd .
cd ~
git clone https://github.com/my-HenryS/LeaFTL.git
LeaFTL=~/LeaFTL
cd $LeaFTL
pushd .
# Download traces
cd wiscsee/leaftl_scripts
pip3 install gdown
export PATH="$HOME/.local/bin:$PATH"
gdown 13gS89MNWESywUA3ZGycSwYTFjZ29qdGu
unzip leaftl_traces.zip
popd

# Set Env Variables
export PYTHONPATH=$PYTHONPATH:$(pwd)/wiscsee

# Install Pypy to speedup the experiment running
# You can run WiscSim 2-3× faster with Pypy. You can install Pypy2 with this guide: https://doc.pypy.org/en/latest/install.html.
wget https://downloads.python.org/pypy/pypy2.7-v7.3.9-linux64.tar.bz2
tar xf pypy2.7-v7.3.9-linux64.tar.bz2
export PATH=$PATH:$(pwd)/pypy2.7-v7.3.9-linux64/bin
pypy -m ensurepip

cd $LeaFTL/wiscsee/leaftl_scripts
mkdir -p raw_results plots
pip3 install psutil simpy bitarray bidict scipy pandas matplotlib
pypy -m pip install --upgrade "pip==20.3.4" "setuptools==44.1.1"  "wheel==0.37.1"
pypy -m pip install "numpy==1.16.6"
pypy -m pip install "scipy==1.2.3"
pypy -m pip install "objgraph==3.5.0"
pypy -m pip install mmh3==2.5.1 config workflow simpy bitarray==2.9.3 bidict

# Install dependencies
popd