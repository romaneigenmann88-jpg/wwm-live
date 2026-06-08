# 🎁 WWM Live an eine andere Lehrperson weitergeben

> **Was sich geaendert hat (wichtig!):** Frueher lief die Verbindung ueber den
> oeffentlichen Gratis-Server `0.peerjs.com`. Der drosselt aber eine ganze Klasse
> hinter **einer** Schul-IP (Fehler `HTTP 429`) und kappt dann staendig die
> Verbindung. Deshalb laeuft die Verbindung jetzt ueber einen **eigenen kleinen
> Broker**, der gratis auf **Render.com** liegt. Das ist neu – und der einzige
> zusaetzliche Schritt gegenueber frueher.

## Die App nutzt jetzt drei Gratis-Dienste

| Dienst | Wofuer | Wer betreibt ihn? | Konto noetig? |
|--------|--------|-------------------|---------------|
| **GitHub Pages** | hostet die Webseite (host/player/beamer) | GitHub | ja (gratis) |
| **PeerJS-Broker** (auf Render) | verbindet Host & Spieler | **du** auf Render (gratis) | ja (gratis) |
| **Metered.ca** (TURN-Relais) | leitet die Verbindung weiter, wenn noetig | Metered.ca | ja (gratis) |

Alle drei sind kostenlos. Auf deinem eigenen Computer muss **nichts** laufen.

---

## Zwei Wege – such dir den passenden aus

| Situation | Welcher Weg? |
|-----------|--------------|
| Kollegin im selben Haus, gelegentlicher Einsatz | **Weg A** – meinen Link & meine Dienste mitnutzen. **Kein Einrichten.** |
| Person soll dauerhaft & voellig eigenstaendig sein | **Weg B** – eigene Kopie, eigener Broker, eigenes Metered-Konto. |

---

# Weg A: Einfach mitnutzen (kein Einrichten)

Die andere Lehrperson bekommt von dir einfach **deinen Host-Link**, z. B.
`https://romaneigenmann88-jpg.github.io/wwm-live/host.html`, und spielt los.
Sie nutzt dabei deinen Broker und dein Metered-Konto mit.

**Das Einzige, woran du denken musst:** Der Render-Gratis-Broker **schlaeft nach
15 Minuten Ruhe ein**. Wecke ihn **1–2 Minuten vor der Stunde** auf, indem du
diese Adresse einmal im Browser oeffnest:

> **https://wwm-peer-broker.onrender.com**

Erscheint dort eine kurze Zeile wie `{"name":"PeerJS Server", ...}`, ist er wach. ✅

➡️ Mehr ist fuer Weg A nicht noetig. Fragen weitergeben: siehe ganz unten.

---

# Weg B: Voellig eigenstaendig (eigener Broker + eigenes Konto)

Drei Schritte. Plane dafuer ca. 20 Minuten ein.

## Schritt 1: Eigene Kopie der App auf GitHub

1. Kostenloses GitHub-Konto erstellen: https://github.com/signup
2. Meine Projektseite oeffnen: `https://github.com/romaneigenmann88-jpg/wwm-live`
3. Oben rechts **„Fork"** klicken → erstellt eine eigene Kopie.
4. Im eigenen Fork: **Settings → Pages**
   - „Source": Branch **`master`**, Ordner **`/ (root)`** → **Save**.
5. Nach 1–2 Minuten ist die eigene Version online:
   `https://DEIN-BENUTZERNAME.github.io/wwm-live/host.html`

✔️ Jetzt hat die Person eine eigene App mit eigenem Link – nutzt aber noch
**meinen** Broker und **mein** Metered-Konto. Weiter mit Schritt 2 und 3.

## Schritt 2: Eigener PeerJS-Broker auf Render (NEU)

### 2a) Broker-Vorlage forken
1. Meine Broker-Vorlage oeffnen: `https://github.com/romaneigenmann88-jpg/wwm-peer-broker`
2. Oben rechts **„Fork"** klicken → eigene Kopie.

### 2b) Auf Render deployen (gratis, ohne Kreditkarte)
1. Auf https://render.com mit dem **GitHub-Konto** anmelden.
2. **New +** → **Web Service** → das geforkte Repo **`wwm-peer-broker`** waehlen.
3. Pruefen: **Build Command** `npm install`, **Start Command** `npm start`,
   **Instance Type / Plan: Free**.
4. **Create Web Service** → warten, bis oben **„Live"** steht (~1–2 Min).
5. Die **URL** oben kopieren, z. B. `https://wwm-peer-broker-xxxx.onrender.com`.
6. Test: URL im Browser oeffnen → kurze JSON-Antwort = Broker laeuft. ✅

### 2c) Die eigene Broker-URL in den Code eintragen
In **`host.html`** UND **`player.html`** (im eigenen Fork) ganz oben nach
**`PEER_CONFIG`** suchen (Strg+F). Dort steht:

```js
const PEER_CONFIG = {
    host:   'wwm-peer-broker.onrender.com',  // ← HIER die eigene Render-URL eintragen
    port:   443,
    path:   '/',
    secure: true
};
```

