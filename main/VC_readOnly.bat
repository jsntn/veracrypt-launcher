@echo off
mode con: cols=100 lines=20

FOR %%A IN ("%~dp0.") DO SET parentDir=%%~dpA

"%parentDir%software\VeraCrypt.exe" /l %driveLetter% /m ro /v %1 /a
