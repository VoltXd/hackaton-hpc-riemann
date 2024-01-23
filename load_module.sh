
#!/bin/bash
module purge 

module use /tools/Libs/modulefiles
module use /tools/acfl/modulefiles

module load acfl
module load forge

module list
