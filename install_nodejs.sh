#!/bin/bash
set -e

version=6.1.0
dstdir=/opt/nodejs-$version

mkdir -p $dstdir
curl -L "https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.gz" \
	| tar xzC $dstdir --strip-components=1

ln -sf $dstdir/bin/node /usr/local/bin/node
ln -sf $dstdir/bin/npm /usr/local/bin/npm

curl -L https://npmjs.org/install.sh | sh
