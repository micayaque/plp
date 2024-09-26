Indicar si las siguientes propiedades son verdaderas o falsas. Si son verdaderas, realizar una demostración. Si
son falsas, presentar un contraejemplo.

$i.\ Eq\ a \Rightarrow ∀ xs::[a] .\ \forall e::a .\ \forall p::a \rightarrow Bool .\ elem\ e\ xs\ \land p\ e = elem\ e\ (filter\ p\ xs)$
---

Esta propiedad es verdadera, la podemos demostrar usando inducción estructural sobre la lista $xs$.

Por el principio de extensionalidad de funciones basta ver que para toda $xs::[a]$, $e::a$ y $p::(a \rightarrow Bool)$ se cumple que $elem\ e\ xs\ \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$.

$P(xs): elem\ e\ xs\ \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$

- Caso base $xs = []$:

$elem\ e\ []\ \&\&\ p\ e = elem\ e\ (filter\ p\ [])$

Por la definición de $elem$ y $filter$:

$False\ \&\&\ p\ e = elem\ e\ []$

$False = False$

- Caso inductivo $xs = x:xs$:

Asumimos verdadera $P(xs)$

$elem\ e\ (x:xs)\ \&\&\ p\ e = elem\ e\ (filter\ p\ (x:xs))$

Por la definición de $elem$ y $filter$:

$(e = x\ ||\ elem\ e\ xs) \&\&\ p\ e = elem\ e\ (if\ p\ x\ then\ x:(filter\ p\ xs)\ else\ filter\ p\ xs)$

Extensionalidad de booleanos:

Por $if\ p\ x\ then\ x:(filter\ p\ xs)\ else\ filter\ p\ xs$, tenemos dos casos:

$\textcolor{orange}{p\ x = True}$

$(e = x\ ||\ elem\ e\ xs) \&\&\ p\ e = elem\ e\ (x:(filter\ p\ xs))$

Por la definición de $elem$ y $filter$:

$(e = x\ ||\ elem\ e\ xs) \&\&\ p\ e = (e = x\ ||\ elem\ e\ (filter\ p\ xs))$

Y de nuevo por extensionalidad de booleanos tenemos otros dos casos:

$\textcolor{lime}{e = x}$

$(True ||\ elem\ e\ xs) \&\&\ p\ e = (True ||\ elem\ e\ (filter\ p\ xs))$

$True\ \&\&\ p\ e = True$

Y sabemos que en este caso $p\ x = True$ y $e=x$, por lo que

$True\ \&\&\ p\ x = True$

$True\ \&\&\ True = True$

$True= True$ 

Y vale la propiedad en este caso.

$\textcolor{lime}{e \neq x}$

$(False ||\ elem\ e\ xs) \&\&\ p\ e = (False ||\ elem\ e\ (filter\ p\ xs))$

$(elem\ e\ xs) \&\&\ p\ e = (elem\ e\ (filter\ p\ xs))$

Que vale por `hipótesis inductiva`.

$\textcolor{orange}{p\ x = False}$

$(e = x\ ||\ elem\ e\ xs) \&\&\ p\ e = elem\ e\ (if\ p\ x\ then\ x:(filter\ p\ xs)\ else\ filter\ p\ xs)$

$(e = x\ ||\ elem\ e\ xs) \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$

De nuevo por extensionalidad de booleanos tenemos dos casos:

$\textcolor{lime}{e = x}$

$(True ||\ elem\ e\ xs) \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$

$True\ \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$

Como sabemos que en este caso $p\ x = False$ y $e=x$, entonces

$True\ \&\&\ p\ x = elem\ x\ (filter\ p\ xs)$

$True\ \&\&\ False = elem\ x\ (filter\ p\ xs)$

$False = elem\ x\ (filter\ p\ xs)$

Y sabemos también que $x$ no va a estar en el resultado de `filter p xs` porque $p\ x = False$, por lo que

$False = False$

Y vale la propiedad en este caso.

$\textcolor{lime}{e \neq x}$

$(False\ ||\ elem\ e\ xs) \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$

$(elem\ e\ xs) \&\&\ p\ e = elem\ e\ (filter\ p\ xs)$

Que vale por `hipótesis inductiva`.

Probamos la propiedad para todos los casos y por lo tanto vale para toda lista $xs$.

---

### $\textcolor{pink}{ii.\ Eq\ a \Rightarrow ∀ xs::[a] .\ ∀ e::a .\ elem\ e\ xs = elem\ e\ (nub\ xs)}$

```hs
nub :: Eq a => [a] -> [a]
{N0} nub [] = []
{N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)
```

Inducción estructural sobre $xs$.

$P(xs): elem\ e\ xs = elem\ e\ (nub\ xs)$

- Caso base $xs = []$:

$elem\ e\ [] = elem\ e\ (nub\ [])$

