#!/bin/bash
set -e

version=5.1.0
dstdir=/opt/nodejs-$version

mkdir -p $dstdir
curl -sSL "https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.gz" \
	| tar xzC $dstdir --strip-components=1

ln -sf $dstdir/bin/node /usr/local/bin/node
ln -sf $dstdir/bin/npm /usr/local/bin/npm
