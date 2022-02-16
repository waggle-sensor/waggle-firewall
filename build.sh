#!/bin/bash -e

docker run --rm \
  -e NAME="waggle-firewall" \
  -e DESCRIPTION="Waggle Network Firewall Service" \
  -e "MAINTAINER=sagecontinuum.org" \
  -v "$PWD:/repo" \
  waggle/waggle-deb-builder:0.2.0