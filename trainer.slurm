#!/bin/bash
#
#SBATCH --job-name=DIST_TF # Job name
#SBATCH --array=1
#SBATCH --nodes=1
#SBATCH --ntasks=1 # Number of cores
#SBATCH --output=trainer.out #File to which STDOUT will be written
#SBATCH --error=trainer.err # File to which STDERR will be written
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=erqueen@ucdavis.edu # Email to which notification will be sent 
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=10000

MASKRCNN_PYTHONPATH=/share/foxlab-backedup/monkeyface/anaconda3/bin/
export PATH=${MASKRCNN_PYTHONPATH}:$PATH


source activate MaskRCNN
conda activate MaskRCNN

cd /share/foxlab-backedup/monkeyface/

printenv

python trainer.py \
     --ps_hosts=ps0.example.com:2222,ps1.example.com:2222 \
     --worker_hosts=worker0.example.com:2222,worker1.example.com:2222 \
     --job_name=ps --task_index=0
