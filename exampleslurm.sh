#!/bin/bash
#
#SBATCH --job-name=GIT_DIST_TF # Job name
#SBATCH --array=1
#SBATCH --nodes=1 min max
#SBATCH --ntasks=1 # Number of cores
#SBATCH --output=trainer.out #File to which STDOUT will be written
#SBATCH --error=trainer.err # File to which STDERR will be written
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=erqueen@ucdavis.edu # Email to which notification will be sent 
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=10000


srun script.sh



put in .sh file:
MASKRCNN_PYTHONPATH=/share/foxlab-backedup/monkeyface/anaconda3/bin/
export PATH=${MASKRCNN_PYTHONPATH}:$PATH


source activate tensorflow
conda activate tensorflow

python job.py
