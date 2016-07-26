@echo off
setlocal enableextensions enabledelayedexpansion
REM add user to group, group being first parameter and user being second.
REM todo:
REM Option/switch for removing group, e.g. additional parameter.
IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR
IF NOT "%3"=="" GOTO ERROR
GOTO DOIT

:DOIT
net group $1 $2 /add /do
GOTO END

:ERROR
@echo "Error in parameter syntax. Try again. %0 groupname username"
GOTO END

:END
endlocal
pause
