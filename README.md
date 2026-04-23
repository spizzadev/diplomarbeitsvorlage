# Diplomarbeitsvorlage — HTL Wiener Neustadt

Typst-Vorlage für Diplomarbeiten der HTL Wiener Neustadt.

## Verwendung

1. Metadaten in `_Diplomarbeit.typ` eintragen (Titel, Schüler, Betreuer, Abteilung, …)
2. Dokumentationsformular in `chapters/dokumentation-daten.typ` ausfüllen (Jahrgang, Aufgabenstellung, Ergebnisse, …)
3. Kapitel in `chapters/` bearbeiten bzw. eigene erstellen
4. Kompilieren:

```sh
typst compile _Diplomarbeit.typ _Diplomarbeit.pdf
```

Live-Vorschau während des Schreibens:

```sh
typst watch _Diplomarbeit.typ _Diplomarbeit.pdf
```

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
