# BerkeleyGW

One must obtain the tar bundle for the code from the BerkeleyGW
web site, e.g., https://berkeleygw.org/download/

We assume the tar bundle `BerkeleyGW-3.0.1.tar.gz` is present in the
current working directory along with the scripts available with this
`README.md`. These should be placed in the `/work` filesystem.

## Build mpt Fortran modules

As the current build uses MPT MPI, the Fortran module wrappers must
be available.

```
$ bash ./build-mpt-mod.sh
```

## Build HDF5

Use
```
$ bash ./build-hdf5-mpt.sh
```
This will take 10-20 minutes.

## Buils and test BerkeleyGW

Run
```
$ bash ./build-bgw-mpt.sh
```

### Test

Submit the batch script
```
$ sbatch qscript
```

The tests currently report
```

    Passed:  22 / 27
    Skipped: 0 / 27
    Failed:  5 / 27

    testfile                                          # failed testcases
    --------------------------------------------------------------------
    GaAs-EPM/GaAs_spinor_hdf5.test                    1
    GaAs-EPM/GaAs_spinor.test                         1
    GaAs-EPM/GaAs.test                                1
    Si-EPM/Si_cplx_spin.test                          1
    Si-EPM/Si_cplx.test                               1
```

The failures involve SEGV from a number of the executables `wfnmix_spinor.x`,
`absorption.cplx.x` and `wfn_dotproduct.x`. This is under investigation.