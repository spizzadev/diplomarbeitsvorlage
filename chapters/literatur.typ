= Literaturverweise
<cha-literatur>

Das korrekte Zitieren von Quellen ist ein wesentlicher Bestandteil jeder
wissenschaftlichen Arbeit. Literaturverweise verhindern Plagiate und ermöglichen
es dem Leser, die verwendeten Quellen selbst nachzuschlagen.


== BibTeX-Datenbank

Alle Literaturquellen werden in der Datei `literatur.bib` gespeichert.
Typst liest diese Datei nativ — kein separates Biber oder BibTeX nötig.

Ein typischer Eintrag in `literatur.bib`:

```bibtex
@book{Lamport94,
    author    = {Lamport, Leslie},
    title     = {{LaTeX}: A Document Preparation System},
    publisher = {Addison-Wesley},
    address   = {Reading, MA},
    year      = {1994},
    edition   = {2},
}

@article{Bhanu91a,
    author  = {Bhanu, Bir and Faugeras, Olivier D.},
    title   = {Shape Matching of Two-Dimensional Objects},
    journal = {IEEE Transactions on Pattern Analysis and Machine Intelligence},
    year    = {1984},
    volume  = {6},
    number  = {2},
    pages   = {137--156},
}
```


== Quellentypen

Die wichtigsten BibTeX-Eintragstypen:

#table(
  columns: (auto, 1fr),
  table.header([*Typ*], [*Verwendung*]),
  [`@book`],          [Bücher],
  [`@article`],       [Zeitschriftenartikel],
  [`@inproceedings`], [Konferenz-Beiträge],
  [`@techreport`],    [Technische Berichte],
  [`@mastersthesis`], [Masterarbeiten],
  [`@phdthesis`],     [Dissertationen],
  [`@manual`],        [Handbücher, Dokumentationen],
  [`@misc`],          [Diverses (Online-Quellen, Normen, Patente)],
)


== Zitieren im Text

Literaturverweise werden mit `@schlüssel` gesetzt:

```typst
Wie in @Lamport94 beschrieben ...
Der Algorithmus aus @Burger92 [Kap. 3] ...
Mehrere Quellen gleichzeitig @Lamport94 @BurgerBurge06 ...
```

Wie in @Lamport94 beschrieben, ist LaTeX ein mächtiges Werkzeug.


== Stil des Literaturverzeichnisses

In `_Diplomarbeit.typ` wird das Literaturverzeichnis mit folgendem Befehl erzeugt:

```typst
#bibliography("literatur.bib", style: "ieee", title: "Literaturverzeichnis")
```

Der Stil `"ieee"` erzeugt numerische Verweise ([1], [2], ...) entsprechend dem
IEEE-Standard. Weitere verfügbare Stile: `"apa"`, `"chicago-author-date"`, `"mla"`,
`"springer-mathphys"`.


== Online-Quellen

Online-Quellen werden als `@misc` eingetragen:

```bibtex
@misc{TypstDocs,
    author       = {{Typst GmbH}},
    title        = {Typst Documentation},
    howpublished = {\url{https://typst.app/docs}},
    year         = {2024},
    note         = {Abgerufen am 01.01.2024},
}
```

*Wichtig bei Online-Quellen:* Das Abrufdatum (_Abgerufen am_) muss immer angegeben
werden, da Websites ihren Inhalt ändern können.


== Plagiarismus

Das Übernehmen fremder Texte, Ideen oder Abbildungen ohne Quellenangabe ist
_Plagiat_ und kann zum Nicht-Bestehen der Diplomarbeit führen.

Folgende Regeln gelten:

- Wörtliche Übernahmen müssen als Zitat gekennzeichnet werden (Anführungszeichen + Quelle).
- Paraphrasierungen (inhaltliche Übernahme in eigenen Worten) benötigen ebenfalls eine Quelle.
- Abbildungen aus fremden Quellen müssen in der Caption referenziert werden.
- Eigene frühere Arbeiten müssen ebenfalls zitiert werden (Selbstplagiat).

*Faustregel:* Wenn der Gedanke nicht selbst entwickelt wurde, gehört eine Quelle dazu.
