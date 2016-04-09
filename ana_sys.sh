#!/usr/bin/env bash
# Link to Anaconda's Python
# $ANACONDA_PATH is the path to your anaconda folder

# BIN
cd /usr/bin

if [ ! -h python ]; then
    sudo mv python python_orig;
else
    sudo unlink python;
fi
sudo ln -s $ANACONDA_PATH/bin/python python

if [ ! -h python-config ]; then
    sudo mv python-config python-config_orig;
else
    sudo unlink python-config;
fi
sudo ln -s $ANACONDA_PATH/bin/python-config python-config

# INCLUDE
cd /usr/include

sudo unlink python2.7
sudo ln -s $ANACONDA_PATH/include/python2.7 python2.7

# LIB
cd /usr/lib

sudo unlink python2.7
sudo unlink libpython2.7.dylib
sudo ln -s $ANACONDA_PATH/lib/python2.7 python2.7
sudo ln -s $ANACONDA_PATH/lib/libpython2.7.dylib libpython2.7.dylib