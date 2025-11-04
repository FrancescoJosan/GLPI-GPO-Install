@echo off
setlocal enabledelayedexpansion
set attempts=0
set max_attempts=5
:start
if exist X:\ (
  echo %COMPUTERNAME%,%date%,%time% >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
    if exist C:\scriptsGLPI\ (
    echo The folder exists:Yes >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
  ) else (
    echo The folder exists:No >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
    mkdir C:\scriptsGLPI\ >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
  )
  if exist C:\scriptsGLPI\GLPI-Agent-1.7-x64.msi (
    echo The MSI file exists:Yes >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
  ) else (
    echo The MSI file exists:No >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
    cd X:\SW Utili\scripts
    xcopy /Y "PASTE HERE THE SHARED FOLDER URL \GLPI\GLPI-Agent-1.7-x64.msi" "C:\scriptsGLPI\" >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
    xcopy /Y "PASTE HERE THE SHARED FOLDER URL \GLPI\RunScriptGLPI.bat" "C:\scriptsGLPI\" >> "HERE PASTE THE DESTINATION FOR THE \log.txt"
  )
) else (
  set /a attempts+=1
  net use X: "\\IP ADDRES OF THE SHARED FOLDER"
  if !attempts! GEQ !max_attempts! (
     echo Errore: Unable to connect drive X: after !max_attempts! attempts.
    exit /b
  )
  timeout /t 5 >nul
  goto start
)


