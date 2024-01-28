#!/bin/bash
#SBATCH --output=result.txt
#SBATCH --time=2:0
#SBATCH --cpus-per-task=64


./RiemannSiegel_para 10 100000 100
