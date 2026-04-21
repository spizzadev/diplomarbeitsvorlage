= Typst — Kurzanleitung
<typst-guide>

Dieses Kapitel erklärt die wichtigsten Typst-Konzepte, die beim Erstellen einer
Diplomarbeit benötigt werden. Die vollständige Dokumentation ist unter
`https://typst.app/docs` verfügbar.


== Installation und Kompilierung

=== Typst installieren

Unter Arch Linux / Manjaro:
```sh
sudo pacman -S typst
```
Unter anderen Systemen: Installer unter `https://github.com/typst/typst/releases` herunterladen.


=== Kompilieren

```sh
# Einmalig kompilieren
typst compile _Diplomarbeit.typ _Diplomarbeit.pdf

# Live-Vorschau (neu kompiliert bei jeder Änderung)
typst watch _Diplomarbeit.typ _Diplomarbeit.pdf
```

Ein einziger Kompiliervorgang genügt — kein Mehrfachkompilieren wie in LaTeX.


== Grundlegende Syntax

=== Text und Absätze

Normaler Text wird einfach geschrieben. Eine Leerzeile trennt Absätze.

```typst
Erster Absatz. Noch ein Satz.

Zweiter Absatz nach einer Leerzeile.
```

=== Hervorhebungen

```typst
_kursiv_          // kursiv (entspricht \emph{})
*fett*            // fett (entspricht \textbf{})
`Monospace`       // Code-Schrift (entspricht \texttt{})
```

Beispiel: _kursiv_, *fett*, `Monospace`


=== Überschriften

```typst
= Kapitel (Ebene 1)
== Abschnitt (Ebene 2)
=== Unterabschnitt (Ebene 3)
```

Die Nummerierung wird automatisch vom Template gesteuert.


=== Listen

*Aufzählungsliste:*
```typst
- Erster Punkt
- Zweiter Punkt
  - Eingerückter Unterpunkt
```

- Erster Punkt
- Zweiter Punkt
  - Eingerückter Unterpunkt

*Nummerierte Liste:*
```typst
+ Erster Schritt
+ Zweiter Schritt
+ Dritter Schritt
```

+ Erster Schritt
+ Zweiter Schritt
+ Dritter Schritt


=== Fußnoten

```typst
Das ist ein Text mit einer Fußnote.#footnote[Hier steht der Fußnotentext.]
```

Das ist ein Text mit einer Fußnote.#footnote[Inhalt der Fußnote, direkt im Text notiert.]


== Querverweise und Labels

=== Labels setzen

Labels werden mit `<label-name>` direkt nach einem Element gesetzt:

```typst
= Einleitung <cha-einleitung>

== Zielsetzung <sec-ziel>

#figure(image("images/htl.png"), caption: [Das HTL-Logo]) <fig-htl-logo>
```


=== Verweisen

```typst
Wie in @cha-einleitung beschrieben...
Siehe @fig-htl-logo für das Logo.
Mehr dazu in @sec-ziel.
```

Typst rendert automatisch "Kapitel 1", "Abbildung 1" usw. basierend auf dem Typ des
referenzierten Elements.


== Abbildungen

=== Einfache Abbildung

```typst
#figure(
  image("images/htl.jpeg", width: 50%),
  caption: [Das Logo der HTL Wiener Neustadt],
) <fig-htl>
```

#figure(
  image("images/htl.jpeg", width: 30%),
  caption: [Das Logo der HTL Wiener Neustadt],
) <fig-htl>


=== Subfiguren (mehrere Bilder nebeneinander)

```typst
#figure(
  grid(
    columns: 2,
    gutter: 1em,
    [
      #figure(image("images/ball-bearing-1.png", width: 100%), caption: [Variante A]) <fig-lager-a>
    ],
    [
      #figure(image("images/ball-bearing-2.png", width: 100%), caption: [Variante B]) <fig-lager-b>
    ],
  ),
  caption: [Zwei Varianten der Lagerung],
) <fig-lager>
```

=== Bildformate

