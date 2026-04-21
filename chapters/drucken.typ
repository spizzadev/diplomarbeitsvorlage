= Drucken der Diplomarbeit
<cha-drucken>


== PDF-Workflow

Typst erzeugt direkt PDF-Dokumente in einem einzigen Kompiliervorgang:

```sh
typst compile _Diplomarbeit.typ _Diplomarbeit.pdf
```

Es sind keine Zwischenformate (DVI, PS) erforderlich. Das erzeugte PDF entspricht
dem PDF/A-Standard und ist für den Druck optimiert.


== Drucken

=== Drucker und Papier

Die Diplomarbeit sollte in der Endfassung unbedingt auf einem qualitativ hochwertigen
Laserdrucker ausgedruckt werden. Ausdrucke mit Tintenstrahldruckern sind _nicht_
ausreichend. Auch das verwendete Papier sollte von guter Qualität (holzfrei) und
üblicher Stärke (mind. $80 upright("g")/upright("m")^2$) sein.

Falls _farbige_ Seiten notwendig sind, sollten diese einzeln auf einem Farb-Laserdrucker
ausgedruckt werden und dem Dokument beigefügt werden.

*Alle* abzugebenden Exemplare müssen *gedruckt* (und nicht kopiert) werden! Die Kosten
für den Druck sind heute nicht höher als die für Kopien, der Qualitätsunterschied ist
jedoch — vor allem bei Bildern und Grafiken — meist deutlich.


=== Druckgröße

Ein häufiger Fehler beim Ausdrucken von PDF-Dokumenten wird durch die versehentliche
Einstellung "Fit to page" im Druckmenü verursacht. Dadurch werden die Seiten meist
zu klein ausgedruckt.

*Kontrolle:* Das Papierformat muss A4 (210 × 297 mm) sein. Überprüfen Sie dies in
den Druckeinstellungen und stellen Sie sicher, dass keine Skalierung aktiv ist
(Einstellung: "Tatsächliche Größe" oder "100 %").

Das Template setzt das Papierformat automatisch auf A4. Das erzeugte PDF hat
immer genau A4-Größe.


== Binden

Die Endfassung der Diplomarbeit ist in fest gebundener Form einzureichen. Dabei ist
eine Bindung zu verwenden, die das Ausfallen von einzelnen Seiten nachhaltig verhindert,
z. B. durch eine traditionelle Rückenbindung (Buchbinder) oder durch handelsübliche
Klammerungen aus Kunststoff oder Metall. Eine einfache Leimbindung ohne Verstärkung
ist jedenfalls _nicht_ ausreichend.

Falls man die Arbeit bei einem professionellen Buchbinder durchführen lässt, sollte man
auch auf die Prägung am Buchrücken achten. Üblich ist dabei die Angabe des Familiennamens
des Autors und des Titels der Arbeit:

#align(center,
  box(stroke: 0.5pt, inset: 4mm,
    smallcaps([Schlaumeier · Parz. Lösungen zur allg. Problematik])
  )
)


== Elektronische Datenträger (CD-R, DVD)

Bei Arbeiten im Bereich der Informationstechnik fallen fast immer Informationen an,
wie Programme, Daten, Grafiken, Kopien von Internetseiten usw., die elektronisch
verfügbar sein sollten. Vernünftigerweise wird man diese Daten der fertigen Arbeit auf
einer CD-ROM oder DVD beilegen.

Falls ein elektronischer Datenträger beigelegt wird, ist Folgendes zu beachten:

+ Jedem abzugebenden Exemplar muss eine identische Kopie des Datenträgers beiliegen.
+ Verwenden Sie qualitativ hochwertige Rohlinge und überprüfen Sie nach der
  Fertigstellung die tatsächlich gespeicherten Inhalte!
+ Der Datenträger sollte in eine im hinteren Umschlag eingeklebte Hülle eingefügt sein
  und so zu entnehmen sein, dass die Hülle dabei _nicht_ zerstört wird.
+ Der Datenträger muss so beschriftet sein, dass er der Diplomarbeit eindeutig
  zuzuordnen ist — am besten durch ein gedrucktes Label.
+ Nützlich ist auch ein grobes Verzeichnis der Inhalte des Datenträgers (wie in Anhang B).
