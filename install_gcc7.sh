#!/bin/bash
set -e

snapshot_date=20160515
version=7
stem=gcc-${version}-${snapshot_date}
tarball=${stem}.tar.bz2
url="ftp://ftp.gwdg.de/pub/misc/gcc/snapshots/LATEST-${version}/$tarball"
apt-get install libmpfr-dev libmpc-dev flex

downloaddir=$(xdg-user-dir DOWNLOAD)
downloadfile=$downloaddir/$tarball
srcdir=/tmp/$stem
dstdir=/opt/gcc-$version
objdir=/tmp/objdir

if [ ! -f "$downloadfile" ]; then
	wget -N -O $downloadfile $url
fi

rm -Rf $srcdir
mkdir -p $srcdir
tar xjf $downloadfile -C $srcdir --strip-component=1

rm -Rf $objdir
mkdir $objdir
cd $objdir

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

cd -
rm -Rf $objdir
rm -Rf $srcdir
