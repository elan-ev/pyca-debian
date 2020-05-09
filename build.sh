#!/bin/sh

set -e
set -u

# Install the dependencies
mk-build-deps
dpkg -i pyca-build-deps_*.deb || apt-get install -y -f

# Download source
uscan --download-current

# Extract upstream sources
(
    cd ..
    mkdir -p pyca
    tar xf pyca_*.orig.tar.gz --strip-components 1 -C pyca
)

# Copy debian directory
cp -r debian ../pyca/

# Build
(
    cd ../pyca
    debuild -tc -us -uc
)

printf "\nSuccess. You find your brand new packages under '..'\n"
