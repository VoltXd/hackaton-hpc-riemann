#!/bin/bash
#SBATCH --output=/home/etud6-2/Rieman/result.txt
#SBATCH --time=2:0
#SBATCH --cpus-per-task=4


./RiemannSiegel_opti 10 10000 100