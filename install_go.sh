#!/bin/bash
set -e

version=1.5.1
dstdir=/opt/go-$version

mkdir -p $dstdir
curl -sSL "https://storage.googleapis.com/golang/go${version}.linux-amd64.tar.gz" \
	| tar xzC $dstdir --strip-components=1

echo 'export GOROOT=$dstdir' >> ~/.bash_profile
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bash_profile
echo 'export GOPATH=$HOME/projects/go' >> ~/.bash_profile
