#!/bin/bash

# By patching nasm-filter.sh to include the absolute path to $BUILD_PREFIX/bin/nasm
# we have guaranteed that the correct nasm is used.

make -j${CPU_COUNT} -f Makefile.unx ${VERBOSE_AT}
make -j${CPU_COUNT} -f Makefile.unx prefix=${PREFIX} install

# Remove man pages
rm -rf ${PREFIX}/share
# Remove static library
rm ${PREFIX}/lib/libisal.a
