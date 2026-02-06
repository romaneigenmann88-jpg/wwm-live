#!/bin/bash

echo "========================================"
echo "  WWM Live - Server wird gestartet"
echo "========================================"
echo ""
echo "Starte lokalen Server auf Port 8080..."
echo ""
echo "Wenn der Server läuft, öffne im Browser:"
echo "http://localhost:8080/host.html"
echo ""
echo "Zum Beenden: Drücke STRG+C"
echo ""
echo "========================================"
echo ""

# Try Python first
if command -v python3 &> /dev/null; then
    echo "Python3 gefunden! Starte Server..."
    python3 -m http.server 8080
elif command -v python &> /dev/null; then
    echo "Python gefunden! Starte Server..."
    python -m http.server 8080
elif command -v http-server &> /dev/null; then
    echo "http-server gefunden! Starte Server..."
    http-server -p 8080
else
    echo ""
    echo "FEHLER: Kein Server gefunden!"
    echo ""
    echo "Bitte installiere eines der folgenden:"
    echo ""
    echo "1. Python (empfohlen)"
    echo "   Mac: brew install python3"
    echo "   Linux: sudo apt install python3"
    echo ""
    echo "2. Node.js mit http-server"
    echo "   npm install -g http-server"
    echo ""
    echo "Oder öffne host.html direkt im Browser (eingeschränkte Funktionalität)"
    echo ""
    read -p "Drücke ENTER zum Beenden..."
fi
