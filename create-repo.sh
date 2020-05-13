#!/bin/bash

set -e
set -u

REPO_NAME=pyca

TMP=$(mktemp -d aptly-XXXXX)
function finish {
  rm -rf "$TMP"
}
trap finish EXIT

echo "{\"rootDir\": \"$TMP/.aptly\"}" > "$TMP/.aptly.conf"
aptly "-config=$TMP/.aptly.conf" repo create "$REPO_NAME"
aptly "-config=$TMP/.aptly.conf" repo add "$REPO_NAME" build/*{.deb,dsc}
aptly "-config=$TMP/.aptly.conf" publish repo -distribution=Debian "$REPO_NAME" "$REPO_NAME"
cp -r "$TMP/.aptly/public/$REPO_NAME" .
