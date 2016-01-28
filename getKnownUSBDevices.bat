@echo off
setlocal enableextensions enabledelayedexpansion

IF "%1"=="" GOTO ERROR

set TARGET=%1

GOTO GET

:GET
@echo Setting up network connections ...
reg query \\%1\hklm\SYSTEM\CurrentControlSet\Enum\USBSTOR /s /z | findstr /I FriendlyName> %1.Friendly.tmp
@echo Friendly output
for /F "tokens=2 delims=)" %%i in (!TARGET!.Friendly.tmp) do @echo %%i
echo .
GOTO NONFRIENDLY

:NONFRIENDLY
echo .
@echo Non-Friendly output
reg query \\%1\hklm\SYSTEM\CurrentControlSet\Enum\USBSTOR > %1.non-Friendly.tmp
for /F "tokens=6 delims=\" %%i in (!TARGET!.non-Friendly.tmp) do @echo %%i

GOTO SUCCESS

:ERROR
echo Did not supply correct amount of parameters. try again
echo correct usage: getKnownUSBdevices.bat <targethostname>
GOTO QUIT

:SUCCESS
echo Enjoy!

:QUIT
