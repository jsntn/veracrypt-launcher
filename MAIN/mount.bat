@echo off
mode con: cols=100 lines=20

FOR %%A IN ("%~dp0.") DO SET parentDir=%%~dpA

SET mode=%1
SET config=%2.ini

IF "%mode%"=="read" (
  SET mode=ro
)
IF "%mode%"=="write" (
  SET mode=ts
)

for /f "tokens=1,2 delims==" %%a in (%parentDir%data\%config%) do (
if %%a==program set program=%%b
if %%a==drive set drive=%%b
if %%a==volume set volume=%%b
if %%a==password set password=%%b
)

IF DEFINED program (
  REM JUST SKIP
) ELSE (
  SET program=%parentDir%MAIN\VeraCrypt-x64.exe
)

IF DEFINED password (
%program% /l %drive% /m %mode% /v "%parentDir%data\%volume%" /a /p %password%
) ELSE (
%program% /l %drive% /m %mode% /v "%parentDir%data\%volume%" /a
)
