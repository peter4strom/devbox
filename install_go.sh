#!/bin/bash
set -e

version=1.5.1
dstdir=/opt/go-$version

mkdir -p $dstdir
curl -L "https://storage.googleapis.com/golang/go${version}.linux-amd64.tar.gz" \
	| tar xzC $dstdir --strip-components=1


cat <<- EOFX
	cat << EOF >> ~/.bash_profile
	export GOROOT=$dstdir
	export PATH=\$PATH:\$GOROOT/bin
	export GOPATH=\$HOME/projects/go
	EOF
EOFX
