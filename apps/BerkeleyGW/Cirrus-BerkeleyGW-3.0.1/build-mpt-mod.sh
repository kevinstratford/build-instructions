#!/usr/bin/env bash

set -e

export prefix=$(pwd)/install

module load mpt
module load gcc/10.2.0

cp -r ${MPI_ROOT}/fortran_module_generator gnu-fortran

cd gnu-fortran

# See the README herein
CC=gcc FC=gfortran FCFLAGS="-DUSE_GCC_FORTRAN" DISABLE_F08=1 make
DESTDIR="${prefix}/mpt-mod" DISABLE_F08=1 make install

# This requires we now

export MPI_CUSTOM_FORTRAN_MODULES_PATH=${prefix}/mpt-mod

# in relevant dependencies

printf "Please set MPI_CUSTOM_FORTRAN_MODULES_PATH to %s\n" "${prefix}/mpt-mod"
printf "Also remember to use \"mpif90 -f90=gfortran\"\n"
