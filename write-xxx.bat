@echo off

SET volume=xxx.NTFS.VC

CALL "%~dp0MAIN\mount.bat" write %volume%
