# New tmux session

tmux new -s isotropy

# Merge pdfs
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combine.pdf -dBATCH 1.pdf 2.pdf

# Delete large h5 fiels

find /data/milatmp1/jastrzes/isotropy/results/wojtek  -name '*h5' | xargs rm

# New repo
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda create --name $PNAME # ideal
conda create --name $PNAME python=3.6 # py3.6 for tensorflow
conda create --name $PNAME python=2.7 # py2.7 for pytorch
conda install joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn # PyTorch package

#
## Special (TF-gpu zadlo cuda9), make sure libraries are correctly linked
conda install keras tensorflow-gpu==1.8.0 joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 

## Special (TF-gpu zadlo, CUDA 10. Note - it installs cudnn and cuda automagically)
conda install tensorflow-gpu==1.13.1 

## Special (TF-gpu antman), make sure libraries are correctly linked
conda install keras tensorflow-gpu==1.10.0 joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 

## Special (GPU TF)
conda create --name dnnsharpest_py36 python=3.6
conda install keras tensorflow-gpu joblib tqdm scikit-learn h5py jupyter numpy pandas matplotlib tqdm seaborn 

## Special (GPU dockingproject)
conda create --name $PNAME 
conda install -c mordred-descriptor mordred; 
conda install -c rdkit rdkit 
conda install tensorflow joblib tqdm scikit-learn h5py jupyter numpy matplotlib tqdm seaborn
conda install pytorch -c pytorch; pip install -U git+https://github.com/GRAAL-Research/pytoune.git

## Always
pip install itermplot dropbox

# Conda how to dump
conda env export > $PNAME.yml

# SSH key copy
ssh-copy-id user@server

# Jupyter config
(dnnsharpest) [tomintoul]v1sjastr: cat ~/.jupyter/jupyter_notebook_config.py | grep burrito
c.NotebookApp.token = 'PASSWORD'
alias nb="jupyer notebook --no-browser --ip=0.0.0.0"
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

# File exists

if [ ! -f /tmp/foo.txt ]; then echo "File not found!"fi

# Kill all sshfs
pgrep -lf sshfs | cut -f 1 -d' ' | xargs kill -9

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
export DROPBOXTOKEN=cbIEY7UJ3K4AAAAAAACtHWCaQb31VGUGCH3xOIZERlVm7OAHRE0erRhwtIFMFxmJ
export MPLBACKEND="module://itermplot"
export KERAS_BACKEND=tensorflow
export PYTHONNOUSERSITE=1
source activate ${PNAME}
export PATH=$SCRATCH/miniconda3/envs/$PNAME/bin:$PATH
export PYTHONPATH=$HOME/magic_sgd:$PYTHONPATH
export RESULTS_DIR=$SCRATCH/magic_sgd/results
export DATA_DIR=$SCRATCH/magic_sgd/data
