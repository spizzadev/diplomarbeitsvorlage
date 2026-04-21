// htldipl.typ
// Typst-Vorlage für Diplomarbeiten der HTL Wiener Neustadt
// Basierend auf htldipl.cls / htl.sty von Wolfgang Schermann (2018)
// Portiert auf Typst 0.14

// ── Farben (identisch mit htl.sty color-Option) ───────────────────────────
#let htl-green    = rgb(0, 153, 0)
#let htl-gray     = rgb(128, 128, 128)
#let htl-mauve    = rgb(148, 0, 130)
#let htl-maroon   = rgb(128, 0, 0)
#let htl-red      = rgb(204, 0, 0)
#let htl-darkblue = rgb(0, 0, 179)
#let htl-link-red = rgb(102, 38, 38)
#let htl-link-blue= rgb(0, 0, 128)

// ── Interner Zustand ──────────────────────────────────────────────────────
#let _section-state  = state("htl-section", "front")   // "front" | "main" | "appendix"
#let _heading-state  = state("htl-heading", "")         // tracks current chapter name

// ── Seitenzahlen-Anzeige (kontextabhängig) ────────────────────────────────
#let _page-display() = context counter(page).display()

// ── Kopfzeile: Kapitelname links, Seitenzahl rechts ──────────────────────
#let _make-header() = context {
  // Auf Seiten, auf denen ein Level-1-Heading beginnt, keine Kopfzeile (plain style)
  let loc = here()
  let cur = counter(page).at(loc)
  let h1s = query(heading.where(level: 1))
  let on-chapter-start = h1s.any(h => counter(page).at(h.location()) == cur)
  if on-chapter-start { return none }

  let heading-text = _heading-state.get()
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    text(font: "Noto Sans", size: 10pt, heading-text),
    text(font: "Noto Sans", size: 10pt, _page-display()),
  )
}

// ── Fußzeile: nur auf Kapitelanfangsseiten zentrierte Seitenzahl ──────────
#let _make-footer() = context {
  let loc = here()
  let cur = counter(page).at(loc)
  let h1s = query(heading.where(level: 1))
  let on-chapter-start = h1s.any(h => counter(page).at(h.location()) == cur)
  if not on-chapter-start { return none }
  align(center, text(font: "Noto Sans", size: 10pt, _page-display()))
}

