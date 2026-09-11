# Diplomarbeitsvorlage — HTL Wiener Neustadt

Typst-Vorlage für Diplomarbeiten der HTL Wiener Neustadt.

## Quickstart

1. **Typst installieren** (≥ 0.14)

   ```sh
   sudo pacman -S typst        # Arch Linux
   # oder Binary von https://github.com/typst/typst/releases
   ```

2. **Repository holen**

   ```sh
   git clone https://github.com/spizzadev/diplomarbeitsvorlage.git
   cd diplomarbeitsvorlage
   ```

3. **Live-Vorschau starten** (kompiliert bei jedem Speichern neu)

   ```sh
   typst watch _Diplomarbeit.typ _Diplomarbeit.pdf
   ```

4. **Eigene Daten eintragen** — in dieser Reihenfolge:

   | Schritt | Datei | Was |
   |---------|-------|-----|
   | 1 | `_Diplomarbeit.typ` | Titel, Abteilung, Abgabejahr, Betreuer, Schüler → [Metadaten](#1-metadaten-_diplomarbeittyp) |
   | 2 | `chapters/dokumentation-daten.typ` | Dokumentationsformular (Jahrgang, Aufgabenstellung, Ergebnisse …) → [Formular](#2-dokumentationsformular-chaptersdokumentation-datentyp) |
   | 3 | `chapters/kurzfassung.typ`, `chapters/abstract.typ` | Kurzfassung (DE) und Abstract (EN), je max. 1 Seite |
   | 4 | `chapters/vorwort.typ` | Vorwort (Danksagung, Motivation) |
   | 5 | `chapters/einleitung.typ` … `chapters/schluss.typ` | Eigentlicher Inhalt → [Kapitel](#3-kapitel) |
   | 6 | `literatur.bib` | Quellen im BibTeX-Format → [Literatur](#4-literatur-literaturbib) |
   | 7 | `chapters/anhang_b.typ` … | Anhänge (CD-Inhalt, Abkürzungen, Quelltext) |

5. **Vorlagenkapitel entfernen** — die Kapitel `typst.typ`, `abbildungen.typ`,
   `mathematik.typ`, `literatur.typ`, `drucken.typ`, `diplomschrift.typ` sind reine
   Anleitung. Vor der Abgabe die zugehörigen `#include`-Zeilen in `_Diplomarbeit.typ`
   löschen oder auskommentieren.

6. **Fertige PDF erzeugen**

   ```sh
   typst compile _Diplomarbeit.typ _Diplomarbeit.pdf
   ```

---

## Was wo angepasst wird

### 1. Metadaten (`_Diplomarbeit.typ`)

Alle Felder im Aufruf `#show: htldipl.with( … )`:

| Feld | Typ | Pflicht | Standard | Bedeutung |
|------|-----|---------|----------|-----------|
| `title` | String | ja | `"Titel der Diplomarbeit"` | Titel der Arbeit. Erscheint auf Titelseite und im Dokumentationsformular |
| `abteilung` | String | ja | `"Abteilung??"` | Fachrichtung, z. B. `"Informatik"`. Titelseite („Höhere Lehranstalt für …“) und Kopfzeile des Dokumentationsformulars |
| `studienort` | String | nein | `"Wiener Neustadt"` | Ort in der Datumszeile der Titelseite und der eidesstattlichen Erklärung |
| `schule` | String | nein | `"HTBLuVA Wiener Neustadt"` | Schulname auf der Titelseite |
| `schullogo` | Pfad | nein | `"images/htl.jpeg"` | Logo links oben auf der Titelseite |
| `htllogo` | Pfad | nein | `"images/htl_allgemein.jpg"` | Logo rechts oben auf der Titelseite und in der Kopfzeile des Dokumentationsformulars |
| `abgabejahr` | String | ja | `"20XX/XX"` | Schuljahr der Abgabe, z. B. `"2025/26"` |
| `betreuer` | Liste von Strings | ja | `()` | 1–4 Einträge, mit Titel. **Reihenfolge zählt:** 1. Eintrag = Prüfer, 2. Eintrag = Abteilungsvorstand (so im Approbationsfeld des Dokumentationsformulars) |
| `schueler` | Liste von Dictionaries | ja | `()` | 1–5 Einträge, je `(name: …, evidenz: …, subthema: …)` — siehe unten |
| `lang` | `"de"` / `"en"` | nein | `"de"` | Dokumentsprache: Trennregeln, automatische Überschriften, Kopfzeilen des Dokumentationsformulars |
| `color` | `true` / `false` | nein | `true` | Hintergrund von Code-Blöcken: `true` = grau hinterlegt, `false` = weiß (Druck). Syntax-Highlighting bleibt in beiden Fällen farbig |
| `twoside` | `true` / `false` | nein | `false` | Vorgesehen für doppelseitigen Satz — im Template derzeit **ohne Wirkung**, Ränder und Kopfzeilen sind auf allen Seiten gleich |

Ein Eintrag in `schueler`:

| Schlüssel | Bedeutung |
|-----------|-----------|
| `name` | Vor- und Zuname, Zuname üblicherweise in Großbuchstaben: `"Maximilian MAIER"` |
| `evidenz` | Evidenznummer, z. B. `"5AHIF-17"` |
| `subthema` | Teilthema, das diese Person bearbeitet hat. Steht auf der Titelseite über dem Namen |

Ebenfalls in `_Diplomarbeit.typ`:

| Stelle | Was |
|--------|-----|
| `#let glossary-entries = ( … )` | Glossar: Liste von Paaren `("Begriff", "Erklärung")`. Ausgabe am Dokumentende durch `#print-glossary(glossary-entries)` — Zeile löschen, wenn kein Glossar gewünscht |
| `#include`-Zeilen | Welche Kapitel in welcher Reihenfolge erscheinen |
| `#bibliography("literatur.bib", style: "ieee", title: "Literaturverzeichnis")` | Quelldatei, Zitierstil (z. B. `"ieee"`, `"apa"`, `"iso-690-numeric"`) und Überschrift des Literaturverzeichnisses |

Nicht verschieben: `#show: mainmatter()` startet den Hauptteil (arabische Seitenzahlen ab 1,
nummerierte Kapitel), `#show: appendix-matter()` startet den Anhang (Buchstaben-Nummerierung).

### 2. Dokumentationsformular (`chapters/dokumentation-daten.typ`)

Das 4-seitige offizielle Formular. Titel, Schüler, Betreuer, Abteilung und Abgabejahr
kommen automatisch aus `htldipl.with()` — hier **nur** die folgenden Felder eintragen:

| Feld | Typ | Pflicht | Bedeutung |
|------|-----|---------|-----------|
| `jahrgang` | String | ja | Klasse im Abgabejahr, z. B. `"5AHIF"` |
| `title-en` | String | ja | Englische Übersetzung des Arbeitstitels |
| `kooperationspartner` | String | nein | Firma/Institution. Zeile weglassen, wenn kein Partner |
| `aufgabenstellung` | Inhalt `[…]` | ja | Aufgabenstellung in einigen Sätzen (deutsch) |
| `aufgabenstellung-en` | Inhalt `[…]` | ja | dasselbe auf Englisch |
| `realisierung` | Inhalt `[…]` | ja | Gewählte Vorgehensweise und Umsetzung (deutsch) |
| `realisierung-en` | Inhalt `[…]` | ja | dasselbe auf Englisch |
| `ergebnisse` | Inhalt `[…]` | ja | Wichtigste Ergebnisse und Erkenntnisse (deutsch) |
| `ergebnisse-en` | Inhalt `[…]` | ja | dasselbe auf Englisch |
| `grafik` | Pfad | nein | Typisches Foto/Grafik der Arbeit. Ohne Angabe bleibt ein Platzhalterrahmen |
| `grafik-beschreibung` | Inhalt `[…]` | nein | Bildunterschrift (deutsch) |
| `grafik-beschreibung-en` | Inhalt `[…]` | nein | Bildunterschrift (englisch) |
| `preis` | Inhalt `[…]` | nein | Teilnahme an Wettbewerben / Auszeichnungen, z. B. `[1. Preis bei Jugend Innovativ 2025]` |
| `adresse` | Inhalt `[…]` | nein | Adresse für „Möglichkeiten der Einsichtnahme“. Standard ist die Schuladresse |

Optionale Felder sind in der Datei auskommentiert — zum Verwenden das `//` entfernen.

### 3. Kapitel (`chapters/`)

Eine Datei pro Kapitel, eingebunden über `#include` in `_Diplomarbeit.typ`.
Neues Kapitel: Datei in `chapters/` anlegen, mit `= Kapitelüberschrift` beginnen,
`#include`-Zeile an der passenden Stelle ergänzen.

| Datei | Inhalt | Vor Abgabe |
|-------|--------|------------|
| `vorwort.typ` | Vorwort, Danksagung | ersetzen |
| `kurzfassung.typ` | Kurzfassung (deutsch), max. 1 Seite | ersetzen |
| `abstract.typ` | Abstract (englisch), max. 1 Seite | ersetzen |
| `einleitung.typ` | Einleitung | ersetzen |
| `diplomschrift.typ` | Anleitung: Aufbau einer Diplomarbeit | entfernen |
| `typst.typ` | Anleitung: Typst-Grundlagen | entfernen |
| `abbildungen.typ` | Anleitung: Abbildungen, Tabellen, Listings | entfernen |
| `mathematik.typ` | Anleitung: Formelsatz | entfernen |
| `literatur.typ` | Anleitung: Zitieren | entfernen |
| `drucken.typ` | Anleitung: Druck und Formvorschriften | entfernen |
| `schluss.typ` | Zusammenfassung und Ausblick | ersetzen |
| `dokumentation-daten.typ` | Daten des Dokumentationsformulars | ausfüllen |
| `anhang_b.typ` | Inhalt der CD-ROM/DVD | anpassen |
| `anhang_c.typ` | Abkürzungsverzeichnis o. Ä. | anpassen |
| `anhang_d.typ` | Quelltext von `_Diplomarbeit.typ` (automatisch eingelesen) | belassen |

Bilder gehören nach `images/` und werden über `#figure(image("images/datei.png", width: 80%), caption: [Text])` eingebunden.

### 4. Literatur (`literatur.bib`)

BibTeX-Datei, von Typst direkt gelesen — kein BibTeX/Biber-Lauf nötig.
Eintrag ergänzen, im Text mit `@schluessel` zitieren:

```bibtex
@book{knuth1984,
  author    = {Donald E. Knuth},
  title     = {The {\TeX}book},
  publisher = {Addison-Wesley},
  year      = {1984},
}
```

### 5. Template selbst (`htldipl.typ`)

Nur anfassen, wenn Layout oder Formvorschriften geändert werden sollen. Enthält
Titelseite, eidesstattliche Erklärung, Kopf-/Fußzeilen, globale Stile, das
Dokumentationsformular sowie die Hilfsfunktionen `mainmatter()`, `appendix-matter()`,
`print-glossary()`, `trennstrich()`, `frametext()`, `kurzfassung()`, `abstract-en()`.
Die Farbdefinitionen (`htl-green`, `htl-red`, …) stehen ganz oben in der Datei.

---

## Voraussetzungen

- [Typst](https://github.com/typst/typst) ≥ 0.14
  Arch Linux: `sudo pacman -S typst`

## Struktur

| Datei / Ordner | Inhalt |
|----------------|--------|
| `_Diplomarbeit.typ` | Hauptdatei — Metadaten und Kapitelreihenfolge |
| `htldipl.typ` | Template-Modul (Titelseite, Kopfzeilen, Stile, Dokumentationsformular) |
| `chapters/dokumentation-daten.typ` | Dokumentationsformular-Daten (von Schülern auszufüllen) |
| `chapters/` | Kapitel-Dateien |
| `images/` | Bilder und Grafiken |
| `literatur.bib` | Literatur-Datenbank (BibTeX-Format) |

## Maintainer

Typst-Port: [Markus Spitzer](https://github.com/spizzadev)
Ursprüngliche LaTeX-Vorlage: Wolfgang Schermann (2018)
