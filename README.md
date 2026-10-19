# Debian Packaging for pyCA

[![CircleCI](https://img.shields.io/circleci/build/gh/elan-ev/pyca-debian)
](https://app.circleci.com/pipelines/github/elan-ev/pyca-debian)

## Using the Repository

You can install pyCA from the APT repository by executing the following steps:

```bash
# Install prerequisites
apt-get install apt-transport-https wget

# Include pyCA's Signing Key
wget -O /etc/apt/trusted.gpg.d/opencast-pyca.pgp https://pyca.deb.opencast.org/gpg.key

# Add the Repository
cat >/etc/apt/sources.list.d/opencast-pyca.sources <<EOF
Types: deb
URIs: https://pyca.deb.opencast.org/opencast-pyca
Suites: trixie
Components: main
Signed-By: /etc/apt/trusted.gpg.d/opencast-pyca.pgp
EOF

# Update your cache and install pyCA
apt-get update
apt-get install opencast-pyca
```

## Build the package

To build this package you will need a machine (a Docker container should also be sufficient) with [Debian Trixie](https://www.debian.org/) with `build-essential` and `devscripts` installed.

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
