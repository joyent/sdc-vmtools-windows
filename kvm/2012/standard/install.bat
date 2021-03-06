REM This file installs the tools into c:\smartdc 
REM and sets c:\smartdc\bin as part of PATH

ECHO OFF
TITLE SDC Windows VM Tools - Install

cd %~dp0

CLS
ECHO SDC Windows VM Tools - Install
ECHO =======================================================
ECHO 
ECHO This tool will install the tools and drivers necessary
ECHO to run Windows in a SmartOS environment at C:\smartdc
ECHO It will also run the standard configuration neccessary  
ECHO for an image build: Turn on RDP, Turn on Ping, Install
ECHO NFS Client, .NET 3.5, and WINRM settings. 
ECHO 

PAUSE

mkdir c:\smartdc
xcopy * c:\smartdc /E /Q /Y
xcopy sysprep\SetupComplete.cmd %WINDIR%\Setup\Scripts\
xcopy /Y C:\smartdc\images\"Joyent Wiki.url" C:\Users\Default\Desktop\
xcopy /Y C:\smartdc\images\"Joyent Support.url" C:\Users\Default\Desktop\
powershell.exe -executionpolicy bypass -file C:\smartdc\bin\run-configuration.ps1
