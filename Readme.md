# Debian Packaging for pyCA

## Build the package

To build this package you will need a machine (a Docker container should also be sufficient) with [Debian Buster](https://www.debian.org/) with `build-essential` and `devscripts` installed.

To create the package run the `build.sh` from within this directory.
If you also want to install the build dependencies, you can run `INSTALL_DEPENDENCIES=y ./build.sh`, but you then need root privileges.

If you would like to look in the process in more details, take a look into the script or visit the [Debian New Maintainers' Guide](https://www.debian.org/doc/manuals/maint-guide/) as a complete source about packaging for Debian.

## Create a repository

There is also a small script in this repository to create a Debian Repository using [aptly](https://www.aptly.info/).
It is mostly intented to be used with the CI, but if you want to use it manually, you will need to habe a GPG key to sign the repository with.
