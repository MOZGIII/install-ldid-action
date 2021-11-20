#!/bin/bash
set -euo pipefail

REPO="${REPO:?}"
TAG="${TAG:?}"

DIR="$(mktemp -dt install-ldid.XXX)"
trap 'rm -rf "${DIR:?}"' EXIT

OS_NAME="$(uname -s)"
ARCH_NAME="$(uname -m)"

case "$OS_NAME" in
"Darwin")
  OS_NAME="macos"
  ;;
"Linux")
  OS_NAME="linux"
  ;;
esac

FNAME="ldid_${OS_NAME}_${ARCH_NAME}"

curl -sSL \
  -o "$DIR/$FNAME" \
  "https://github.com/${REPO}/releases/download/${TAG}/${FNAME}"
chmod +x "$DIR/$FNAME"
cp "$DIR/$FNAME" /usr/local/bin/ldid
