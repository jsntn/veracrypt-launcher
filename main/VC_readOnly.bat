@echo off
mode con: cols=100 lines=20

FOR %%A IN ("%~dp0.") DO SET parentDir=%%~dpA

"%parentDir%software\VeraCrypt.exe" /l %driveLetter% /m ro /v %1 /a /p test

:no
PING 127.0.0.1 -n 2 || PING ::1 -n 2

IF EXIST %driveLetter%:\ (GOTO yes) ELSE (GOTO no)
:yes
start "" /B /WAIT "%driveLetter%:\procexp64.exe"
"%parentDir%software\VeraCrypt.exe" /d %driveLetter% /q
