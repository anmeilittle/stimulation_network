#!/usr/bin/env bash
# Run ft_load

#SBATCH --output=ft_load-%j.out
#SBATCH -p long
#SBATCH -t 1-23:00:00
#SBATCH -c 8
#SBATCH --mem-per-cpu 25000

# Load modules
module load MATLAB/2018b

# Go to directory
cd /gpfs/milgram/project/turk-browne/projects/stimulation_behavior/stimulation_network/analysis_scripts

# Run script
matlab -nodesktop -nojvm -r "addpath(pwd); addpath('../../intermediate_data'); EEG_data; coherence; exit"
