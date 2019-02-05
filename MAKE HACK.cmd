cd %~dp0

copy FE8_clean.gba FE8SR.gba

make events -j

cd "%~dp0Tables"

echo: | (c2ea "%~dp0FE8_clean.gba")

cd "%~dp0Text"

echo: | (textprocess_v2 text_buildfile.txt)

cd "%~dp0EventAssembler"

Core A FE8 "-output:%~dp0FE8SR.gba" "-input:%~dp0Rom Buildfile.event"  "-symOutput:%~dp0symbols.txt"

cd "%~dp0devkitARM\bin"

rem gbafix "%~dp0FE8SR.gba" -tCIRCLEEMBLEM -cSR.8 -mCE -r12

cd "%~dp0ups"

ups diff -b "%~dp0FE8_clean.gba" -m "%~dp0FE8SR.gba" -o "%~dp0FE8SR.ups"

pause