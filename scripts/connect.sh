#!/bin/sh

if [ "$#" == 0 ] || [ "$1" == "uj" ]; then
    sudo umount ~/sshfs/uj
    sshfs jastrzebski@truten.capdnet:/home/jastrzebski/ ~/sshfs/uj -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
fi


if [ "$#" == 0 ] || [ "$1" == "edi" ]; then
    sudo umount ~/sshfs/edi
    sshfs v1sjastr@stonesoup.inf.ed.ac.uk:/afs/inf.ed.ac.uk/user/v/v1sjastr/ ~/sshfs/edi -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
fi

if [ "$1" == "dlr1" ]; then
    sudo umount ~/sshfs/dlr1
    sshfs jastrs01@dlr1.nyumc.org:/home/jastrs01 ~/sshfs/dlr1 -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
fi




if [ "$1" == "geraslab" ]; then
    sudo umount ~/sshfs/geraslab
    sshfs jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab/jastrs01 ~/sshfs/geraslab -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
fi

if [ "$1" == "geraslab_skynet" ]; then
    sudo umount ~/sshfs/geraslab
    sshfs jastrs01@skynet.nyumc.org:/gpfs/data/geraslab/jastrs01 ~/sshfs/geraslab -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
fi


if [ "$1" == "geraslabroot" ]; then
    sudo umount ~/sshfs/geraslabroot
    sshfs jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab ~/sshfs/geraslabroot -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
fi



