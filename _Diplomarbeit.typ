// _Diplomarbeit.typ
// Hauptdatei der Diplomarbeit — hier die eigenen Daten eintragen.
//
// Kompilieren:
//   typst compile _Diplomarbeit.typ _Diplomarbeit.pdf
// Live-Vorschau:
//   typst watch _Diplomarbeit.typ _Diplomarbeit.pdf

#import "htldipl.typ": htldipl, mainmatter, appendix-matter, print-glossary

// ── Glossareinträge ───────────────────────────────────────────────────────
#let glossary-entries = (
  ("Linux",   "Als Linux oder GNU/Linux bezeichnet man in der Regel freie, unix-ähnliche Mehrbenutzer-Betriebssysteme, die auf dem Linux-Kernel und wesentlich auf GNU-Software basieren."),
  ("Windows", "Windows bezeichnet in diesem Dokument das Betriebssystem Windows von Microsoft."),
)

// ── Template anwenden ─────────────────────────────────────────────────────
#show: htldipl.with(
  title:       "Entwurf eines Versuchstandes für Kreiselpumpen",
  abteilung:   "Informatik",
  studienort:  "Wiener Neustadt",
  schule:      "HTBLuVA Wiener Neustadt",
  schullogo:   "images/htl.jpeg",
  htllogo:     "images/htl_allgemein.jpg",
  abgabejahr:  "2010/11",

  // Betreuer: 1–4 Einträge
  betreuer: (
    "Dr. Walter Turbo",
    "Dipl.-Ing. Hans Kreisel",
    "Kurt Heidenheim",
    "Ing. Reiner Tischler",
  ),

  // Schüler: 1–5 Einträge, je (name, evidenz, subthema)
  schueler: (
    (name: "Maximilian MAIER",        evidenz: "5AHMIA-17", subthema: "Konstruktion des Versuchstandes"),
    (name: "Elisabeth MUSTER",        evidenz: "5AHMIA-19", subthema: "Erstellen der Pumpenkennlinien"),
    (name: "Peter ZAPFEL",            evidenz: "5AHMIA-24", subthema: "Integration des Versuchstandes in die bestehende Softwarelösung für die Kennlinien"),
    (name: "Otto BAUER",              evidenz: "5BHMIA-02", subthema: "Subthema D"),
    (name: "Elfriede NURNBERG-ATTACH",evidenz: "5BHMIA-20", subthema: "Subthema E"),
  ),

  lang:    "de",   // "de" oder "en"
  color:   true,   // true = farbiges Syntax-Highlighting; false = schwarz/weiß
  twoside: false,  // true = doppelseitig (für Druck)
)

// ═══════════════════════════════════════════════════════════════
// FRONTMATTER
// ═══════════════════════════════════════════════════════════════
// (Titelseite und Inhaltsverzeichnis werden automatisch vom Template erzeugt)

#include "chapters/vorwort.typ"
#include "chapters/kurzfassung.typ"
#include "chapters/abstract.typ"

// ═══════════════════════════════════════════════════════════════
// HAUPTTEIL (ab hier arabische Seitenzahlen ab 1)
// ═══════════════════════════════════════════════════════════════
#show: mainmatter()

#include "chapters/einleitung.typ"
#include "chapters/diplomschrift.typ"
#include "chapters/typst.typ"
#include "chapters/abbildungen.typ"
#include "chapters/mathematik.typ"
#include "chapters/literatur.typ"
#include "chapters/drucken.typ"
#include "chapters/schluss.typ"

// ── Dokumentationsformular (4 Seiten) ────────────────────────────────────
#include "chapters/dokumentation-daten.typ"

// ═══════════════════════════════════════════════════════════════
// ANHANG
// ═══════════════════════════════════════════════════════════════
#show: appendix-matter()

// #include "chapters/anhang_a.typ"  // Technische Ergänzungen (bei Bedarf)
#include "chapters/anhang_b.typ"
#include "chapters/anhang_c.typ"
#include "chapters/anhang_d.typ"

// ═══════════════════════════════════════════════════════════════
// ZUSATZDATEN
// ═══════════════════════════════════════════════════════════════

#print-glossary(glossary-entries)

#bibliography("literatur.bib", style: "ieee", title: "Literaturverzeichnis")
