= Mathematische Elemente
<cha-mathematik>

Typst verfügt über ein sehr leistungsfähiges eingebautes Mathematik-System.
Die vollständige Referenz findet sich unter `https://typst.app/docs/reference/math/`.


== Inline-Mathematik

Mathematische Ausdrücke werden mit `$...$` eingebettet:

```typst
Der Satz des Pythagoras: $a^2 + b^2 = c^2$.
Die Kreiszahl ist $pi approx 3.14159$.
Die Euler-Formel: $e^(i pi) + 1 = 0$.
```

Der Satz des Pythagoras: $a^2 + b^2 = c^2$.
Die Kreiszahl ist $pi approx 3.14159$.
Die Euler-Formel: $e^(i pi) + 1 = 0$.


== Abgesetzte Gleichungen

Gleichungen auf einer eigenen Zeile (zentriert, mit Nummerierung):

```typst
$ a^2 + b^2 = c^2 $ <eq-pythagoras>
```

$ a^2 + b^2 = c^2 $ <eq-pythagoras>

Verweis: @eq-pythagoras zeigt den Satz des Pythagoras.

Ohne Nummerierung:
```typst
$ E = m c^2 $   // keine Nummerierung da kein Label
```

$ E = m c^2 $


== Grundlegende Syntax

=== Hoch- und Tiefstellung

```typst
$x^2$        // x²
$x_i$        // x mit Index i
$x^(2n)$     // Klammerung für längere Exponenten
$a_(i,j)$    // Matrix-Element
```

$x^2$, $x_i$, $x^(2n)$, $a_(i,j)$


=== Brüche

```typst
$(a+b)/(c+d)$     // Inline-Bruch
$frac(a+b, c+d)$  // großer Bruch (abgesetzt)
```

Inline: $(a+b)/(c+d)$

Abgesetzt:
$ frac(a+b, c+d) = frac(x, y) $


=== Wurzeln

```typst
$sqrt(x)$         // Quadratwurzel
$root(3, x)$      // dritte Wurzel
$root(n, x^2+y^2)$ // n-te Wurzel
```

$sqrt(x)$, $root(3, x)$, $root(n, x^2+y^2)$


=== Summen, Produkte, Integrale

```typst
$sum_(i=1)^n i^2$
$product_(k=0)^n k$
$integral_0^1 x^2 dif x$
$integral.double_A f(x,y) dif A$
```

$ sum_(i=1)^n i^2 = frac(n(n+1)(2n+1), 6) $

$ integral_0^1 x^2 dif x = 1/3 $


=== Matrizen und Vektoren

```typst
$mat(a, b; c, d)$          // 2×2 Matrix
$vec(x, y, z)$             // Spaltenvektor
$mat(1, 0, 0; 0, 1, 0; 0, 0, 1)$  // Einheitsmatrix
```

$ A = mat(a, b; c, d), quad bold(v) = vec(x, y, z) $


=== Griechische Buchstaben

```typst
$alpha, beta, gamma, delta, epsilon, zeta, eta, theta$
$iota, kappa, lambda, mu, nu, xi, pi, rho, sigma$
$tau, upsilon, phi, chi, psi, omega$
$Alpha, Beta, Gamma, Delta, ..., Omega$  // Großbuchstaben
```

$alpha, beta, gamma, delta, epsilon, zeta, eta, theta, iota, kappa, lambda, mu$


=== Mengenzeichen (Zahlenbereiche)

```typst
$RR$   // reelle Zahlen ℝ
$ZZ$   // ganze Zahlen ℤ
$NN$   // natürliche Zahlen ℕ
$CC$   // komplexe Zahlen ℂ
$QQ$   // rationale Zahlen ℚ
```

Die Menge der reellen Zahlen $RR$, ganze Zahlen $ZZ$, natürliche Zahlen $NN$.


=== Operatoren und Relationen

```typst
$a approx b$    // ≈
$a != b$        // ≠
$a <= b$        // ≤
$a >= b$        // ≥
$a in A$        // ∈
$a subset B$    // ⊂
$a times b$     // ×
$a dot b$       // ·
$a and b$       // ∧
$a or b$        // ∨
$not a$         // ¬
$forall x$      // ∀
$exists x$      // ∃
```


== Mehrere Gleichungen ausgerichtet

```typst
$
  f(x) &= (x+1)^2 \
        &= x^2 + 2x + 1
$
```

$
  f(x) &= (x+1)^2 \
        &= x^2 + 2x + 1
$


== Fallunterscheidungen

```typst
$ f(x) = cases(
  0 & "wenn " x < 0,
  x & "wenn " 0 <= x <= 1,
  1 & "wenn " x > 1,
) $
```

$ f(x) = cases(
  0 & "wenn " x < 0,
  x & "wenn " 0 <= x <= 1,
  1 & "wenn " x > 1,
) $


== Mathematik im Fließtext

Im Fließtext werden kurze Ausdrücke inline gesetzt: der Ausdruck $f(x) = sin(x)/x$
ist ein Beispiel. Bei langen Formeln sollte man die abgesetzte Form bevorzugen.

*Wichtig:* Variablen werden im Fließtext immer mathematisch gesetzt ($x$, $n$, $i$),
nicht als normaler Text (x, n, i).
