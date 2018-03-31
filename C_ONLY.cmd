cd %~dp0

make events -j

cd "%~dp0EventAssembler"

Core A FE8 "-output:%~dp0FE8SR.gba" "-input:%~dp0Rom Buildfile_COnly.event"

pause