Por la definición de $nub$:

$False = elem\ e\ []$

$False = False$

- Caso inductivo $xs = x:xs$:

Asumimos verdadera $P(xs)$

$elem\ e\ (x:xs) = elem\ e\ (nub\ (x:xs))$

Por la definición de $nub$:

$elem\ e\ (x:xs) = elem\ e\ (x : filter (\backslash y \rightarrow x \neq y) (nub\ xs))$

Por la definición de $elem$:

$(e = x\ ||\ elem\ e\ xs )=(e=x\ ||\ elem\ e\ (filter (\backslash y \rightarrow x \neq y) (nub\ xs)))$

Por extensionalidad de booleanos $e=x$ puede ser $True$ o $False$.

$\textcolor{lime}{e = x}$

$(True ||\ elem\ e\ xs )=(True ||\ elem\ e\ (filter (\backslash y \rightarrow x \neq y) (nub\ xs)))$

$True = True$

$\textcolor{lime}{e \neq x}$

$(False ||\ elem\ e\ xs )=(False ||\ elem\ e\ (filter (\backslash y \rightarrow x \neq y) (nub\ xs)))$

$elem\ e\ xs = elem\ e\ (filter (\backslash y \rightarrow x \neq y) (nub\ xs))$

Por la definición de `nub`:

$elem\ e\ xs = elem\ e\ (nub\ xs)$

Y esto vale por `hipótesis inductiva`.

Probamos la propiedad para todos los casos y por lo tanto vale para toda lista $xs$.

---

### $\textcolor{pink}{iii.\ Eq\ a \Rightarrow ∀ xs::[a] .\ ∀ ys::[a] .\ ∀ e::a .\ elem\ e\ (union\ xs\ ys) = (elem\ e\ xs)\ ||\ (elem\ e\ ys)}$

Inducción estructural sobre $xs$.

$P(xs): elem\ e\ (union\ xs\ ys) = (elem\ e\ xs)\ ||\ (elem\ e\ ys)$

- Caso base $xs = []$:

$elem\ e\ (union\ []\ ys) = (elem\ e\ [])\ ||\ (elem\ e\ ys)$

Por la definición de `union`:

```hs
union :: Eq a => [a] -> [a] -> [a]
{U0} union xs ys = nub (xs++ys)
```

$elem\ e\ (nub ([]++ys)) = (elem\ e\ [])\ ||\ (elem\ e\ ys)$

Por definición de `++` y `elem`:

$elem\ e\ (nub\ ys) = False\ ||\ (elem\ e\ ys)$

Y esto vale por lo probado en el punto anterior ($ii.$).

- Caso inductivo $xs = x:xs$:

Asumimos verdadera $P(xs)$

$elem\ e\ (union\ (x:xs)\ ys) = (elem\ e\ (x:xs))\ ||\ (elem\ e\ ys)$

Por la definición de `union` y `elem`:

$elem\ e\ (nub ((x:xs)++ys)) = e=x\ ||\ elem\ e\ xs\ ||\ elem\ e\ ys$

