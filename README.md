# WWM Live - Multiplayer Edition

## 🎮 Was ist das?

Ein Live-Multiplayer "Wer wird Millionär" Spiel für bis zu 100 Spieler!
Perfekt für Schultagungen, Team-Events oder Partys.

## ✨ Features

- **Live-Synchronisation**: Alle Spieler sehen gleichzeitig die gleichen Fragen
- **3 Joker**: 50:50, Publikumsjoker, Telefonjoker
- **Roter Modus**: Ausgeschiedene Spieler können weiter mitspielen (zählt aber nicht)
- **Host-Dashboard**: Übersicht über alle Spieler und deren Status
- **Mobile-optimiert**: Spieler können auf Handy, Tablet oder Laptop teilnehmen
- **15 Fragen** mit Gewinnleiter
- **30 Sekunden Timer** pro Frage

## 🚀 Installation & Start

### Variante 1: Mit Python (Empfohlen)

1. Öffne das Terminal/Eingabeaufforderung
2. Navigiere zum `wwm-live` Ordner
3. Starte den Server:
   ```
   python -m http.server 8080
   ```
4. Öffne im Browser: `http://localhost:8080/host.html`

### Variante 2: Mit Node.js

1. Installiere `http-server` global:
   ```
   npm install -g http-server
   ```
2. Im `wwm-live` Ordner:
   ```
   http-server -p 8080
   ```
3. Öffne im Browser: `http://localhost:8080/host.html`

### Variante 3: Direkt im Browser (Nur für Test)

Einfach `host.html` mit Doppelklick öffnen.
**WICHTIG**: Peer-to-Peer Verbindungen funktionieren möglicherweise nicht ohne Server!

## 📱 So funktioniert's

### Für den Host (Lehrer/Moderator):

1. Starte `host.html`
2. Ein QR-Code und eine URL werden angezeigt
3. Warte bis Spieler beigetreten sind
4. Klicke auf "Spiel starten"
5. Lies die Fragen vor
6. Klicke nach 30 Sekunden auf "Auflösung zeigen"
7. Klicke auf "Nächste Frage"

### Für Spieler:

1. Scanne den QR-Code ODER gehe zur angezeigten URL
2. Gib deinen Namen ein
3. Warte auf Spielstart
4. Beantworte die Fragen innerhalb von 30 Sekunden
5. Nutze deine Joker strategisch!

## 🎯 Die Joker im Detail

### 50:50 Joker
- Klassischer Joker
- Entfernt 2 falsche Antworten
- Jeder Spieler kann ihn individuell einsetzen

### Publikumsjoker
- Spezieller Joker!
- Spieler wählt den Joker UND wählt trotzdem eine Antwort
- **Auflösung:**
  - Hat die Mehrheit der lebenden Spieler recht? → Spieler ist auch richtig
  - Hat die Mehrheit falsch? → Eigene Wahl des Spielers zählt
  - Keine anderen Spieler mehr? → Eigene Wahl zählt

### Telefonjoker
- Spieler wählt einen beliebigen lebenden Mitspieler aus
- Der Angerufene sieht dass er angerufen wurde (keine Auswirkung auf sein Spiel!)
- **Auflösung:**
  - Hat der Angerufene recht? → Anrufer ist auch richtig
  - Hat der Angerufene falsch? → Eigene Wahl des Anrufers zählt

## 🌐 Netzwerk-Setup

### Option A: Schul-WLAN (Empfohlen)
- Notebook und Spieler im gleichen WLAN
- Spieler gehen auf die angezeigte IP-Adresse

### Option B: Hotspot vom Notebook
1. Aktiviere Hotspot auf deinem Notebook
2. Spieler verbinden sich mit dem Hotspot
3. Spieler gehen auf `192.168.137.1:8080/player.html` (Windows)
   oder die angezeigte IP-Adresse

### Deine IP-Adresse finden:
- **Windows**: `ipconfig` im Terminal
- **Mac/Linux**: `ifconfig` im Terminal
- Suche nach IPv4-Adresse (z.B. 192.168.1.123)

## ⚙️ Eigene Fragen hinzufügen

Öffne `host.html` und bearbeite das `questions` Array (ab Zeile ~104):

```javascript
const questions = [
    {
        question: "Deine Frage hier?",
        answers: ["Antwort A", "Antwort B", "Antwort C", "Antwort D"],
        correct: 1  // 0=A, 1=B, 2=C, 3=D
    },
    // ... weitere Fragen
];
```

## 🎨 Design anpassen

Farben und Styling kannst du im `<style>` Bereich von `host.html` und `player.html` anpassen.

## 🐛 Troubleshooting

**Problem**: Spieler können nicht beitreten
- Lösung: Stelle sicher dass alle im gleichen Netzwerk sind
- Prüfe die Firewall-Einstellungen

**Problem**: QR-Code wird nicht angezeigt
- Lösung: Internetverbindung nötig für QR-Code Library
- Alternative: Spieler können URL manuell eingeben

**Problem**: Verbindung bricht ab
- Lösung: PeerJS benötigt stabile Internetverbindung
- Bei Problemen: Verwende lokales Netzwerk ohne Internet (PeerJS Server könnte Probleme machen)

## 📝 Technische Details

- **Frontend**: HTML5, CSS3, JavaScript
- **Peer-to-Peer**: PeerJS (WebRTC)
- **Keine Server-Installation nötig**
- **Keine Datenbank nötig**
- **Keine Node.js-Kenntnisse nötig**

## 🎓 Perfekt für:

- Lehrerfortbildungen
- Schulveranstaltungen  
- Team-Building Events
- Geburtstagsfeiern
- Quiz-Abende

## 📄 Lizenz

Frei verwendbar für Bildungszwecke!

## 🤝 Support

Bei Fragen oder Problemen: Einfach Claude fragen! 😊

---

**Viel Spass beim Spielen!** 🎉
