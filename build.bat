:: Windows Build for Heclib/DSS and javaHeclib
::
call vs_env.bat
echo on

dotnet restore dss.sln
dotnet restore dotnet\Hec.Dss\Hec.Dss.csproj
dotnet restore dotnet\DotNetTests\DotNetTests.csproj

:: set version and build_number for javaheclib.dll
set build_number=9999
if not "%1" == "" (set build_number=%1)
echo %build_number%

dssVersion.exe heclib\heclib_c\src\headers\hecdssInternal.h %build_number% > heclib\javaheclib\version_build.h

cd heclib\heclib_f
nmake -f Makefile.win  DEBUG=1 clean all
nmake -f Makefile.win  clean all

cd %~dp0\nws_shef

nmake -f Makefile.win  DEBUG=1 clean all
nmake -f Makefile.win  clean all

cd %~dp0
msbuild dss.sln /p:Configuration=Release /p:Platform=x64

::cd test\Fortran
::nmake -f Makefile.win  DEBUG=1 clean all
::nmake -f Makefile.win  clean all


msbuild dss.sln /p:Configuration=Debug /p:Platform=x64
::devenv dss.sln  /ReBuild  "Debug|x64"
::exit
::devenv dss.sln  /ReBuild  "Release|x64"

::call vs_env32.bat
::devenv dss.sln  /ReBuild "Release|Win32"
::devenv dss.sln  /ReBuild  "Debug|Win32"
  

