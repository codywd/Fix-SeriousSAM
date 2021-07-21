icacls %windir%\system32\config\*.* /inheritance:e
vssadmin delete shadows /all /quiet
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%DATE%",100,1