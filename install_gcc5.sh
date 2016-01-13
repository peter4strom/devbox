#!/bin/bash
set -e 

version=5.3.0
url="ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-${version}/gcc-${version}.tar.bz2"

apt-get install libmpfr-dev libmpc-dev

wget -N $url
tar xjf "gcc-${version}.tar.bz2"
srcdir=$(pwd)/gcc-${version}
dstdir=/opt/gcc-$version

rm -Rf objdir
mkdir objdir
cd objdir

$srcdir/configure \
	--prefix=$dstdir \
	--disable-multilib \
	--enable-threads=posix \
	--enable-tls \
	--disable-bootstrap \
	--enable-languages=c++ \
	--with-gnu-as \
	--with-gnu-ld \
	--disable-nls

make
make -k check-c++
make install
