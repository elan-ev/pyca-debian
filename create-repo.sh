#!/bin/bash

set -e
set -u

REPO_NAME=opencast-pyca

TMP=$(mktemp -d /tmp/aptly-XXXXX)
function finish {
  rm -rf "$TMP"
}
trap finish EXIT

echo "{\"rootDir\": \"$TMP/.aptly\",\"architectures\": [\"all\", \"source\"]}" > "$TMP/.aptly.conf"
aptly "-config=$TMP/.aptly.conf" repo create "$REPO_NAME"
aptly "-config=$TMP/.aptly.conf" repo add "$REPO_NAME" build/*{.deb,dsc}
aptly "-config=$TMP/.aptly.conf" publish repo -distribution=buster "$REPO_NAME" "$REPO_NAME"
cp -r "$TMP/.aptly/public/$REPO_NAME" .
