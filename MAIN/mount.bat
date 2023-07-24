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
  echo Checking %drive%...
  wmic logicaldisk where "name='%drive%:'" get name 2>nul | findstr /i "%drive%" > nul
  if errorlevel 1 (
    echo %drive% is available to use
    goto manualDrive
  ) else (
    echo %drive% is used, about to exit...
    PAUSE
  )
) ELSE (
  echo No drive specified, go to assign Drive Letter automatically...
  goto assignDrive
)

:assignDrive
for %%l in (%letters%) do (
  echo Checking %%l...
  wmic logicaldisk where "name='%%l:'" get name 2>nul | findstr /i "%%l" > nul
  if errorlevel 1 (
    SET drive=%%l
    goto break
  )
)

:break
echo Available Drive Letter is: %drive%

:manualDrive

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
%program% /l %drive% /m %mode% /v "%parentDir%data\%volume%" /a /p %password%
) ELSE (
%program% /l %drive% /m %mode% /v "%parentDir%data\%volume%" /a
)
