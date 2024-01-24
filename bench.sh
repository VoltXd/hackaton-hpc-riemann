#!/bin/bash
#SBATCH --output=result.txt
#SBATCH --time=2:0
#SBATCH --cpus-per-task=64


./RiemannSiegel_opti 10 10000 100