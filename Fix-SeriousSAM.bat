REM Change the permissions of all files in C:\Windows\System32\config\ according to Microsoft guidance: https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-36934
icacls %windir%\system32\config\*.* /inheritance:e
REM Delete all volume shadow copies to remove existing vulnerable files
vssadmin delete shadows /all /quiet
REM Create a new system restore point that is titled as today's date.
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%DATE%",100,1
