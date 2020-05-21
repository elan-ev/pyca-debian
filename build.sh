#!/bin/sh

set -e
set -u

# Install the dependencies
if [ "${INSTALL_DEPENDENCIES:-n}" = y ]
then
    mk-build-deps
    dpkg -i opencast-pyca-build-deps_*.deb || apt-get install -y -f
fi

# Download source
uscan --download-current

# Extract upstream sources
(
    cd ..
    mkdir -p opencast-pyca
    tar xf opencast-pyca_*.orig.tar.gz --strip-components 1 -C opencast-pyca
)

# Copy debian directory
cp -r debian ../opencast-pyca/

# Build
(
    cd ../opencast-pyca
    debuild -tc -us -uc
)

mkdir -p build
cp ../*.deb ../*.buildinfo ../*.changes ../*.debian.tar.xz ../*.dsc ../*.orig.tar.gz build

printf "\nSuccess. You find your brand new packages under 'build'\n"
