set LIB=%LIBRARY_LIB%;%LIB%
set LIBPATH=%LIBRARY_LIB%;%LIBPATH%
set INCLUDE=%LIBRARY_INC%;%INCLUDE%;%RECIPE_DIR%

:: Build.
nmake \f %SRC_DIR%\Makefile.nmake
if errorlevel 1 exit 1

:: Test.
::ctest
::if errorlevel 1 exit 1

:: Some OSS libraries are happier if z.lib exists, even though it's not typical on Windows.
::copy %LIBRARY_LIB%\zlib.lib %LIBRARY_LIB%\z.lib || exit 1

:: Qt in particular goes looking for this one (as of 4.8.7).
::copy %LIBRARY_LIB%\zlib.lib %LIBRARY_LIB%\zdll.lib || exit 1

:: Copy license file to the source directory so conda-build can find it.
::copy %RECIPE_DIR%\license.txt %SRC_DIR%\license.txt || exit 1
