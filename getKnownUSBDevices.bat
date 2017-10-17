@echo off
setlocal enableextensions enabledelayedexpansion

IF "%1"=="" GOTO ERROR

set TARGET=%1

GOTO GET

:GET
@echo Setting up network connections ...
@echo Friendly output
for /F "tokens=2 delims=)" %%i in ('reg query \\%1\hklm\SYSTEM\CurrentControlSet\Enum\USBSTOR /s /z ^| findstr /I FriendlyName') do @echo %%i
echo .
GOTO NONFRIENDLY

:NONFRIENDLY
echo .
@echo Non-Friendly output
for /F "tokens=6 delims=\" %%i in ('reg query \\%1\hklm\SYSTEM\CurrentControlSet\Enum\USBSTOR') do @echo %%i

GOTO SUCCESS

:ERROR
echo Did not supply correct amount of parameters. try again
echo correct usage: getKnownUSBdevices.bat <targethostname>
GOTO QUIT

:SUCCESS
echo Enjoy!

:QUIT
