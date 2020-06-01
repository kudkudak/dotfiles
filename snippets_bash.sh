# Reverse search is ur friend

Sync plots
rsync -vrpa jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab/jastrs01/code/magic_sgd/experiments/07_19_base_experiment/plotting/* ~/Dropbox/Apps/results_experiments/gpfs/data/geraslab/jastrs01/code/magic_sgd/experiments/07_19_base_experiment/plotting/
rsync -vrpa jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab/jastrs01/code/magic_sgd/experiments/07_19_base_experiment/misc_plotting/* ~/Dropbox/Apps/results_experiments/gpfs/data/geraslab/jastrs01/code/magic_sgd/experiments/07_19_base_experiment/misc_plotting/
rsync -vrpa jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab/jastrs01/code/magic_sgd/experiments/07_19_base_experiment/eyecandy/* ~/Dropbox/Apps/results_experiments/magic_sgd/experiments/07_19_base_experiment/eyecandy/

rsync -vrpa jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab/jastrs01/code/cooperative_optimization/01_2020_grad_penalty/* ~/Dropbox/Apps/results_experiments/cooperative_optimization/01_2020_grad_penalty

# Tmux ++

ssh jastrs01@dlr1.nyumc.org -t "tmux new-session -s user || tmux attach-session -t user"

TODO: Scrirpt to watch files
TODO: Script to start session
TODO: Plotting utils more systematic

# Monitoring GPU

nvidia-smi -lms 500

# New tmux session

tmux new -s isotropy

# Merge pdfs
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combine.pdf -dBATCH 1.pdf 2.pdf

# Delete large h5 fiels

find /data/milatmp1/jastrzes/isotropy/results/wojtek  -name '*h5' | xargs rm

# Cuda version
cat /usr/local/cuda/version.txt
ls /usr/local/ | grep cuda
cuda
cuda-8.0
cuda-9.0
cuda-9.2

# How to start new repo

https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda/#/ 1.6

## Special (POWER)
https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda
conda install -c https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda pytorch tensorflow-gpu

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda create --name $PNAME # ideal
conda create --name $PNAME python=3.6 # py3.6 for tensorflow
conda create --name $PNAME python=2.7 # py2.7 for pytorch
conda install joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn # PyTorch package
## Special (TF-gpu zadlo cuda9), make sure libraries are correctly linked
conda install keras tensorflow-gpu==1.8.0 joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 
## Special (TF-gpu zadlo, CUDA 10. Note - it installs cudnn and cuda automagically)
conda install tensorflow-gpu==1.13.1 
## Special (TF-gpu antman), make sure libraries are correctly linked
conda install keras tensorflow-gpu==1.10.0 joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 
## Special (TF-dlr4)
conda create --name $PNAME python=3.6
conda install keras tensorflow-gpu joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 
pip install itermplot dropbox cleverhans
## Special (GPU TF)
conda create --name dnnsharpest_py36 python=3.6
conda install tensorflow-gpu joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 
### NOTE: cudatoolkit is better to override system CUDA. Just remove system CUDA from path and it will ignored
## Special (GPU dockingproject)
conda create --name $PNAME 
conda install -c mordred-descriptor mordred; 
conda install -c rdkit rdkit 
conda install tensorflow joblib tqdm scikit-learn h5py jupyter numpy matplotlib tqdm seaborn
conda install pytorch -c pytorch; pip install -U git+https://github.com/GRAAL-Research/pytoune.git
## Old machine tricks to install tensorflow-gpu
### - use python 3.6.8. Requires older libg
### - can install libgcc from conda
### - use conda install  cudatoolkit-dev=10.1 -c conda-forge
conda install -c https://public.dhe.ibm.com/ibmdl/export/pub/software/server/ibm-ai/conda tensorflow-gpu

## Pytorch project cuda 9
conda install pytorch==1.1.0 torchvision==0.3.0 cudatoolkit=9.0 -c pytorch
## Pytorch project 
# NOTE: tensorfow is for tensorboard
conda install tensorboard argh keras tensorflow  dropbox joblib tqdm scikit-learn h5py ipython jupyter numpy matplotlib tqdm seaborn pytorch pandas -c pytorch
pip install itermplot gin-config dropbox
## change env to reflect with PAH AND LD_LIBRARY_PATH cuda location

# Conda how to work with yml
conda env create --file $PNAME.yml
conda env export --no-builds > $PNAME.yml

# How to copy SSH key 
ssh-copy-id user@server

# Jupyter config
(dnnsharpest) [tomintoul]v1sjastr: cat ~/.jupyter/jupyter_notebook_config.py | grep burrito
c.NotebookApp.token = 'PASSWORD'
alias nb="jupyer notebook --no-browser --ip=127.0.0.1"
# Inline loop
for i in resnet scnn vgg11 ptb; do python experiments/noise_grid/plot.py $i;  done

# Default for conda

conda_path(){
	export PYTHONPATH=
	export PATH=$HOME/.conda/envs/$1/bin:$PATH
	export PYTHONNOUSERSITE=1
}

# Bash grep
grep -rnw '/path/to/somewhere/' -e 'pattern'

# File sizes + sort
du -hs * | sort -h

# String comaprison
if [ "$x" = "valid" ];

# File exists

if [ ! -f /tmp/foo.txt ]; then echo "File not found!"fi

# Kill all sshfs
pgrep -lf sshfs | cut -f 1 -d' ' | xargs kill -9
ps | grep python | cut -f 1 -d' ' | xargs kill -9
ps | grep python | cut -f 2 -d' ' | xargs kill -9

# How to tar
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file

# Loop

declare -a sch=(
    "[[80,0.0001],[120,0.00001],[160,0.000001]]"
    "[[80,0.001],[120,0.0001],[160,0.00001]]"
)
declare -a baselr=(
    "0.0001"
    "0.001"
)
for (( i=0; i<${#sch[@]}; i++ )); do

=${sch[$i]}

# More on arrays

datasets[${#datasets[*]}]="--dataset=09_2018_sabina_bestisomer --dataset.target=$protein --split=scaffold --split.test_split=$tsplit --split.valid_split=$vsplit --split.train_size=0.8 --split.valid_size=0.15"

# Release last commit
git remote add <INTERNAL>
git fetch remote/internal
git merge remote/internal
git reset $(git commit-tree HEAD^{tree} -m "A new start")

# Typical config
source ~/.bash_profile
PNAME=magic_sgd
export MPLBACKEND="module://itermplot"
export KERAS_BACKEND=tensorflow
export PYTHONNOUSERSITE=1
source activate ${PNAME}
export PATH=$SCRATCH/miniconda3/envs/$PNAME/bin:$PATH
export PYTHONPATH=$HOME/magic_sgd:$PYTHONPATH
export RESULTS_DIR=$SCRATCH/magic_sgd/results
export DATA_DIR=$SCRATCH/magic_sgd/data

# s.sh

if [ "$1" = "uj" ]; then
	WHERE=jastrzebski@truten.ii.uj.edu.pl:/home/jastrzebski/$PNAME
fi

if [ "$1" = "d1" ]; then
	WHERE=jastrs01@dlr1.nyumc.org:/gpfs/data/geraslab/jastrs01/code/$PNAME
fi

rsync -vrpa * --exclude-from=exclude.rsync $WHERE

# NYU specific
https://docs.google.com/document/d/1HvnpBvb1T1Sg6ECff8uE3usW7GB89KMiGWXiN_PswV8/edit

Note: very slow gpfs. Try to keep miniconda3 in $HOME, if possible. Import TF takes 13s!

## Bash content

umask 027
export PATH=/gpfs/data/geraslab/jastrs01/miniconda3/bin:$PATH
# source /gpfs/data/geraslab/anaconda3/etc/profile.d/conda.sh  # commented out by conda initialize



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/gpfs/data/geraslab/jastrs01/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/gpfs/data/geraslab/jastrs01/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/gpfs/data/geraslab/jastrs01/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/gpfs/data/geraslab/jastrs01/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export SCRATCH=/gpfs/data/geraslab

gpu () {
        export CUDA_VISIBLE_DEVICES=$1
}

## Train

python bin/utils/run.py shell-single experiments/06_2019_optimize_init/first_try/batch.sh

## bsub/skynet
bjobs -u all | cut -f4 -d' ' | sort | uniq -c
bjobs -u all | grep RUN | cut -f4 -d' ' | sort | uniq -c
bsub -R "hname!='skyupu01'" -Is -n 4 -gpu "num=1:mode=shared" bash
cd /home/jastrs01/magic_sgd
source /home/jastrs01/magic_sgd/e_skynet.sh
conda activate powerai1.6_env
bsub < script.sh
gpuuse
--
#!/bin/bash
#BSUB -gpu "num=1:mode=shared:j_exclusive=yes"
#BSUB -n 20
#BSUB -J bawudb
#BSUB -o /home/jastrs01/magic_sgd/mj.out
#BSUB -e /home/jastrs01/magic_sgd/mj.err
# To start firing:
cd /home/jastrs01/magic_sgd
source /home/jastrs01/magic_sgd/e_skynet.sh
conda activate powerai1.6_env # Conda activate inside a script doesnt update PATH cacuse it works within bash for this sh script? IDDK :D   
----
python bin/lottery_ticket_experiment.py experiments/08_19_early_LTH/12_08_earlyLTH_scnn_nobn/configs/1.json $RESULTS_DIR/magic_sgd/08_19_early_LTH/12_08_earlyLTH_scnn_nobn/1 -f=1 --retrain-evaluate=1 --retrain-evaluate-modif='--n_epochs=120' --prune-ratio=0.8 -n=15 --prune-strategy=magnitude
bjobs
bjobs -l 49683 # Whats happening with a job
bsub -Is -n 4 -q short -gpu "num=1:mode=shared:j_exclusive=yes" bash
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-ppc64le.sh
bash Anaconda3-2019.03-Linux-ppc64le.sh
/gpfs/data/geraslab/jastrs01/anaconda3_power
.  /gpfs/share/skynet/apps/anaconda3/etc/profile.d/conda.sh
which conda
conda activate powerai1.6_env
pip install keras==2.2.4 --user






## Typical e.sh

source ~/.bashrc
PNAME=cooperative_optimization
KERAS_BACKEND=tensorflow

gpu

source activate ${PNAME}

export MPLBACKEND="module://itermplot"

export PYTHONPATH=/gpfs/data/geraslab/code/$PNAME:$PYTHONPATH
export RESULTS_DIR=$SCRATCH/results/$PNAME
export DATA_DIR=$SCRATCH/data/$PNAME
export DROPBOXTOKEN=cbIEY7UJ3K4AAAAAAACtHWCaQb31VGUGCH3xOIZERlVm7OAHRE0erRhwtIFMFxmJ

mkdir -p $RESULTS_DIR
mkdir -p $DATA_DIR

alias tb="tensorboard --logdir=$RESULTS_DIR --port=9999"
alias nb="ipython notebook --no-browser --port=9998 --NotebookApp.token='' --NotebookApp.password=''"
