@echo off
:start
TIMEOUT /T 300
rundll32.exe cmdext.dll,MessageBeepStub
rundll32 user32.dll,MessageBeep
TIMEOUT /T 20
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
goto start
