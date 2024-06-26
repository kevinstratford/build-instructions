#!/bin/bash --login

#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH --account=z04

#SBATCH --partition=standard
#SBATCH --qos=standard

printf "Start: %s\n" "`date`"

source ./site/version.sh

# Replaces, e.g.,
# module load openfoam/v10.0

source ./site/modules.sh

export FOAM_INSTALL_PATH=$(pwd)/OpenFOAM-${version_major}

# Run test

source ${FOAM_INSTALL_PATH}/etc/bashrc

source ./site/test.sh

printf "Finish: %s\n" "`date`"
