#!/usr/bin/env bash

set -e

# One needs to obtain the tar bundle from ...
# https://berkeleygw.org/download/


# MPT MPI and gcc. Use MKL for FFTW/Scalapack etc.
#
# We are expecting
#   ${prefix}/mpt-mod    MPT f90 modules
#   ${prefix}/hdf5-gnu   accompanying hdf5 (specified in arch.mk)

export prefix=$(pwd)/install
export MPI_CUSTOM_FORTRAN_MODULES_PATH=${prefix}/mpt-mod

module load intel-20.4/cmkl
module load mpt
module load gcc

tar xf BerkeleyGW-3.0.1.tar.gz

cd BerkeleyGW-3.0.1

cp ../gnu-flavour.mk arch.mk

make -j 16 all-flavors


# This is the name of the temporary directory ...
export MPIEXEC=$(which srun)
export TEMPDIRPATH=${prefix}/tmp
export OMP_NUM_THREADS=1
export OMP_STACKSIZE="100M"


cd testsuite

# Need to submit a job...
# make check-save

printf "Modules were:\n"
module list
