// ── Dokumentationsformular ────────────────────────────────────────────────
// Diese Datei ausfüllen. Sie wird automatisch in die Diplomarbeit eingebunden
// (#include "chapters/dokumentation-daten.typ" in _Diplomarbeit.typ).
// Metadaten wie Titel, Schüler, Betreuer etc. kommen aus htldipl.with().

#import "../htldipl.typ": dokumentationsseite

#dokumentationsseite(
  jahrgang:  "5AHIF",
  title-en:  "Design of a Test Bench for Centrifugal Pumps",
  // kooperationspartner: "Firmenname GmbH",  // optional, sonst weglassen

  aufgabenstellung: [
    Hier steht die Aufgabenstellung der Diplomarbeit in einigen Sätzen.
    Was soll entwickelt, untersucht oder gebaut werden?
  ],
  aufgabenstellung-en: [
    This is the task description of the diploma thesis in a few sentences.
    What is to be developed, investigated or built?
  ],
  realisierung: [
    Kurze Beschreibung der gewählten Vorgehensweise und Umsetzung.
  ],
  realisierung-en: [
    Brief description of the chosen approach and implementation.
  ],
  ergebnisse: [
    Zusammenfassung der wichtigsten Ergebnisse und Erkenntnisse.
  ],
  ergebnisse-en: [
    Summary of the most important results and findings.
  ],

  // grafik:                 "images/meinbild.png",  // optional
  // grafik-beschreibung:    [Beschreibung des Bildes.],
  // grafik-beschreibung-en: [Description of the image.],
  // preis:                  [1. Preis beim Jugend Innovativ 2025],
)
