# Use as: MY PORT MACHINE

if [ "$2" == "d1" ]; then
    ssh -N -f -L localhost:$1:localhost:8888 jastrs01@dlr1.nyumc.org
fi

if [ "$2" == "d3" ]; then
    ssh -N -f -L localhost:$1:localhost:8888 jastrs01@dlr3.nyumc.org
fi


if [ "$2" == "skygpu" ]; then
    ssh -N -f -L localhost:$1:localhost:$4 jastrs01@skygpu$3.nyumc.org
fi


# TB

if [ "$2" == "tbd1" ]; then
    ssh -N -f -L localhost:$1:localhost:$3 jastrs01@dlr1.nyumc.org
fi


if [ "$2" == "tbd3" ]; then
    ssh -N -f -L localhost:$1:localhost:7777 jastrs01@dlr3.nyumc.org
fi

if [ "$2" == "tbd4" ]; then
    ssh -N -f -L localhost:$1:localhost:7777 jastrs01@dlr4.nyumc.org
fi

