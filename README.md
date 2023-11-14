# workstation-tests

In this repo there is a directory containing the needed files to 
run tests of common scientific software used in the UR computational
labs. The contents of each directory will vary, but each directory will
have at least these two files.

`README.md` -- Explains any preliminary steps that must be executed
prior to attempting the test.

`setup.sh` -- A shell file that will run the default test. `setup.sh`
contains a bash function with the same name as the test to be run. 
For example, the `setup.sh` in the `g16test` directory provides
a function named `g16test`.

The test will do at least the following housekeeping tasks:

1. `cd` to the directory where the test will be executed.
1. Load module files; set `$PATH`; create any other files that may be 
    required. 
1. Create a timestamped output file that shows the location of the
    executable being run. This file will be named `g16test.out` in the
    case of the `g16test`.

