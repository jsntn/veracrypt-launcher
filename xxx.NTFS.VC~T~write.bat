@echo off
mode con: cols=100 lines=20

set batName=%~n0
set fileName=%batName:~0,-8%
set driveLetter=%batName:~-7,-6%

echo %fileName%

call "%~dp0main\VC_write.bat" "%~dp0FILES\%fileName%"
