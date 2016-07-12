@echo off
setlocal enableextensions enabledelayedexpansion
REM add user to group, group being first parameter and user being second.
net group $1 $2 /add /do