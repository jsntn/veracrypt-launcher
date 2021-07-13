@echo off
mode con: cols=100 lines=20

set batName=%~n0
set fileName=%batName:~0,-11%
set driveLetter=%batName:~-10,-9%

echo %fileName%

call "%~dp0main\VC_readOnly.bat" "%~dp0FILES\%fileName%"
