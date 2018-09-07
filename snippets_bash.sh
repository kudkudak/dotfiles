# New tmux session

tmux new -s isotropy

# Delete large h5 fiels

find /data/milatmp1/jastrzes/isotropy/results/wojtek  -name '*h5' | xargs rm

# New repo
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda create --name $PNAME
conda install tensorflow-gpu numpy matplotlib keras tqdm seaborn

# SSH key copy
ssh-copy-id user@server