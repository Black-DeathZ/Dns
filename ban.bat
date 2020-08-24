ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}



@echo off
color 1f
: Menu
cls
echo 1. Flush DNS + Reset IP
echo 2. Clear Temp folder
echo 3. Exit
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto Flushdns
if %answer%==2 goto Cleartemp
if %answer%==3 goto Exit
:Exit
cls
echo Github : https://github.com/Black-DeathZ
echo Press Enter from your keyboard to close this program.
exit /b
:Flushdns
cls
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
echo Processed Successfully!
pause
goto Menu
:Cleartemp
cls
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo Processed Successfully!
echo ------------------------------------------------------------------------
echo Please restart the PC
echo ------------------------------------------------------------------------
pause
goto Exit