// ── Titelseite ────────────────────────────────────────────────────────────
#let _title-page(
  title, abteilung, schwerpunkt,
  studienort, schule, schullogo, htllogo,
  abgabejahr, schueler, betreuer,
) = {
  set page(header: none, footer: none, numbering: none)
  set par(justify: false)

  // ── Kopfbereich: Logo | Schulname | HTL-Logo ──
  grid(
    columns: (30mm, 1fr, 30mm),
    align: (center + horizon, center + horizon, center + horizon),
    column-gutter: 4mm,
    rows: (22mm,),
    image(schullogo, width: 28mm),
    [
      #set align(center)
      #text(size: 14pt, weight: "bold", schule)
      #linebreak()
      #text(size: 10pt, [Höhere Lehranstalt für #abteilung])
      #if schwerpunkt != none [
        #linebreak()
        #text(size: 10pt, schwerpunkt)
      ]
    ],
    image(htllogo, width: 28mm),
  )

  line(length: 100%, stroke: 0.5pt)
  v(3mm)

  // ── DIPLOMARBEIT ──
  align(center,
    text(size: 26pt, weight: "bold", tracking: 6pt, [DIPLOMARBEIT])
  )
  v(3mm)

  // ── Titel ──
  align(center,
    text(size: 20pt, weight: "bold", hyphenate: false, title)
  )
  v(4mm)

  // ── Schüler-Tabelle ──
  text(size: 12pt, weight: "bold", [Ausgeführt im Schuljahr #abgabejahr von:])
  v(2mm)

  for s in schueler {
    // Subthema (volle Breite)
    block(width: 100%,
      text(size: 10pt, s.subthema)
    )
    // Name links, Evidenznummer rechts (mit 1cm Einrückung)
    grid(
      columns: (1cm, 1fr, auto),
      [],
      text(size: 10pt, s.name),
      text(size: 10pt, s.evidenz),
    )
    v(1.5mm)
  }

  v(1mm)

  // ── Betreuer ──
  text(size: 12pt, weight: "bold", [Betreuer / Betreuerin:])
  v(1mm)
  for b in betreuer {
    pad(left: 1cm, text(size: 10pt, b))
    v(0.5mm)
  }

  v(1fr)

  text(size: 12pt, [#studienort, am #datetime.today().display("[day]. [month repr:long] [year]")])
  v(3mm)
  line(length: 100%, stroke: 0.5pt)
  v(3mm)

  // ── Abgabevermerk ──
  grid(
    columns: (1fr, 1fr),
    [Abgabevermerk:],
    [Übernommen von:],
  )

  pagebreak()
}

// ── Eidesstattliche Erklärung ─────────────────────────────────────────────
#let _oath-page(studienort, schueler) = {
  heading(level: 1, numbering: none, [Eidesstattliche Erklärung])

  par[Hiermit erkläre ich an Eides statt, dass ich die vorliegende Arbeit
  selbst­ständig und ohne fremde Hilfe verfasst, andere als die angegebenen
  Quellen und Hilfsmittel nicht benutzt und die den benutzten Quellen wörtlich
  und inhaltlich entnommenen Stellen als solche erkenntlich gemacht habe.]

  v(8mm)
  text(studienort + ", am " + datetime.today().display("[day]. [month repr:long] [year]"))
  v(10mm)

  text(size: 12pt, weight: "bold", [Verfasser / Verfasserinnen:])
  v(3mm)

  // Unterschriftenfelder: 2 Spalten, bis zu 3 Zeilen
  let rows = ()
  let i = 0
  while i < schueler.len() {
    let left = schueler.at(i).name
    let right = if i + 1 < schueler.len() { schueler.at(i + 1).name } else { "" }
    rows.push((left, right))
    i = i + 2
  }

  for r in rows {
    grid(
      columns: (1fr, 1fr),
      column-gutter: 2cm,
      [
        #v(18mm)
        #line(length: 100%, stroke: 0.5pt)
        #text(size: 10pt, r.at(0))
      ],
      [
        #v(18mm)
        #if r.at(1) != "" {
          line(length: 100%, stroke: 0.5pt)
          text(size: 10pt, r.at(1))
        }
      ],
    )
    v(5mm)
  }

  pagebreak()
}

// ── Haupttemplate-Funktion ────────────────────────────────────────────────
#let htldipl(
  title:       "Titel der Diplomarbeit",
  abteilung:   "Abteilung??",
  schwerpunkt: none,
  studienort:  "Wiener Neustadt",
  schule:      "HTBLuVA Wiener Neustadt",
  schullogo:   "images/htl.jpeg",
  htllogo:     "images/htl_allgemein.jpg",
  abgabejahr:  "20XX/XX",
  betreuer:    (),
  schueler:    (),
  lang:        "de",
  color:       true,
  twoside:     false,
  body,
) = {

  // ── Globale Seiteneinstellungen ──
  set page(
    paper: "a4",
    margin: 3cm,
    header: _make-header(),
    footer: _make-footer(),
    numbering: "i",
  )

  // ── Typografie ──
  set text(
    size: 11pt,
    font: ("New Computer Modern",),
    lang: lang,
    region: if lang == "de" { "AT" } else { "US" },
  )
  set par(justify: true, leading: 0.65em)
  set heading(numbering: none)

  // ── Kapitel-Styling und Zustandsverwaltung (level 1) ──
  show heading.where(level: 1): it => {
    // Kapitelname für Kopfzeile aktualisieren
    _heading-state.update(context {
      let num = counter(heading).at(it.location())
      let s = _section-state.get()
      if s == "main" and num.at(0) >= 1 and it.numbering != none {
        str(num.at(0)) + ". " + it.body
      } else if s == "appendix" and it.numbering != none {
        numbering("A", num.first()) + ". " + it.body
      } else {
        it.body
      }
    })
    pagebreak(weak: true)
    v(2cm)
    // Im Haupt- und Anhangsteil: Präfixzeile "Kapitel N" / "Anhang A"
    context {
      let s = _section-state.get()
      let num = counter(heading).at(it.location()).first()
      if s == "main" and it.numbering != none {
        block(text(size: 14pt, weight: "bold", font: "Noto Sans", [Kapitel #num]))
        v(3mm)
      } else if s == "appendix" and it.numbering != none {
        block(text(size: 14pt, weight: "bold", font: "Noto Sans", [Anhang #numbering("A", num)]))
        v(3mm)
      }
    }
    block(text(size: 20pt, weight: "bold", it.body))
    v(0.8cm)
  }

  // ── Abschnitt-Styling (level 2) ──
  show heading.where(level: 2): it => {
    v(0.5cm)
    block(text(size: 14pt, weight: "bold", it))
    v(0.3cm)
  }

  // ── Unterabschnitt-Styling (level 3) ──
  show heading.where(level: 3): it => {
    v(0.3cm)
    block(text(size: 12pt, weight: "bold", it))
    v(0.2cm)
  }

  // ── Code-Blöcke ──
  show raw.where(block: true): it => {
    set text(size: 9pt, font: "DejaVu Sans Mono")
    block(
      width: 100%,
      fill: if color { luma(248) } else { white },
      stroke: 0.3pt + luma(200),
      radius: 2pt,
      inset: (left: 8mm, right: 4mm, top: 4mm, bottom: 4mm),
      it,
    )
  }

  show raw.where(block: false): it => {
    text(size: 9.5pt, font: "DejaVu Sans Mono", it)
  }

  // ── Hyperlinks ──
  show link: it => text(fill: htl-link-blue, it)

  // ── Abbildungs- und Tabellenbeschriftungen ──
  set figure.caption(separator: [: ])
  show figure.caption: it => text(size: 10pt, it)

  // ── Listen-Abstände ──
  set list(spacing: 0.4em)
  set enum(spacing: 0.4em)

  // ── Mathematik ──
  set math.equation(numbering: "(1)")

  // ── Titelseite & Eidesstattliche Erklärung ──
  _title-page(
    title, abteilung, schwerpunkt,
    studienort, schule, schullogo, htllogo,
    abgabejahr, schueler, betreuer,
  )
  _oath-page(studienort, schueler)

  // ── Inhaltsverzeichnis ──
  {
    show outline.entry.where(level: 1): it => {
      v(4pt, weak: true)
      strong(it)
    }
    outline(title: if lang == "de" { [Inhaltsverzeichnis] } else { [Table of Contents] }, depth: 3, indent: 1.5em)
  }

  body
}

// ── Übergang zum Hauptteil ────────────────────────────────────────────────
// Verwendung: #show: mainmatter()
#let mainmatter() = body => {
  _section-state.update("main")
  counter(page).update(1)
  counter(heading).update(0)
  set page(numbering: "1")
  set heading(numbering: "1.1")
  pagebreak()
  body
}

// ── Übergang zum Anhang ───────────────────────────────────────────────────
// Verwendung: #show: appendix-matter()
#let appendix-matter() = body => {
  _section-state.update("appendix")
  counter(heading).update(0)
  set heading(numbering: "A.1")
  pagebreak()
  body
}

// ── Hilfsfunktionen für Inhaltsdateien ───────────────────────────────────

// Kurzfassung / Abstract-Umgebung (max 1 Seite, kein Seitenumbruch danach)
#let kurzfassung(body) = {
  heading(level: 1, numbering: none, [Kurzfassung])
  body
}

#let abstract-en(body) = {
  heading(level: 1, numbering: none, [Abstract])
  body
}

// Glossar
#let print-glossary(entries) = {
  heading(level: 1, numbering: none,
    context if text.lang == "de" { [Glossar] } else { [Glossary] }
  )
  for (term, desc) in entries {
    grid(
      columns: (3cm, 1fr),
      gutter: 0.5em,
      strong(term),
      desc,
    )
    v(0.3em)
  }
}

// Trennlinie (entspricht \trennstrich)
#let trennstrich() = {
  v(1em)
  align(center, line(length: 4cm, stroke: 0.4pt))
  v(1.5em)
}

// Eingerahmter Text (entspricht \Frametext)
#let frametext(content) = box(
  stroke: 0.3pt,
  inset: (x: 1mm, y: 0.5mm),
  content,
)
