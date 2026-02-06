@echo off
echo ========================================
echo   WWM Live - Server wird gestartet
echo ========================================
echo.
echo Starte lokalen Server auf Port 8080...
echo.
echo Wenn der Server laeuft, oeffne im Browser:
echo http://localhost:8080/host.html
echo.
echo Zum Beenden: Druecke STRG+C
echo.
echo ========================================
echo.

REM Try Python first
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Python gefunden! Starte Server...
    python -m http.server 8080 --bind 0.0.0.0
    goto :end
)

REM Try Python3
where python3 >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Python3 gefunden! Starte Server...
    python3 -m http.server 8080 --bind 0.0.0.0
    goto :end
)

REM Try Node.js http-server
where http-server >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo http-server gefunden! Starte Server...
    http-server -p 8080
    goto :end
)

REM No server found
echo.
echo FEHLER: Kein Server gefunden!
echo.
echo Bitte installiere eines der folgenden:
echo.
echo 1. Python (empfohlen)
echo    Download: https://www.python.org/downloads/
echo.
echo 2. Node.js mit http-server
echo    npm install -g http-server
echo.
echo Oder oeffne host.html direkt im Browser (eingeschraenkte Funktionalitaet)
echo.
pause

:end