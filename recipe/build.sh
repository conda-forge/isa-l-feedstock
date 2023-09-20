#!/bin/bash

# By patching nasm-filter.sh to include the absolute path to $BUILD_PREFIX/bin/nasm
# we have guaranteed that the correct nasm is used.

# Mac OS assumes glibtool, even though conda environment has libtool.
ln -s ${BUILD_PREFIX}/bin/libtool ${BUILD_PREFIX}/bin/glibtool

make -d -j${CPU_COUNT} -f Makefile.unx CC=${CC} ${VERBOSE_AT}
make -d -j${CPU_COUNT} -f Makefile.unx CC=${CC} prefix=${PREFIX} install

# Remove man pages
rm -rf ${PREFIX}/share
# Remove static library
rm ${PREFIX}/lib/libisal.a
