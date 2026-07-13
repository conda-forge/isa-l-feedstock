set -ex
unset AS  # Let script determine assembler itself
# Build script need to be regenerated for cross compilation support
./autogen.sh
./configure --prefix=${PREFIX} --enable-programs
make -j${CPU_COUNT}
make -j${CPU_COUNT} install

rm -rf ${PREFIX}/share
rm ${PREFIX}/lib/libisal.a