Nur den **`host`**-Wert auf die eigene Render-URL aendern – **ohne** `https://`
und **ohne** Schraegstrich am Ende, also z. B. `wwm-peer-broker-xxxx.onrender.com`.
**In beiden Dateien gleich.** Sonst nichts.

(Auf GitHub: Datei oeffnen → Stift ✏️ „Edit" → aendern → „Commit changes".)

⚠️ Auch hier gilt: Der Render-Gratis-Broker schlaeft nach 15 Min ein. **Tipp:**
eigene Broker-URL 1–2 Min vor der Stunde einmal oeffnen.

## Schritt 3: Eigenes Metered.ca-Konto (TURN-Relais)

### 3a) Konto + Zugangsdaten holen
1. Kostenlos registrieren: https://www.metered.ca/ → „Sign up".
2. Im Dashboard einen **TURN-Server-Service** anlegen.
3. Dort findet man: eine **App-Subdomain** (`xxx.metered.live`), einen **API-Key**
   und **statische TURN-Zugangsdaten** (`username` + `credential`).

### 3b) Die 4 Werte im Code ersetzen
In **`host.html`** UND **`player.html`** nach **`METERED_CONFIG`** suchen:

```js
const METERED_CONFIG = {
    subdomain:  'wwm-live',                              // ← deine App-Subdomain (xxx.metered.live)
    apiKey:     '03b24408468271208429991be1473776dcc1', // ← dein Metered API-Key
    username:   'c4ca643ec3ef89475fda8aaf',             // ← statischer TURN-Benutzer
    credential: '958T4scRQJRKgSyg'                      // ← statisches TURN-Passwort
};
```

Diese **4 Werte** durch die eigenen ersetzen – **in beiden Dateien gleich**.

### 3c) Speichern & testen
- Nach dem Commit aktualisiert sich GitHub Pages automatisch (1–2 Min).
- `host.html` oeffnen → unten **„Netzwerk-Diagnose anzeigen"** → **„Netzwerk-Test
  starten"**. Steht bei „PeerJS-Server" und „TURN-Server" jeweils **OK**, passt alles.

✔️ Jetzt ist die Person komplett unabhaengig: eigener Link, eigener Broker,
eigenes TURN-Konto, kein Zugriff auf deine Daten.

---

## ✅ Werte-Checkliste fuer Weg B (was genau wo eintragen)

| Wert | Woher | Wohin | In wie vielen Dateien |
|------|-------|-------|-----------------------|
| Broker-URL | Render (Schritt 2b) | `PEER_CONFIG.host` | host.html **und** player.html |
| Subdomain | Metered-Dashboard | `METERED_CONFIG.subdomain` | host.html **und** player.html |
| API-Key | Metered-Dashboard | `METERED_CONFIG.apiKey` | host.html **und** player.html |
| TURN-Benutzer | Metered-Dashboard | `METERED_CONFIG.username` | host.html **und** player.html |
| TURN-Passwort | Metered-Dashboard | `METERED_CONFIG.credential` | host.html **und** player.html |

Ausserdem einmalig einstellen: GitHub **Pages** auf Branch `master` / Ordner `/ (root)`,
und auf Render den Plan **Free**.

---

## Fragen weitergeben (fuer Weg A und B gleich)

1. Bei dir im **Fragen-Editor** den **JSON-Code links** komplett markieren & kopieren.
2. Der Person schicken (Mail/Datei/Chat).
3. Sie fuegt ihn bei sich im Editor links ein → Vorschau erscheint sofort.

Der Code funktioniert mit oder ohne aeussere `[ ]` – auch KI-Fragen direkt einfuegbar.

---

## Haeufige Fragen

**Muss bei mir ein Server / mein Computer laufen?**
→ Nein. Der Broker liegt bei Render in der Cloud, TURN bei Metered. Sobald die App
auf GitHub Pages liegt, laeuft alles ohne deinen Computer.

**Warum jetzt ein eigener Broker statt `0.peerjs.com`?**
→ Der oeffentliche Server drosselt eine ganze Klasse hinter einer Schul-IP
(`HTTP 429`) und kappt staendig die Verbindung. Der eigene Broker hat dieses
Limit nicht.

**Der Broker reagiert beim ersten Versuch langsam / gar nicht.**
→ Der Render-Gratis-Tarif schlaeft nach 15 Min ein (Kaltstart ~30–50 s). Broker-URL
1–2 Min vor der Stunde einmal oeffnen, dann ist er wach.

**Muessen alle im gleichen WLAN sein?**
→ Nein, dank Cloud-Relais. Gleiches WLAN ist aber stabiler/schneller.

**Welcher Browser?**
→ Chrome oder Edge (fuer Host, Beamer und Spieler).

---

## 📌 Hinweis: Das Escape-Spiel funktioniert genauso

Das Escape-Game (`escape-room-classroom`) nutzt **denselben** Broker und dasselbe
Prinzip. Fuer dessen Weitergabe gilt Schritt 1–3 sinngemaess; die Broker-URL steht
dort direkt im `new Peer(...)`-Aufruf in `host.html` und `player.html` (nach
`onrender.com` suchen und ersetzen).
