#!/bin/bash
# Constrói a ISO dentro de um contêiner Debian (Linux, macOS ou Windows com Docker).
set -euo pipefail
cd "$(dirname "$0")"
docker run --rm --privileged -v "$PWD":/work -w /work debian:trixie \
  bash -c "apt-get update && apt-get install -y live-build && ./build.sh"
