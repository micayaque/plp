Dadas las funciones `altura` y `cantNodos` definidas en la práctica $1$ para árboles binarios, demostrar la
siguiente propiedad:

```hs
data AB a = Nil | Bin (AB a) a (AB a)
```
```hs
altura :: AB a -> Integer
altura  = foldAB (\r rec_i rec_d -> 1 + max rec_i rec_d) 0
```

```hs
cantNodos :: AB a -> Integer
cantNodos = foldAB (\r rec_i rec_d -> 1 + rec_i + rec_d) 0
```

$\textcolor{pink}{∀ x::AB\ a .\ altura\ x ≤ cantNodos\ x}$

Uso inducción estructural sobre el árbol $x$.

Caso base: $x = Nil$

$altura\ Nil \leq cantNodos Nil $

$foldAB\ (\backslash r\ rec_i\ rec_d \rightarrow 1 + max\ rec_i\ rec_d)\ 0\ Nil \leq foldAB\ (\backslash r\ rec_i\ rec_d\ \rightarrow 1 + rec_i + rec_d)\ 0\ Nil $

Por la definición de $foldAB$:

```hs
foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB cBin cNil Nil = cNil
foldAB cBin cNil (Bin i r d) = cBin r (rec i) (rec d)
        where rec = foldAB cBin cNil
```

$0 \leq 0$

Por lo tanto, vale el caso base.

Caso inductivo: $x = Bin\ i\ r\ d$

Hipótesis inductiva: $altura\ i \leq cantNodos\ i$ y $altura\ d \leq cantNodos\ d$

Queremos ver que $altura\ (Bin\ i\ r\ d) \leq cantNodos\ (Bin\ i\ r\ d)$

$foldAB\ (\backslash r\ rec_i\ rec_d \rightarrow 1 + max\ rec_i\ rec_d)\ 0\ (Bin\ i\ r\ d) \leq foldAB\ (\backslash r\ rec_i\ rec_d\ \rightarrow 1 + rec_i + rec_d)\ 0\ (Bin\ i\ r\ d)$

Por la definición de $foldAB$:

$ 1 + max(foldAB\ (\backslash r\ rec_i\ rec_d \rightarrow 1 + max\ rec_i\ rec_d)\ 0\ i, foldAB\ (\backslash r\ rec_i\ rec_d \rightarrow 1 + max\ rec_i\ rec_d)\ 0\ d)  \leq foldAB\ (\backslash r\ rec_i\ rec_d\ \rightarrow 1 + rec_i + rec_d)\ 0\ (Bin\ i\ r\ d)$

$ 1 + max(altura\ i, altura\ d)  \leq foldAB\ (\backslash r\ rec_i\ rec_d\ \rightarrow 1 + rec_i + rec_d)\ 0\ (Bin\ i\ r\ d)$

$ 1 + max(altura\ i, altura\ d)  \leq 1 + foldAB\ (\backslash r\ rec_i\ rec_d\ \rightarrow 1 + rec_i + rec_d)\ 0\ i\ + foldAB\ (\backslash r\ rec_i\ rec_d\ \rightarrow 1 + rec_i + rec_d)\ 0\ d$

$ 1 + max(altura\ i, altura\ d)  \leq 1 + cantNodos\ i + cantNodos\ d$

$ max(altura\ i, altura\ d)  \leq cantNodos\ i + cantNodos\ d$

Por extencionalidad de booleanos para max tenemos dos casos posibles:

$\textcolor{lime}{max(altura\ i, altura\ d) = altura\ d}$

$ altura\ d  \leq cantNodos\ i + cantNodos\ d$

En este caso sabemos por HI que $altura\ d \leq cantNodos\ d$ y por lo tanto $altura\ d \leq cantNodos\ i + cantNodos\ d$ porque $cantNodos\ i \geq 0$

$\textcolor{lime}{max(altura\ i, altura\ d) = altura\ i}$

$ altura\ i  \leq cantNodos\ i + cantNodos\ d$

En este caso sabemos por HI que $altura\ i \leq cantNodos\ i$ y por lo tanto $altura\ i \leq cantNodos\ i + cantNodos\ d$ porque $cantNodos\ d \geq 0$

Por lo tanto, en ambos casos vale la propiedad.