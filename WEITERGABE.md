# 🎁 WWM Live komplett unabhängig weitergeben

> **Erst das Wichtigste, damit kein Missverständnis entsteht:**
>
> Es gibt **keinen Server, den du auf deinem Computer laufen lassen musst.**
> Das Spiel nutzt zwei **Cloud-Dienste**, die rund um die Uhr von anderen
> betrieben werden:
>
> | Dienst | Wofür | Wer betreibt ihn? |
> |--------|-------|-------------------|
> | **PeerJS Cloud** (`0.peerjs.com`) | verbindet Host & Spieler | öffentlich, gratis, kein Konto |
> | **Metered.ca** (TURN-Relais) | leitet Verbindung weiter, wenn nötig | Metered.ca – **läuft 24/7 in deren Cloud** |
>
> Bei Metered.ca hast du nur ein **Konto** mit einem **API-Schlüssel**.
> Dieser Schlüssel steht im Code. Das ist das Einzige, was an *dich*
> persönlich gebunden ist – sonst nichts.

Damit eine andere Lehrperson das Spiel **völlig unabhängig** einsetzen
kann (ohne dein Konto, ohne dich), sind zwei Schritte nötig:

1. **Eigene Kopie der App** (GitHub-Fork → eigener Link)
2. **Eigenes Metered.ca-Konto** → eigene Zugangsdaten in den Code eintragen

---

## Schritt 1: Eigene Kopie auf GitHub (eigener Link)

1. Kostenloses GitHub-Konto erstellen: https://github.com/signup
2. Meine Projektseite öffnen:
   `https://github.com/romaneigenmann88-jpg/wwm-live`
3. Oben rechts **„Fork"** klicken → erstellt eine eigene Kopie.
4. Im eigenen Fork: **Settings → Pages**
   - „Source": Branch **`master`**, Ordner **`/ (root)`** → **Save**.
5. Nach 1–2 Minuten ist die eigene Version online:
   `https://IHR-BENUTZERNAME.github.io/wwm-live/host.html`

✔️ Jetzt hat die Person eine eigene App und einen eigenen Link.
⚠️ Sie nutzt aber noch **dein** Metered-Konto → weiter mit Schritt 2.

---

## Schritt 2: Eigenes Metered.ca-Konto (volle Unabhängigkeit)

### 2a) Konto + Zugangsdaten holen
1. Kostenlos registrieren: https://www.metered.ca/ → „Sign up"
2. Im Dashboard einen **TURN-Server-Service** anlegen.
3. Dort findet man:
   - eine **App-Subdomain**, z. B. `ihrname.metered.live`
   - einen **API-Key**, z. B. `abcd1234...`
   - **statische TURN-Zugangsdaten**: `username` + `credential` (Passwort)

### 2b) Zugangsdaten im Code ersetzen
Alle Zugangsdaten stehen **ganz oben** in einem klar markierten Block –
je einmal in `host.html` **und** in `player.html`. Du musst nur **4 Werte**
pro Datei ändern, sonst nichts.

(Auf GitHub: Datei öffnen → Stift-Symbol ✏️ „Edit" → ändern → „Commit".)

Suche in der Datei (Strg+F) nach **`METERED_CONFIG`**. Dort steht:

```js
const METERED_CONFIG = {
    subdomain:  'wwm-live',                              // ← deine App-Subdomain (xxx.metered.live)
    apiKey:     '03b24408468271208429991be1473776dcc1', // ← dein Metered API-Key
    username:   'c4ca643ec3ef89475fda8aaf',             // ← statischer TURN-Benutzer
    credential: '958T4scRQJRKgSyg'                      // ← statisches TURN-Passwort
};
```

Diese 4 Werte durch die eigenen aus dem Metered-Dashboard ersetzen –
**in beiden Dateien gleich**. Fertig. (Der Rest des Codes zieht sich die
Werte automatisch von hier.)

### 2c) Speichern & testen
- Nach dem Commit aktualisiert sich GitHub Pages automatisch (1–2 Min).
- `host.html` öffnen → unten **„Netzwerk-Diagnose anzeigen"** →
  **„Netzwerk-Test starten"**. Wenn „TURN-Server: OK" erscheint, passt alles.

✔️ Jetzt ist die Person komplett unabhängig – eigener Link, eigenes Konto.

---

## Schritt 3: Fragen mitgeben

Am einfachsten so:
1. Bei dir im **Fragen-Editor** den **JSON-Code links** komplett markieren & kopieren.
2. Der Person schicken (Mail/Datei/Chat).
3. Sie fügt ihn bei sich im Editor links ein → Vorschau erscheint sofort.

Der Code funktioniert mit oder ohne äussere `[ ]` – auch KI-Fragen direkt einfügbar.

---

## Brauche ich Schritt 2 wirklich?

| Situation | Empfehlung |
|-----------|------------|
| Gelegentlicher Einsatz, Kollegin im selben Haus | Schritt 2 **optional** – dein Konto mitnutzen reicht meist |
| Person soll dauerhaft & ganz eigenständig sein | Schritt 2 **ja** – eigenes Metered-Konto |
| Mehrere Klassen gleichzeitig, intensive Nutzung | Schritt 2 **ja** – sonst teilt ihr euch das Gratis-Kontingent |

Das Metered-Gratis-Kontingent (mehrere GB/Monat) reicht für normalen
Unterricht locker. „Volle Unabhängigkeit" heisst v. a.: getrennte Konten,
getrennte Kontingente, kein Zugriff auf deine Daten.

---

## Häufige Fragen

**Muss bei mir ein Server / mein Computer laufen?**
→ Nein. Beide Dienste (PeerJS + Metered) laufen in fremder Cloud.
Sobald die App auf GitHub Pages liegt, läuft alles ohne dich.

**Müssen alle im gleichen WLAN sein?**
→ Nein, dank Cloud-Relais. Gleiches WLAN ist aber stabiler/schneller.

**Welcher Browser?**
→ Chrome oder Edge (für Host, Beamer und Spieler).