Por la definición de `nub`:

 x : filter (\y -> x /= y) (nub xs)

 $elem\ e\ (x : filter\ (\backslash y \rightarrow x \neq y)\ (nub\ xs++ys) = (e=x\ ||\ elem\ e\ xs\ ||\ elem\ e\ ys)$

Por la definición de `elem`:

$(e = x\ ||\ elem\ e\ (filter\ (\backslash y \rightarrow x \neq y)\ (nub\ xs++ys)) = (e=x\ ||\ elem\ e\ xs\ ||\ elem\ e\ ys)$

Por definición de `nub`

$(e = x\ ||\ elem\ e\ (nub\ xs++ys)) = (e=x\ ||\ elem\ e\ xs\ ||\ elem\ e\ ys)$

Por definición de `union`:

$(e = x\ ||\ elem\ e\ (union\ xs\ ys) = (e=x\ ||\ elem\ e\ xs\ ||\ elem\ e\ ys)$

Por extensión de booleanos, $e=x$ puede ser $True$ o $False$.

$\textcolor{lime}{e = x}$

$(True ||\ elem\ e\ (union\ xs\ ys) = (True ||\ elem\ e\ xs\ ||\ elem\ e\ ys)$

$True = True$

$\textcolor{lime}{e \neq x}$

$(False\ ||\ elem\ e\ (union\ xs\ ys) = (False\ ||\ elem\ e\ xs\ ||\ elem\ e\ ys)$

$elem\ e\ (union\ xs\ ys) = (elem\ e\ xs)\ ||\ (elem\ e\ ys)$

Y esto vale por `hipótesis inductiva`.


Probamos la propiedad para todos los casos y por lo tanto vale para toda lista $xs$.

---

### $\textcolor{pink}{iv.\ Eq\ a \Rightarrow ∀ xs::[a] .\ ∀ ys::[a] .\ ∀ e::a .\ elem\ e\ (intersect\ xs\ ys) = (elem\ e\ xs)\ \&\&\ (elem\ e\ ys)}$

Lo pruebo por inducción estructural sobre $xs$.

$P(xs): elem\ e\ (intersect\ xs\ ys) = (elem\ e\ xs)\ \&\&\ (elem\ e\ ys)$

- Caso base $xs = []$:

$elem\ e\ (intersect\ []\ ys) = (elem\ e\ [])\ \&\&\ (elem\ e\ ys)$

Por la definición de `intersect` y `elem`:

```hs
intersect :: Eq a => [a] -> [a] -> [a]
{I0} intersect xs ys = filter (\e -> elem e ys) xs
```

$elem\ e\ (filter\ (\backslash e \rightarrow elem\ e\ ys)\ []) = False\ \&\&\ (elem\ e\ ys)$

Por la definición de `filter`:

$elem\ e\ [] = False\ \&\&\ (elem\ e\ ys)$

$False = False\ \&\&\ (elem\ e\ ys)$

$False = False$

- Caso inductivo $xs = x:xs$:

Asumimos verdadera $P(xs)$

$elem\ e\ (intersect\ (x:xs)\ ys) = (elem\ e\ (x:xs))\ \&\&\ (elem\ e\ ys)$

Por la definición de `intersect` y `elem`:

$elem\ e\ (filter\ (\backslash e \rightarrow elem\ e\ ys)\ (x:xs)) = (e\ = x\ ||\ elem\ e\ xs)\ \&\&\ (elem\ e\ ys)$

Por la definición de `filter`:

$elem\ e\ (if\ elem\ x\ ys\ then\ x:(filter\ (\backslash e \rightarrow elem\ e\ ys)\ xs)\ else\ filter\ (\backslash e \rightarrow elem\ e\ ys)\ xs) = (e\ = x\ ||\ elem\ e\ xs)\ \&\&\ (elem\ e\ ys)$

Por la definición de `intersect`:

$elem\ e\ (if\ elem\ x\ ys\ then\ x:(intersect\ xs\ ys)\ else\ intersect\ xs\ ys) = (e\ = x\ ||\ elem\ e\ xs)\ \&\&\ (elem\ e\ ys)$

Por extensión de booleanos, la condición del `if` puede ser $True$ o $False$.

$\textcolor{lime}{e = x}$

$elem\ e\ (x:(intersect\ xs\ ys)) = (True\ ||\ elem\ e\ xs)\ \&\&\ (elem\ e\ ys)$

$e=x \ ||\ elem\ e\ (intersect\ xs\ ys) = elem\ e\ xs\ \&\&\ elem\ e\ ys$

$True\ ||\ elem\ e\ (intersect\ xs\ ys) =  elem\ e\ xs\ \&\&\ elem\ e\ ys$

$elem\ e\ (intersect\ xs\ ys) =  elem\ e\ xs\ \&\&\ elem\ e\ ys$

Y esto vale por hipótesis inductiva por lo tanto vale la propiedad en este caso.

$\textcolor{lime}{e \neq x}$

$elem\ e\ (intersect\ xs\ ys) = (e=x\ ||\ elem\ e\ xs\ )\&\&\ elem\ e\ ys$

$elem\ e\ (intersect\ xs\ ys) = (False ||\ elem\ e\ xs\ )\&\&\ elem\ e\ ys$

$elem\ e\ (intersect\ xs\ ys) = elem\ e\ xs\ \&\&\ elem\ e\ ys$

Y esto también vale por hipótesis inductiva por lo tanto vale la propiedad para los dos casos por lo tanto vale para toda lista $xs$.

---

### $\textcolor{pink}{v.\ Eq\ a \Rightarrow ∀ xs::[a] .\ ∀ ys::[a] .\ length (union\ xs\ ys) = length\ xs\ +\ length\ ys}$

Lo pruebo por inducción estructural sobre $xs$.

$P(xs): length\ (union\ xs\ ys) = length\ xs\ +\ length\ ys$

- Caso base $xs = []$:

$length\ (union\ []\ ys) = length\ []\ +\ length\ ys$

Por la definición de `union` y `length`:

$length\ (nub ([]++ys)) = 0\ +\ length\ ys$

Por la definición de `nub`:

$length\ (nub\ ys) = length\ ys$

Lo pruebo por inducción estructural sobre $ys$.

$P(ys): length\ (nub\ ys) = length\ ys$

- Caso base $ys = []$:

$length\ (nub\ []) = length\ []$

Por la definición de `nub`:

$length\ [] = length\ []$

- Caso inductivo $ys = y:ys$:

Asumimos verdadera $P(ys)$

$length\ (nub\ (y:ys)) = length\ (y:ys)$

Por la definición de `nub` y `length`:

```hs
nub :: Eq a => [a] -> [a]
{N0} nub [] = []
{N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)
```
$length\ (y : filter (\backslash y \rightarrow x \neq y) (nub\ ys)) = length\ (y:ys)$

$1 + length\ (filter (\backslash y \rightarrow x \neq y) (nub\ ys)) = 1 + length\ ys$

$1 + length\ (nub\ ys)=1 + \ length\ ys $

$length\ (nub\ ys)= length\ ys $

Y esto vale por hipótesis inductiva.

Por lo tanto probamos el caso base.

- Caso inductivo $xs = x:xs$:

Asumimos verdadera $P(xs)$

$length\ (union\ (x:xs)\ ys) = length\ (x:xs)\ +\ length\ ys$

Por la definición de `union` y `length`:

$length\ (nub ((x:xs)++ys)) = 1 + length\ xs\ +\ length\ ys$

Por la definición de `nub`:

$length\  x : filter (\backslash y \rightarrow x \neq y)\ (nub\ (xs++ys)) = 1 + length\ xs\ +\ length\ ys$

$ 1 + length\  (filter (\backslash y \rightarrow x \neq y)\ (nub\ (xs++ys))) = 1 + length\ xs\ +\ length\ ys$

$ length\  (filter (\backslash y \rightarrow x \neq y)\ (nub\ (xs++ys))) = length\ xs\ +\ length\ ys$

$ length\  (nub\ (xs++ys)) = length\ xs\ +\ length\ ys$

Por la definición de `union`:

```hs
union :: Eq a => [a] -> [a] -> [a]
{U0} union xs ys = nub (xs++ys)
```

$ length\  (union\ xs\ ys)) = length\ xs\ +\ length\ ys$

Y esto vale por hipótesis inductiva.

---

### $\textcolor{pink}{vi.\ Eq\ a \Rightarrow ∀ xs::[a] .\ ∀ ys::[a] .\ length (union\ xs\ ys) \leq length\ xs + length\ ys} $

Lo pruebo por inducción estructural sobre $xs$.

$P(xs): length\ (union\ xs\ ys) \leq length\ xs + length\ ys$

- Caso base $xs = []$:

$length\ (union\ []\ ys) \leq length\ [] + length\ ys$

Por la definición de `union` y `length`:

$length\ (nub ([]++ys)) \leq 0 + length\ ys$

Por la definición de `nub`:

$length\ (nub\ ys) \leq length\ ys$

Lo pruebo por inducción estructural sobre $ys$.

$P(ys): length\ (nub\ ys) \leq length\ ys$

- Caso base $ys = []$:

$length\ (nub\ []) \leq length\ []$

Por la definición de `nub`:

$length\ [] \leq length\ []$

- Caso inductivo $ys = y:ys$:

Asumimos verdadera $P(ys)$

$length\ (nub\ (y:ys)) \leq length\ (y:ys)$

Por la definición de `nub` y `length`:

```hs
nub :: Eq a => [a] -> [a]
{N0} nub [] = []
{N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)
```

$length\ (y : filter (\backslash y \rightarrow x \neq y) (nub\ ys)) \leq 1 + length\ ys$

$1 + length\ (filter (\backslash y \rightarrow x \neq y) (nub\ ys)) \leq 1 + length\ ys$

$1 + length\ (nub\ ys) \leq 1 + length\ ys$

$length\ (nub\ ys) \leq length\ ys$

Y esto vale por hipótesis inductiva.

Por lo tanto probamos el caso base.

- Caso inductivo $xs = x:xs$:

Asumimos verdadera $P(xs)$

$length\ (union\ (x:xs)\ ys) \leq length\ (x:xs) + length\ ys$

Por la definición de `union` y `length`:

$length\ (nub ((x:xs)++ys)) \leq 1 + length\ xs + length\ ys$

Por la definición de `nub`:

$length\  x : filter (\backslash y \rightarrow x \neq y)\ (nub\ (xs++ys)) \leq 1 + length\ xs + length\ ys$

$1 + length\  (filter (\backslash y \rightarrow x \neq y)\ (nub\ (xs++ys))) \leq 1 + length\ xs + length\ ys$

$ length\  (filter (\backslash y \rightarrow x \neq y)\ (nub\ (xs++ys))) \leq length\ xs + length\ ys$

$ length\  (nub\ (xs++ys)) \leq length\ xs + length\ ys$

Por la definición de `union`:

```hs
union :: Eq a => [a] -> [a] -> [a]
{U0} union xs ys = nub (xs++ys)
```

$ length\  (union\ xs\ ys)) \leq length\ xs + length\ ys$

Y esto vale por hipótesis inductiva.