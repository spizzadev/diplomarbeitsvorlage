= Chronologische Liste der Änderungen

/ 2026/04: Dokumentationsformular in Typst nachgebaut.
  - `dokumentationsseite()` in `htldipl.typ` erzeugt das offizielle 4-seitige Formular direkt in Typst (kein PDF-Merge mehr notwendig)
  - Formular-Daten werden in `chapters/dokumentation-daten.typ` ausgefüllt, nicht in `_Diplomarbeit.typ`
  - Gemeinsame Metadaten (Titel, Schüler, Betreuer, …) werden über `_htl-meta`-State aus `htldipl.with()` weitergegeben

/ 2024/04: Portierung der LaTeX-Vorlage auf Typst 0.14.
  - Vollständige Neuerstellung als Typst-Template (`htldipl.typ`)
  - Alle Kapitel von LaTeX nach Typst konvertiert
  - `typst.typ` ersetzt `latex.tex` als Anleitung für das Satzsystem
  - Fehler aus der LaTeX-Vorlage behoben (Betreuer D fehlte, leere Schülerfelder)

/ 2024/03/19: Zurück zum numerischen Zitierstiel und Entfernen der Indizes (LaTeX-Version).

/ 2018/07/02: Überarbeitung für das Schuljahr 2018/19 (LaTeX-Version).
  - Indizierung der Literatur nach Titel und Autor
  - Allgemeiner Index für eigene Begriffe
  - Software überarbeitet und auf den neuesten Stand gebracht
  - Umstieg von biblatex auf biber
  - Subfigure hinzugefügt
  - Settings aus `_Diplomarbeit.tex` ausgelagert

/ 2017/04/03: FAQ hinzugefügt.

/ 2017/03/28: Anpassungen an sehr lange URLs in den Fußnoten.

/ 2017/03/21: Anpassungen an sehr lange Titel und Untertitel.

/ 2016/10/20: Neues Zitierformat (footcite).

/ 2016/04/04: Umlaute in Code-Listings möglich.

/ 2015/10/11: Dokumentationsseiten aus PDF-Formular.

/ 2015/10/07: Umstieg von listings2 auf listingsutf8.

/ 2015/10/06: Syntax-Highlighting umschaltbar zwischen Farbe und Schwarz/Weiß.

/ 2015/09/29: Neues Deckblatt.

/ 2015/09/03: Einseitig/Zweiseitig umschaltbar.

/ 2012/08/29: Einstellbare Seitenränder durch das geometry-Paket.

/ 2010/11/22: Überarbeitung der originalen Vorlagen von Dr. Wilhelm Burger und Anpassung
  an die Bedürfnisse einer HTL.
  - Wechsel auf UTF-8
  - Neue Code-Umgebungen für Python und C\#
  - Vorlagen für Normen und Patente im Literaturverzeichnis
