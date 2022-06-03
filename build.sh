#!/bin/bash -e

docker run --rm \
  -e NAME="waggle-firewall" \
  -e DESCRIPTION="Waggle Network Firewall Service" \
  -v "$PWD:/repo" \
  waggle/waggle-deb-builder:latest