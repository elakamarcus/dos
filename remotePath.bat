@echo off
setlocal enableextensions enabledelayedexpansion

IF "%1"=="" GOTO ERROR
IF NOT "%2"=="" GOTO ERROR

@echo off
for /f "tokens=*" %%a in ('reg query \\%1\hku ^| FIND /i "S-1-5-21-" ^| FIND /v /i "_Classes"') DO (
    set RemoteUserName=
    for /f "tokens=5" %%z in ('REG QUERY "\\%1\%%a\Software\Microsoft\Windows\CurrentVersion\Explorer" ^| FIND /i "Logon User Name"') DO SET RemoteUserName=%%z
    set RemoteDrives=
    for /f "tokens=* delims= " %%b in ('REG QUERY "\\%1\%%a\Network" ^| FIND /i "Network\"') DO (
         set DriveLetter=%%b
         set DriveLetter=!DriveLetter:~-1!
         for /f "tokens=3" %%z in ('REG QUERY "\\%1\%%b" ^| FIND /i "RemotePath"') DO Set RemotePath=%%z
         set RemoteDrives=!RemoteDrives!,"!DriveLetter!","!RemotePath!"
    )
    set SID=%%a
    set SID=!SID:~11!
    IF NOT DEFINED RemoteDrives Set RemoteDrives=,""
	  echo %1 : !RemoteDrives:~1!
)

:ERROR
echo Did not supply correct amount of parameters. Try again.
echo correct usage: %0 <targethostname>
GOTO QUIT

:QUIT
endlocal
pause