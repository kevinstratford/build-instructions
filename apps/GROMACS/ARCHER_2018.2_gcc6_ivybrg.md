Instructions for compiling GROMACS 2018.2 for ARCHER using GCC 6 compilers
==========================================================================

These instructions are for compiling GROMACS 2018.2 on ARCHER (Intel Ivy Bridge processors)
using the GCC 6.x compilers.


Download and Unpack the GROMACS source code
-------------------------------------------

Download and unpack the source

```bash
wget http://ftp.gromacs.org/pub/gromacs/gromacs-2018.2.tar.gz
tar -xvf gromacs-2018.2.tar.gz
```

Setup correct modules
---------------------

Switch to the GNU programming environment:

```bash
module swap PrgEnv-cray PrgEnv-gnu
```

and load the CMake module:

```bash
module load cmake/3.5.2
```
Please note that the FFTW library will be built in the GROMACS compilation step.

Configure and build the parallel, single-precision build
--------------------------------------------------------

Create a build directory in the source tree

```bash
cd gromacs-2018.2
mkdir build_mpi
cd build_mpi
```

Set the environment variables for the CMake build. (Note, for at least
4.6.3 and 4.6.5, FLAGS=-ffast-math results in errors and test failures.)

```bash
export CXX=CC
export CC=cc
export FLAGS="-dynamic -O3 -ftree-vectorize -funroll-loops"
```

Use CMake to configure the build and then build and install. Remember to set the install 
prefix to somewhere you have permission to write to.

```bash
cmake ../ -DGMX_MPI=ON -DGMX_OPENMP=ON -DGMX_GPU=OFF -DGMX_X11=OFF -DGMX_DOUBLE=OFF \
          -DCMAKE_C_FLAGS="$FLAGS" -DCMAKE_CXX_FLAGS="$FLAGS" -DGMX_BUILD_MDRUN_ONLY=ON  \
          -DGMX_BUILD_OWN_FFTW=ON \
          -DCMAKE_INSTALL_PREFIX=/work/y07/y07/gmx/2018.2-gcc6
make -j 8 install
```

Configure and build the parallel, double-precision build
--------------------------------------------------------

Create a build directory in the source tree

```bash
cd gromacs-2018.2
mkdir build_mpi_d
cd build_mpi_d
```

Set the environment variables for the CMake build. (Note, for at least 4.6.3 and 4.6.5,
FLAGS=-ffast-math results in errors and test failures.)

```bash
export CXX=CC
export CC=cc
export FLAGS="-dynamic -O3 -ftree-vectorize -funroll-loops"
```

Use CMake to configure the build and then build and install. Remember to set the install 
prefix to somewhere you have permission to write to.

```bash
cmake ../ -DGMX_MPI=ON -DGMX_OPENMP=ON -DGMX_GPU=OFF -DGMX_X11=OFF -DGMX_DOUBLE=ON \
          -DCMAKE_C_FLAGS="$FLAGS" -DCMAKE_CXX_FLAGS="$FLAGS" -DGMX_BUILD_MDRUN_ONLY=ON  \
          -DGMX_BUILD_OWN_FFTW=ON \
          -DCMAKE_INSTALL_PREFIX=/work/y07/y07/gmx/2018.2-gcc6
make -j 8 install
```

