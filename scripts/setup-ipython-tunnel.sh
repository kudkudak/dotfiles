if [ "$2" == "truten" ]; then
    ssh -N -f -L localhost:$1:localhost:8888 <USER>@<HOST>
fi
