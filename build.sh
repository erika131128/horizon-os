#!/bin/bash
# Gera a ISO do Horizon OS. Rode em Debian 12/13 com: sudo ./build.sh
# Em outros sistemas, use ./docker-build.sh
set -euo pipefail
cd "$(dirname "$0")"
[ "$(id -u)" -eq 0 ] || { echo "Execute com sudo: sudo ./build.sh"; exit 1; }
if ! command -v lb >/dev/null; then
  apt-get update
  apt-get install -y live-build debootstrap debian-archive-keyring squashfs-tools xorriso
fi
lb clean || true
lb config
lb build
ls -lh ./*.iso
