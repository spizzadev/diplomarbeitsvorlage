= Abbildungen, Tabellen und Code
<cha-abbildungen>

== Abbildungen

Abbildungen (Bilder, Grafiken, Diagramme) werden mit `#figure(image(...))` eingebunden
und müssen immer mit einer erklärenden Beschriftung (_Caption_) versehen sein.


=== Einbinden von Bilddateien

```typst
#figure(
  image("images/htl.jpeg", width: 75%),
  caption: [Logo der HTL Wiener Neustadt.],
) <fig-htl-logo>
```

#figure(
  image("images/htl.jpeg", width: 40%),
  caption: [Logo der HTL Wiener Neustadt.],
) <fig-htl-logo>

Unterstützte Formate: *PNG*, *JPEG*, *SVG*, *GIF*, *WebP*.
Vektorgrafiken (SVG) sind Rasterbildern vorzuziehen.


=== Bildgröße

Die Breite wird als Prozentwert der Textbreite oder als absolutes Maß angegeben:

```typst
image("bild.png", width: 50%)    // 50 % der Textbreite
image("bild.png", width: 8cm)    // 8 cm absolut
image("bild.png", height: 4cm)   // Höhe fixieren
```


=== Positionierung

Typst platziert Abbildungen standardmäßig dort, wo sie im Quelltext stehen.
Für ein Float-ähnliches Verhalten (Abbildung oben/unten auf der Seite):

```typst
#figure(
  image("bild.png"),
  caption: [Beschriftung],
  placement: top,   // top, bottom oder auto
)
```


=== Zwei Bilder nebeneinander (Subfiguren)

```typst
#figure(
  grid(
    columns: 2,
    gutter: 1cm,
    figure(image("images/ball-bearing-1.png"), caption: [Overhang]) <fig-sub-a>,
    figure(image("images/ball-bearing-2.png"), caption: [Straddle]) <fig-sub-b>,
  ),
  caption: [Zwei Lagerungsarten im Vergleich.],
) <fig-lagerungen>
```

#figure(
  grid(
    columns: 2,
    gutter: 1cm,
    figure(image("images/ball-bearing-1.png", width: 100%), caption: [Overhang]),
    figure(image("images/ball-bearing-2.png", width: 100%), caption: [Straddle]),
  ),
  caption: [Zwei Lagerungsarten im Vergleich.],
) <fig-lagerungen>


=== Querverweise auf Abbildungen

```typst
Wie in @fig-htl-logo zu sehen, ...
Abbildung @fig-lagerungen zeigt zwei Varianten.
```

_Wichtig:_ Jede Abbildung muss im Fließtext referenziert werden!


== Tabellen

Tabellen werden mit `#table(...)` erstellt und sollten immer mit `#figure(...)` und
einer Caption versehen sein.

=== Einfache Tabelle

```typst
#figure(
  table(
    columns: 3,
    table.header([*Spalte A*], [*Spalte B*], [*Spalte C*]),
    [Wert 1], [Wert 2], [Wert 3],
    [Wert 4], [Wert 5], [Wert 6],
  ),
  caption: [Beispiel einer einfachen Tabelle.],
) <tab-einfach>
```

#figure(
  table(
    columns: 3,
    table.header([*Spalte A*], [*Spalte B*], [*Spalte C*]),
    [Wert 1], [Wert 2], [Wert 3],
    [Wert 4], [Wert 5], [Wert 6],
  ),
  caption: [Beispiel einer einfachen Tabelle.],
) <tab-einfach>


=== Spaltenbreiten und Ausrichtung

```typst
table(
  columns: (2cm, 1fr, auto),     // feste Breite, flex, automatisch
  align: (left, left, right),    // Ausrichtung je Spalte
  ...
)
```


=== Tabelle ohne äußere Rahmenlinien

```typst
table(
  stroke: (x, y) => if y == 0 { (bottom: 0.5pt) } else { none },
  ...
)
```


== Code-Listings

Code-Blöcke werden in Typst mit Backtick-Zäunen geschrieben.

=== Inline-Code

```typst
Die Funktion `printf()` gibt Text aus.
```

Die Funktion `printf()` gibt Text aus.


=== Block-Code

````typst
```c
#include <stdio.h>

int main(void) {
    printf("Hallo Welt!\n");
    return 0;
}
```
````

```c
#include <stdio.h>

int main(void) {
    printf("Hallo Welt!\n");
    return 0;
}
```


=== Code als nummerierte Abbildung mit Caption

```typst
#figure(
  ```java
  public class Beispiel {
      public static void main(String[] args) {
          System.out.println("Typst ist toll!");
      }
  }
  ```,
  caption: [Einfaches Java-Programm.],
) <lst-java>
```

#figure(
  ```java
  public class Beispiel {
      public static void main(String[] args) {
          System.out.println("Typst ist toll!");
      }
  }
  ```,
  caption: [Einfaches Java-Programm.],
) <lst-java>


=== Abbildungsverzeichnis und Tabellenverzeichnis

Falls ein Abbildungs- oder Tabellenverzeichnis gewünscht ist, kann es mit folgenden
Befehlen eingefügt werden (z. B. im Frontmatter, nach dem Inhaltsverzeichnis):

```typst
#outline(title: [Abbildungsverzeichnis], target: figure.where(kind: image))
#outline(title: [Tabellenverzeichnis], target: figure.where(kind: table))
```
