COMPFLAG  = -DGNU
PARAFLAG = -DMPI -DOMP
MATHFLAG  = -DUSESCALAPACK -DHDF5 -DUSEFFTW3

# Only uncomment DEBUGFLAG if you need to develop/debug BerkeleyGW.
# The output will be much more verbose, and the code will slow down by ~20%.
#DEBUGFLAG = -DDEBUG

FCPP    = /usr/bin/cpp -C -nostdinc
F90free = mpif90 -f90=gfortran -fPIC -fopenmp -ffree-form -ffree-line-length-none -fbounds-check
LINK    = mpif90 -f90=gfortran -fPIC -fopenmp
FOPTS   = -g -O2
FNOOPTS = $(FOPTS)
MOD_OPT = -J
INCFLAG = -I

C_PARAFLAG  = -DPARA
CC_COMP = mpicxx -fopenmp -fPIC
C_COMP  = mpicc -fopenmp  -fPIC
C_LINK  = mpicxx -fopenmp  -fPIC
C_OPTS  = -g -O2
C_DEBUGFLAG =

REMOVE  = /bin/rm -f

# Math Libraries
#
FFTWPATH     =
FFTWLIB      = -L$(MKLROOT)/lib/intel64 -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_gnu_thread -lmkl_core -lmkl_blacs_sgimpt_lp64 -lpthread -lm -ldl
FFTWINCLUDE  = $(MKLROOT)/include/fftw

HDF5_HOME    = /work/z04/z04/kevin/queries/berkeleyGW/install/hdf5-gnu
HDF5_LDIR    = $(HDF5_HOME)/lib
HDF5LIB      = -L$(HDF5_HOME)/lib -lhdf5hl_fortran -lhdf5_hl -lhdf5_fortran -lhdf5
HDF5INCLUDE  = $(HDF5_HOME)/include

LAPACKLIB    = $(FFTWLIB)