Typst unterstützt nativ: *PNG*, *JPEG*, *GIF*, *SVG*, *WebP*.
Für Vektorgrafiken wird SVG empfohlen — bessere Qualität als rasterisierte Formate.
EPS-Dateien müssen vorher in PDF oder SVG konvertiert werden.


== Tabellen

```typst
#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, right),
    table.header([*Nr.*], [*Beschreibung*], [*Wert*]),
    [1], [Erster Eintrag],  [42],
    [2], [Zweiter Eintrag], [99],
    [3], [Dritter Eintrag], [7],
  ),
  caption: [Beispieltabelle],
) <tab-beispiel>
```

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, right),
    table.header([*Nr.*], [*Beschreibung*], [*Wert*]),
    [1], [Erster Eintrag],  [42],
    [2], [Zweiter Eintrag], [99],
    [3], [Dritter Eintrag], [7],
  ),
  caption: [Beispieltabelle],
) <tab-beispiel>


== Mathematik

=== Inline-Mathematik

Mathematische Ausdrücke werden mit `$...$` eingebettet:

```typst
Die Kreiszahl $pi approx 3.14159$.
Die Gleichung $E = m c^2$ ist bekannt.
```

Die Kreiszahl $pi approx 3.14159$.
Die Gleichung $E = m c^2$ ist bekannt.


=== Abgesetzte Gleichungen

```typst
$ sum_(i=1)^n i = (n(n+1))/2 $ <eq-summe>
```

$ sum_(i=1)^n i = (n(n+1))/2 $ <eq-summe>

Verweis im Text: @eq-summe zeigt die Gaußsche Summenformel.


== Code-Listings

=== Einfache Code-Blöcke

Code-Blöcke werden mit drei Backticks und der Sprache eingeleitet:

````typst
```java
public class Hallo {
    public static void main(String[] args) {
        System.out.println("Hallo Welt!");
    }
}
```
````

```java
public class Hallo {
    public static void main(String[] args) {
        System.out.println("Hallo Welt!");
    }
}
```

=== Code als nummerierte Abbildung

````typst
#figure(
  ```python
  def fakultaet(n):
      if n <= 1:
          return 1
      return n * fakultaet(n - 1)
  ```,
  caption: [Rekursive Fakultätsfunktion in Python],
) <lst-fakultaet>
````

_(Obiger Code erzeugt eine nummerierte Abbildung mit Caption und Label.)_

=== Unterstützte Sprachen

Typst unterstützt u. a.: `java`, `python`, `c`, `cpp`, `csharp`, `javascript`,
`typescript`, `html`, `xml`, `sql`, `bash`, `rust`, `go`, `kotlin`, `swift`.


== Literaturverweise

Literaturverweise werden mit `@schlüssel` gesetzt:

```typst
Wie in @Lamport94 beschrieben, ist LaTeX sehr mächtig.
Weitere Details finden sich in @BurgerBurge06 [Kap. 3].
```

Das vollständige Literaturverzeichnis wird automatisch am Ende des Dokuments eingefügt.
Die Einträge werden in der Datei `literatur.bib` verwaltet (BibTeX-Format).


== Sprache und Lokalisierung

=== Spracheinstellung

Die Hauptsprache wird beim Template-Aufruf gesetzt (`lang: "de"` oder `lang: "en"`).
Für einzelne Abschnitte in einer anderen Sprache:

```typst
#set text(lang: "en")
This paragraph is in English with correct hyphenation.
#set text(lang: "de")
```

=== Anführungszeichen

Typst setzt die richtigen Anführungszeichen automatisch basierend auf der Spracheinstellung:

```typst
"Anführungszeichen" // → „Anführungszeichen" (Deutsch)
```


== Nützliche Funktionen

=== Seitenumbruch

```typst
#pagebreak()
```

=== Abstand einfügen

```typst
#v(1cm)   // 1 cm vertikaler Abstand
#h(5mm)   // 5 mm horizontaler Abstand
```

=== URL einfügen

```typst
#link("https://typst.app")[Typst-Website]
// oder einfach:
https://typst.app
```

=== Trennlinie

```typst
#import "htldipl.typ": trennstrich
#trennstrich()
```
