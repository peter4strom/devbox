#!/bin/bash
set -e

version=3.8.0

wget -N "http://llvm.org/releases/${version}/llvm-${version}.src.tar.xz"
wget -N "http://llvm.org/releases/${version}/cfe-${version}.src.tar.xz"
wget -N "http://llvm.org/releases/${version}/compiler-rt-${version}.src.tar.xz"

apt-get install libxml2-dev

srcdir=$(pwd)/llvm-${version}.src
dstdir=/opt/llvm-$version
mkdir -p $srcdir/tools/clang $srcdir/projects/compiler-rt $srcdir/build

tar xJf llvm-${version}.src.tar.xz -C $srcdir --strip-components=1
tar xJf cfe-${version}.src.tar.xz -C $srcdir/tools/clang --strip-components=1
tar xJf compiler-rt-${version}.src.tar.xz -C $srcdir/projects/compiler-rt --strip-components=1

rm -Rf objdir
mkdir -p objdir/build
cd objdir/build

cmake \
	-G "Unix Makefiles" \
	-DCMAKE_INSTALL_PREFIX=$dstdir \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_TARGETS_TO_BUILD="X86" \
	-DLLVM_ENABLE_CXX1Y=ON \
	$srcdir

make
make install
