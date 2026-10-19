= Inhalt der CD-ROM/DVD
<app-cdrom>

*Format:* CD-ROM, Single Layer, ISO 9660
(Bei DVDs entsprechend eine andere Spezifikation verwenden.)


== PDF-Dateien

Pfad: `/`

#table(
  columns: (auto, 1fr),
  stroke: none,
  [`_Diplomarbeit.pdf`], [Diplomarbeit (Gesamtdokument)],
)


== Typst-Quelldateien

*Hinweis:* Die folgende Auflistung soll nur den Gebrauch dieser Vorlage erleichtern.
Bei einer Diplomarbeit ist es i. A. _nicht_ notwendig, die zugehörigen Typst-Dateien
aufzulisten — wohl aber projektbezogene Dateien, Ergebnisse, Bilder, Kopien von
Online-Literatur usw.

Pfad: `/`

#table(
  columns: (auto, 1fr),
  stroke: none,
  [`_Diplomarbeit.typ`], [Hauptdokument],
  [`htldipl.typ`],       [Template-Modul],
  [`literatur.bib`],     [Literatur-Datenbank (BibTeX)],
  [`chapters/vorwort.typ`],       [Vorwort],
  [`chapters/kurzfassung.typ`],   [Kurzfassung],
  [`chapters/abstract.typ`],      [Abstract],
  [`chapters/einleitung.typ`],    [@intro],
  [`chapters/diplomschrift.typ`], [@cha-diplomschrift],
  [`chapters/typst.typ`],         [@typst-guide],
  [`chapters/abbildungen.typ`],   [@cha-abbildungen],
  [`chapters/mathematik.typ`],    [@cha-mathematik],
  [`chapters/literatur.typ`],     [@cha-literatur],
  [`chapters/drucken.typ`],       [@cha-drucken],
  [`chapters/schluss.typ`],       [@cha-schluss],
  [`chapters/anhang_b.typ`],      [@app-cdrom],
  [`chapters/anhang_c.typ`],      [@app-changes],
  [`chapters/anhang_d.typ`],      [@app-source],
)


== Bilder und Grafiken

Pfad: `/images/`

#table(
  columns: (auto, 1fr),
  stroke: none,
  [`*.png`],  [Rasterbilder im PNG-Format],
  [`*.jpg`],  [Rasterbilder im JPEG-Format],
  [`*.svg`],  [Vektorgrafiken im SVG-Format],
)
