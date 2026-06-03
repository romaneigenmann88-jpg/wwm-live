# 🎁 WWM Live an eine andere Lehrperson weitergeben

> **Wichtig vorweg:** Du brauchst **keinen eigenen Server**!
> Das Spiel läuft komplett im Browser über Cloud-Dienste
> (PeerJS für die Verbindung + Metered.ca als Relais).
> Der „Server" ist GitHub Pages – der läuft schon.

Es gibt drei Möglichkeiten – von der einfachsten bis zur unabhängigsten.

---

## ✅ Variante 1: Einfach den Link weitergeben (am einfachsten)

Die schnellste Art. Die andere Lehrperson muss gar nichts installieren.

**So geht's:**
1. Diesen Link weitergeben (z. B. per Mail oder Teams):
   ```
   https://romaneigenmann88-jpg.github.io/wwm-live/host.html
   ```
2. Die Lehrperson öffnet den Link im Browser (Chrome/Edge empfohlen).
3. Im **Fragen-Editor** ihre eigenen Fragen eingeben → „Fragen übernehmen".
4. Spiel starten – fertig!

**Gut zu wissen:**
- ✔️ Kein Konto, keine Installation, kein Server nötig.
- ✔️ Die eingegebenen Fragen werden **im Browser dieser Person** gespeichert
  (localStorage) – bleiben also bis zum nächsten Mal erhalten.
- ⚠️ Die Fragen sind **pro Gerät/Browser**. Wechselt sie den Computer,
  muss sie die Fragen neu einfügen (am besten den JSON-Code aufbewahren).
- ⚠️ Es wird mein Metered-Relais-Konto mitbenutzt. Für gelegentlichen
  Schuleinsatz völlig okay. (Nur bei sehr intensiver Dauernutzung könnte
  das Gratis-Kontingent knapp werden → dann Variante 2 oder 3.)

---

## 🍴 Variante 2: Eigene Kopie auf GitHub (unabhängig)

Wenn die Lehrperson eine **komplett eigene Version** mit eigenem Link will.

**So geht's:**
1. Die Person erstellt ein kostenloses GitHub-Konto: https://github.com/signup
2. Auf meine Projektseite gehen:
   ```
   https://github.com/romaneigenmann88-jpg/wwm-live
   ```
3. Oben rechts auf **„Fork"** klicken → erstellt eine eigene Kopie.
4. Im eigenen Fork: **Settings → Pages**
   - Bei „Source" den Branch **`master`** wählen, Ordner **`/ (root)`**.
   - **Save** klicken.
5. Nach 1–2 Minuten ist die eigene Version online unter:
   ```
   https://IHR-BENUTZERNAME.github.io/wwm-live/host.html
   ```

**Gut zu wissen:**
- ✔️ Eigener Link, eigene Kopie – unabhängig von mir.
- ✔️ Sie kann eigene Fragen sogar fest im Code hinterlegen.
- ⚠️ Es wird weiterhin mein Metered-Relais genutzt. Für völlige
  Unabhängigkeit siehe Abschnitt „Eigenes Relais" weiter unten.

---

## 💻 Variante 3: Lokal vom eigenen Computer starten

Wenn kein GitHub gewünscht ist und alles vom eigenen Notebook laufen soll.
(Internet wird trotzdem benötigt – wegen PeerJS/Relais.)

**So geht's:**
1. Auf meiner GitHub-Seite: grüner Button **„Code" → „Download ZIP"**.
2. ZIP entpacken (z. B. nach `Dokumente/wwm-live`).
3. Einen einfachen Webserver starten (nötig, weil die Verbindungen
   beim direkten Öffnen der Datei sonst blockiert werden):

   **Windows (mit Python):**
   - Doppelklick auf `start-server.bat`

   **Mac/Linux:**
   - Terminal im Ordner öffnen, dann:
     ```
     ./start-server.sh
     ```

   **Ohne Python – Alternative mit VS Code:**
   - Erweiterung „Live Server" installieren → Rechtsklick auf
     `host.html` → „Open with Live Server".
4. Im Browser öffnen:
   ```
   http://localhost:8080/host.html
   ```

**Gut zu wissen:**
- ✔️ Alle Dateien liegen lokal, volle Kontrolle.
- ⚠️ Etwas mehr Aufwand (Python oder VS Code nötig).
- ⚠️ Der Computer mit dem Server muss während des Spiels laufen.

---

## 🔁 Fragen mitgeben (bei allen Varianten)

Am einfachsten gibst du fertige Fragen so weiter:

1. Bei dir im **Fragen-Editor** den **JSON-Code links** komplett markieren
   und kopieren.
2. Diesen Text der anderen Person schicken (Mail, Datei, Chat).
3. Sie fügt ihn bei sich im Editor links ein → Vorschau erscheint sofort.

> Der Code funktioniert mit oder ohne äussere `[ ]` – auch KI-generierte
> Fragen lassen sich direkt einfügen.

---

## 🔧 Optional: Eigenes Relais-Konto (für volle Unabhängigkeit)

Nur nötig bei sehr intensiver Nutzung oder wenn die andere Person gar
nichts von meinem Konto mitbenutzen soll.

1. Kostenloses Konto bei https://www.metered.ca/ erstellen.
2. Dort einen TURN-Service anlegen → eigenen **API-Key** + Zugangsdaten erhalten.
3. In `host.html` die Stelle mit `metered.ca` / `apiKey=...` suchen und
   die eigenen Zugangsdaten eintragen.

(Für den normalen Schuleinsatz ist das **nicht** nötig.)

---

## ❓ Häufige Fragen

**Brauche ich einen Server?**
→ Nein. Nur für Variante 3 (lokal) einen einfachen Webserver auf dem
eigenen Rechner. Bei Variante 1 und 2 läuft alles über GitHub Pages.

**Müssen alle im gleichen WLAN sein?**
→ Nein. Dank Cloud-Relais funktioniert es auch über verschiedene Netze.
Gleiches WLAN ist aber stabiler und schneller.

**Welcher Browser?**
→ Chrome oder Edge empfohlen (Host, Beamer und Spieler).

**Empfehlung?**
→ Für die meisten Lehrpersonen reicht **Variante 1** (Link weitergeben)
vollkommen aus.
