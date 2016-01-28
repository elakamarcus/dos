@echo off
setlocal enableextensions enabledelayedexpansion

IF "%1"=="" GOTO ERROR
IF NOT "%2"=="" GOTO ERROR

SET TARGET=%1

:DOIT
for /F "tokens=1" %%i in ('getmac /s !TARGET!') do echo %%i
GOTO QUIT

:ERROR
echo invalid or insufficient parameter. try again. usage:
echo %0 TARGETMACHINE

:QUIT
