#!/usr/bin/env bash

set -e

module load mpt
module load gcc

module list

export prefix=$(pwd)/install

# Derived datatype creation fails at MPI_TYPE_DEPTH 15 in tests; so 
export MPI_TYPE_DEPTH=31
export MPI_CUSTOM_FORTRAN_MODULES_PATH=${prefix}/mpt-mod

wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.21/src/hdf5-1.8.21.tar.gz
tar xf hdf5-1.8.21.tar.gz
cd hdf5-1.8.21

./configure CC=mpicc CXX=mpicxx FC="mpif90 -f90=gfortran" \
	    --prefix=${prefix}/hdf5-gnu \
  --enable-shared --enable-hl --enable-fortran --enable-parallel

make -j 8
make check
make install

printf "Modules were:\n"
module list
