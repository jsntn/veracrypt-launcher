@echo off
mode con: cols=100 lines=20

FOR %%A IN ("%~dp0.") DO SET parentDir=%%~dpA

SET mode=%1
SET config=%2.ini
SET volume=%2

SET letters=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z

IF "%mode%"=="read" (
  SET mode=ro
)
IF "%mode%"=="write" (
  SET mode=ts
)

for /f "tokens=1,2 delims==" %%a in (%parentDir%data\%config%) do (
if %%a==program set program=%%b
if %%a==drive set drive=%%b
if %%a==password set password=%%b
)

IF DEFINED drive (
  echo Checking Drive %drive%...
  wmic logicaldisk where "name='%drive%:'" get name 2>nul | findstr /i "%drive%" > nul
  if errorlevel 1 (
    echo Drive %drive% is available to use
    SET driveOption=/l %drive%
  ) else (
    echo Drive %drive% is used, about to exit...
    PAUSE
  )
) ELSE (
  echo No drive specified, will assign Drive Letter automatically...
  SET driveOption=
)

IF DEFINED program (
  IF "%program%"=="truecrypt" (
    SET program=%parentDir%MAIN\TrueCrypt.exe
  ) ELSE (
    REM JUST SKIP
  )
) ELSE (
  SET program=%parentDir%MAIN\VeraCrypt-x64.exe
)

IF DEFINED password (
%program% %driveOption% /m %mode% /v "%parentDir%data\%volume%" /a /p %password%
) ELSE (
%program% %driveOption% /m %mode% /v "%parentDir%data\%volume%" /a
)
