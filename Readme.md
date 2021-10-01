# Debian Packaging for PyCA

[![CircleCI](https://img.shields.io/circleci/build/gh/elan-ev/pyca-debian)
](https://app.circleci.com/pipelines/github/elan-ev/pyca-debian)

## Using the Repository

You can install PyCA from the APT repository by executing the following steps:

```bash
# Install prerequisites
apt-get install apt-transport-https

# Include PyCA's Signing Key
apt-key adv --fetch https://pyca.deb.opencast.org/gpg.key

# Add the Repository
echo "deb [arch=all] https://pyca.deb.opencast.org/opencast-pyca buster main" > /etc/apt/sources.list.d/opencast-pyca.list

# Update your cache and install PyCA
apt-get update
apt-get install opencast-pyca
```

## Build the package

To build this package you will need a machine (a Docker container should also be sufficient) with [Debian Buster](https://www.debian.org/) with `build-essential` and `devscripts` installed.

To create the package run the `build.sh` from within this directory.
If you also want to install the build dependencies, you can run `INSTALL_DEPENDENCIES=y ./build.sh`, but you then need root privileges.

If you would like to look in the process in more details, take a look into the script or visit the [Debian New Maintainers' Guide](https://www.debian.org/doc/manuals/maint-guide/) as a complete source about packaging for Debian.

## Create a repository

There is also a small script in this repository to create a Debian Repository using [aptly](https://www.aptly.info/).
It is mostly indented to be used with the CI, but if you want to use it manually, you will need to have a [GPG](https://gnupg.org/) to sign the repository with.

## Bump Version

```sh
DEBFULLNAME="Jane Doe" DEBEMAIL="jdoe@example.com" dch -v 3.2-1 -D unstable "New upstream Release"
```
