# New tmux session

tmux new -s isotropy

# Delete large h5 fiels

find /data/milatmp1/jastrzes/isotropy/results/wojtek  -name '*h5' | xargs rm