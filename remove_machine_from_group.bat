@echo off
setlocal enableextensions enabledelayedexpansion
REM require server administrator tools to be installed on the system
REM Todo
REM Option for add/remove, e.g. via additional parameter.

IF "%1"=="" GOTO ERROR
IF "%2"=="" GOTO ERROR
IF NOT "%3"=="" GOTO ERROR

set removegrp="dsquery the groupname"
GOTO DOIT

:ERROR
echo [-] Need parameter computername. Try again.
echo [-] Execute as %0 computername.
GOTO QUIT

:DOIT
REM This search may result in multiple entries.
REM for /F "tokens=*" %%q in ('dsquery group -name "*%2*"') do (
REM     set removegrp=%%q
REM )

for /F "tokens=*" %%a in ('dsquery computer -name %1') do (
    dsmod group %removegrp% -rmmbr %%a 1>nul 2>&1
)

GOTO QUIT

:QUIT
endlocal
pause