@echo off
mode con: cols=100 lines=20

FOR %%A IN ("%~dp0.") DO SET parentDir=%%~dpA

SET mode=%1
SET config=%2.ini

SET letters=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z

IF "%mode%"=="read" (
  SET mode=ro
)
IF "%mode%"=="write" (
  SET mode=ts
)

for %%l in (%letters%) do (
  echo checking %%l...
  wmic logicaldisk where "name='%%l:'" get name | findstr /i "%%l" > nul
  if errorlevel 1 (
    SET availDrive=%%l
    goto break
  )
)
:break

echo Available Drive Letter is: %availDrive%

for /f "tokens=1,2 delims==" %%a in (%parentDir%data\%config%) do (
if %%a==program set program=%%b
if %%a==volume set volume=%%b
if %%a==password set password=%%b
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
%program% /l %availDrive% /m %mode% /v "%parentDir%data\%volume%" /a /p %password%
) ELSE (
%program% /l %availDrive% /m %mode% /v "%parentDir%data\%volume%" /a
)
