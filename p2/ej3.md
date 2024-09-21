Inducción sobre listas
---
Considerar las siguientes funciones:

```haskell
length :: [a] -> Int
{L0} length [] = 0
{L1} length (x:xs) = 1 + length xs

duplicar :: [a] -> [a]
{D0} duplicar [] = []
{D1} duplicar (x:xs) = x : x : duplicar xs

append :: [a] -> [a] -> [a]
{A0} append [] ys = ys
{A1} append (x:xs) ys = x : append xs ys

(++) :: [a] -> [a] -> [a]
{++} xs ++ ys = foldr (:) ys xs

ponerAlFinal :: a -> [a] -> [a]
{P0} ponerAlFinal x = foldr (:) (x:[])

reverse :: [a] -> [a]
{R0} reverse = foldl (flip (:)) []
```

Demostrar las siguientes propiedades:

### $\textcolor{pink}{i. ∀\ xs::[a].\ length\ (duplicar\ xs) = 2 * length\ xs}$

$\textcolor{aqua}{principio\ de\ inducción\ sobre\ listas:}$

$∀\ xs::[a].\ length\ (duplicar\ xs) = 2 * length\ xs$

$P(xs) = length\ (duplicar\ xs) = 2 * length\ xs$

$\textcolor{aqua}{\underline{Hipótesis\ inductiva}: length\ (duplicar\ xs) = 2 * length\ xs}$

$\textcolor{aqua}{Caso\ base:}$

$P([]) = length\ (duplicar\ []) = 2 * length\ []$

Por la definición de $D0$ y $L0$:

$P([]) = length\ [] = 2 * lenght\ []$

$P([]) = 0=2*0=0$

$\textcolor{aqua}{Caso\ inductivo:}$

$P(x:xs) = length\ (duplicar\ (x:xs)) = 2 * length\ (x:xs)$

Por la definición de $D1$ y $L1$:

$P(x:xs) = length\ (x:x:duplicar\ xs) = 2 * (1 + length\ xs)$

Por $L1$:

$P(x:xs) = 2 + (lenght\ (duplicar\ xs)) = 2 + 2* length\ xs)$

$P(x:xs) = lenght\ (duplicar\ xs) = 2* length\ xs)$

Que vale por la hipótesis inductiva.

Por lo tanto probamos $P(xs)\ ∀\ xs::[a].$

---

### $\textcolor{pink}{ii. ∀ xs::[a] .\ ∀ ys::[a] .\ \ length (append\  xs\ ys) = length\ xs + length\ ys}$

Por el $\textcolor{aqua}{principio\ de\ inducción\ sobre\ listas:}$

$∀ xs::[a] .\ ∀ ys::[a] .\ \ length (append\  xs\ ys) = length\ xs + length\ ys$

$P(xs) = length (append\  xs\ ys) = length\ xs + length\ ys$

$\textcolor{aqua}{\underline{Hipótesis\ inductiva}: length (append\  xs\ ys) = length\ xs + length\ ys}$

$\textcolor{aqua}{Caso\ base:}$

$P([]) = length (append\  []\ ys) = length\ [] + length\ ys$

Por la definición de $A0$ y $L0$:

$P([]) = length ys = 0 + length\ ys$

$P([]) = length ys = length\ ys$

Lo que es verdadero y por lo tanto vale el caso base.

$\textcolor{aqua}{Caso\ inductivo:}$

$P(x:xs) = length (append\  (x:xs)\ ys) = length\ (x:xs) + length\ ys$

Por la definición de $A1$ y $L1$:

$P(x:xs) = length (x\ :\ append\ xs\ ys) = 1 + lenght xs + length\ ys$

$P(x:xs) = 1 + lenght(append\ xs\ ys) = 1 + lenght xs + length\ ys$

$P(x:xs) = lenght(append\ xs\ ys) = lenght xs + length\ ys$


Que vale por la hipótesis inductiva.

Por lo tanto probamos $P(xs)\ ∀\ xs::[a].$

---

### $\textcolor{pink}{iii.\ ∀\ xs::[a]\ .\ ∀\ x::a\ .\ [x]++xs = x:xs}$

Por el $\textcolor{aqua}{principio\ de\ inducción\ sobre\ listas:}$

$∀\ xs::[a]\ .\ ∀\ x::a\ .\ [x]++xs = x:xs$

$P(xs) = [x]++xs = x:xs$

$\textcolor{aqua}{\underline{Hipótesis\ inductiva}: [x]++xs = x:xs}$

$\textcolor{aqua}{Caso\ base:}$

$P([]) = [x]++[] = x:[]$

Por ${++}$

$P([]) = foldr (:) [] [x] = x:[]$

Por la definición de `foldr`

$P([]) = x: foldr (:) [] [] = x:[]$

$P([]) = x:[] = x:[]$

Lo que es verdadero y por lo tanto vale el caso base.

$\textcolor{aqua}{Caso\ inductivo:}$

$P(x:xs) = [x]++(x:xs) = x:(x:xs)$

Por ${++}$

$P(x:xs) = foldr (:) (x:xs) [x] = x:(x:xs)$

Por la definición de `foldr`

$P(x:xs) = x: foldr (:) (x:xs) [] = x:(x:xs)$

$P(x:xs) = x: (x:xs) = x:(x:xs)$

Lo que es verdadero y por lo tanto vale el caso inductivo.

Por lo tanto probamos $P(xs)\ ∀\ xs::[a].$

---


### $\textcolor{pink}{iv.\ ∀\ xs::[a].\ ∀ f::(a\rightarrow b).\ length (map\ f\ xs) = length\ xs}$

Por el $\textcolor{aqua}{principio\ de\ inducción\ sobre\ listas:}\ y\ el\ principio\ de\ extensionalidad\ de\ funciones $

$∀\ xs::[a].\ ∀ f::(a\rightarrow b).\ length (map\ f\ xs) = length\ xs$

$P(xs) = length (map\ f\ xs) = length\ xs$

$\textcolor{aqua}{\underline{Hipótesis\ inductiva}: length (map\ f\ xs) = length\ xs}$

$\textcolor{aqua}{Caso\ base:}$

$P([]) = length (map\ f\ []) = length\ []$

Por la definición de `map` y $L0$:

$P([]) = length [] = 0$

$P([]) = 0 = 0$

$\textcolor{aqua}{Caso\ inductivo:}$

$P(x:xs) = length (map\ f\ (x:xs)) = length\ (x:xs)$

Por la definición de `map` y $L1$:

$P(x:xs) = length (f\ x : map\ f\ xs) = 1 + length\ xs$

$P(x:xs) = 1 + length (map\ f\ xs) = 1 + length\ xs$

$P(x:xs) = length (map\ f\ xs) = length\ xs$

Que vale por la hipótesis inductiva.

---


### $\textcolor{pink}{v. ∀ xs::[a] .\ ∀ p::a\rightarrow Bool .\ ∀ e::a .\ ((elem\ e (filter\ p\ xs)) \Rightarrow (elem\ e\ xs)) (asumiendo\ Eq\ a)}$

Por el $\textcolor{aqua}{principio\ de\ inducción\ sobre\ listas:}$

$∀ xs::[a] .\ ∀ p::a\rightarrow Bool .\ ∀ e::a .\ ((elem\ e (filter\ p\ xs)) \Rightarrow (elem\ e\ xs))$

$P(xs) = (elem\ e (filter\ p\ xs)) \Rightarrow (elem\ e\ xs)$

$\textcolor{aqua}{\underline{Hipótesis\ inductiva}: (elem\ e (filter\ p\ xs)) \Rightarrow (elem\ e\ xs)}$

$\textcolor{aqua}{Caso\ base:}$

$P([]) = (elem\ e (filter\ p\ [])) \Rightarrow (elem\ e\ [])$

Por la definición de `filter` :

$P([]) = (elem\ e []) \Rightarrow (elem\ e\ [])$

Por la definición de `elem`:

$P([]) = False \Rightarrow False$

Lo cual es verdadero y por lo tanto vale el caso base.

$P(x:xs) = (elem\ e (filter\ p\ (x:xs)) \Rightarrow (elem\ e\ (x:xs)$

Por la definición de `filter`:

$P(x:xs) = (elem\ e (if\ p\ x\ then\ x:(filter\ p\ xs)\ else\ filter\ p\ xs)) \Rightarrow (elem\ e\ (x:xs))$

Por lo tanto tenemos dos casos: $p\ x\ =\ True$ y $p\ x\ =\ False$

$\textcolor{aqua}{Por\ extensionalidad\ de\ booleanos\ basta\ con\ probar\ que\ la\ propiedad\ vale\ en\ esos\ dos\ casos}$

### $\textcolor{aqua}{\underline{p\ x=true:}}$

Si vale $p\ x$ entonces $filter\ p\ xs$ va a tener a $x$ en su lista, por lo tanto $elem\ e\ (x:filter\ p\ xs)$ va a ser verdadero si $e\ =\ x$ o si $elem\ e\ (filter\ p\ xs)$ es verdadero.

$P(x:xs) = (elem\ e (x:(filter\ p\ xs)) \Rightarrow (elem\ e\ (x:xs))$

$P(x:xs) = (e\ =\ x\ ||\ elem\ e\ (filter\ p\ xs)) \Rightarrow (e\ =\ x\ ||\ elem\ e\ xs)$

Entonces de nuevo tenemos dos casos: $e\ =\ x$ y $e\ \neq x$

$\textcolor{aqua}{\underline{e\ = x:}}$

Este caso es trivial porque si $e=x$ entonces $True \Rightarrow True$.

$\textcolor{aqua}{\underline{e\ \neq x:}}$

Si $e\ \neq x$ entonces $elem\ e\ (x:filter\ p\ xs)$ va a ser verdadero si $elem\ e\ (filter\ p\ xs)$ es verdadero.

Nos queda:

$P(x:xs) = elem\ e\ (filter\ p\ xs) \Rightarrow elem\ e\ xs$

Que es verdadero por HI.

### $\textcolor{aqua}{\underline{p\ x=false:}}$

Si $p\ x$ es falso entonces $filter\ p\ xs$ no va a tener a $x$ en su lista, por lo tanto $elem\ e\ (x:filter\ p\ xs)$ va a ser verdadero si $e\ \neq x$.

$P(x:xs) = elem\ e (filter\ p\ xs) \Rightarrow elem\ e\ (x:xs)$

$\textcolor{aqua}{\underline{e\ = x:}}$

Por lo tanto si $e=x$ entonces $elem\ e\ (filter\ p\ xs)$ va a ser falso y por lo tanto la propiedad vale trivialmente.

Si
$\textcolor{aqua}{\underline{e\ \neq x:}}$

$P(x:xs) = elem\ e (filter\ p\ xs) \Rightarrow elem\ e\ (x:xs)$

Por definición de `elem`:

$P(x:xs) = elem\ e (filter\ p\ xs) \Rightarrow e = x || elem\ e\ xs$


Pero es absurdo que e=x pues estamos en el caso $e \neq x$

Entonces nos queda, 

$P(x:xs) = elem\ e (filter\ p\ xs) \Rightarrow elem\ e\ xs$

Que es verdadero por HI.

---

### $\textcolor{pink}{vi. ∀ xs::[a] .\ ∀ x::a .\ ponerAlFinal\ x\ xs = xs ++ (x:[])}$

Por el $\textcolor{aqua}{principio\ de\ inducción\ sobre\ listas:}$

$∀ xs::[a] .\ ∀ x::a .\ ponerAlFinal\ x\ xs = xs ++ (x:[])$

$P(xs) = ponerAlFinal\ x\ xs = xs ++ (x:[])$

$\textcolor{aqua}{\underline{Hipótesis\ inductiva}: ponerAlFinal\ x\ xs = xs ++ (x:[])}$

$\textcolor{aqua}{Caso\ base:}$

$P([]) = ponerAlFinal\ x\ [] = [] ++ (x:[])$

Por la definición de `ponerAlFinal`:

$P([]) = foldr (:) (x:[]) [] = [] ++ (x:[])$

Por la definición de `foldr`:

$P([]) = x: foldr (:) [] [] = [] ++ (x:[])$

Por la definición de `{++}`:

$P([]) = x:[] = x:[]$

Lo que es verdadero y por lo tanto vale el caso base.


$\textcolor{aqua}{Caso\ inductivo:}$

$P(x:xs) = ponerAlFinal\ x\ (x:xs) = (x:xs) ++ (x:[])$

Por la definición de `ponerAlFinal`:

$P(x:xs) = foldr (:) (x:[]) (x:xs) = (x:xs) ++ (x:[])$

Por la definición de `foldr`:

$P(x:xs) = x: foldr (:) (x:[]) xs = (x:xs) ++ (x:[])$

Por la definición de `{++}`:

$P(x:xs) = x: foldr (:) (x:[]) xs = (x:xs) ++ (x:[])$

Por la definición de `ponerAlFinal`: `foldr (:) (x:[])`es equivalente a `ponerAlFinal x xs`

$P(x:xs) = x : ponerAlFinal\ x\ xs = (x:xs) ++ (x:[])$

Por la definición de `++`:

$P(x:xs) = x : ponerAlFinal\ x\ xs = foldr\ (:)\ (x:[])\ (x:xs)$

Por la definición de `foldr`:

$P(x:xs) = x : ponerAlFinal\ x\ xs = x : foldr\ (:)\ (x:[])\ xs$

Por`{++} xs ++ ys = foldr (:) ys xs`

$P(x:xs) = x : ponerAlFinal\ x\ xs = x :( xs ++ (x:[]))$

Que vale por HI


---
$\textcolor{pink}{vii.\ reverse = foldr (\backslash x\ rec\ \rightarrow rec ++ (x:[])) [] }$

Lo puedo probar por inducción estructural sobre listas.

$P(xs): reverse\ xs = foldr (\backslash x\ rec\ \rightarrow rec ++ (x:[])) []\ xs$

<u>Caso base:</u>

$P([]): reverse\ [] = foldr (\backslash x\ rec\ \rightarrow rec ++ (x:[])) []\ []$

Por `{R0} reverse = foldl (flip (:)) []`

$foldl\ (flip\ (:))\ []\ [] = foldr\ (\backslash x\ rec\ \rightarrow rec\ ++\ (x:[]))\ []\ []$

Por la definición de `foldl`:

$[] = foldr\ (\backslash x\ rec\ \rightarrow rec\ ++\ (x:[]))\ []\ []$

Por la definición de `foldr`:

$[] = []$

$True$

<u>Caso inductivo:</u>

$P(x:xs): reverse\ (x:xs) = foldr (\backslash x'\ rec\ \rightarrow rec ++ (x':[])) []\ (x:xs)$

<u>Hipótesis inductiva:</u>

$P(xs): reverse\ xs = foldr (\backslash x\ rec\ \rightarrow rec ++ (x:[])) []\ xs$

Por `{R0} reverse = foldl (flip (:)) []`

$foldl\ (flip\ (:))\ []\ (x:xs) = foldr\ (\backslash x'\ rec\ \rightarrow rec\ ++\ (x':[]))\ []\ (x:xs)$

Por la definición de `foldl`:

```hs
foldl f ac [] = ac
foldl f ac (x : xs) = foldl f (f ac x) xs
```

$foldl\ (flip\ (:))\ (x:[])\ xs = foldr\ (\backslash x'\ rec\ \rightarrow rec\ ++\ (x':[]))\ []\ (x:xs)$

Por la definición de `foldr`:

$foldl\ (flip\ (:))\ (x:[])\ xs = foldr\ (\backslash x'\ rec\ \rightarrow rec\ ++\ (x':[]))\ []\ xs\ ++\ (x:[])$

Por la definición de `flip`:

$(foldl\ (flip\ (:))\ []\ xs) ++ [x] = foldr\ (\backslash x'\ rec\ \rightarrow rec\ ++\ (x':[]))\ []\ xs\ ++\ [x])$

Por la definición de `reverse` y `ponerAlFinal`:

$(reverse\ xs) ++ [x] = foldr\ (\backslash x'\ rec\ \rightarrow rec\ ++\ (x':[]))\ []\ xs\ ++\ [x])$

Esto sale por HI aunque al haber un `++[x]` debería probar que para toda lista `xs, ys` se cumple que $ys ++ xs = ys' ++ xs \Rightarrow ys=ys'$

---
$\textcolor{pink}{viii.\ ∀ xs::[a] .\ ∀ x::a .\ head\ (reverse\ (ponerAlFinal\ x\ xs)) = x}$

$head\ (reverse\ (ponerAlFinal\ x\ xs)) = x$

Por inducción estructural sobre listas.

$P(xs): head\ (reverse\ (ponerAlFinal\ x\ xs)) = x$

<u>Caso base:</u>

$P([]): head\ (reverse (ponerAlFinal\ x\ [])) = x$

Por `{P0} ponerAlFinal x = foldr (:) (x:[])`

$P([]): head\ (reverse (foldr\ (:)\ (x:[])\ [])) = x$

Por la definición de `foldr`:

$P([]): head\ (reverse (x:[])) = x$

Por la definición de `reverse`:

$P([]): head\ (foldl\ (flip\ (:))\ []\ (x:[])) = x$

Por la definición de `foldl`:

$P([]): head\ (foldl\ (flip\ (:))\ [x]\ []) = x$

Por la definición de `foldl`:

$P([]): head\ [x] = x$

Por la definición de `head`:

$P([]): x = x$

$True$


<u>Caso inductivo:</u>

$P(x:xs): head\ (reverse (ponerAlFinal\ x'\ (x:xs))) = x'$

<u>Hipótesis inductiva:</u>

$P(xs): head\ (reverse (ponerAlFinal\ x\ xs)) = x$

Por `{P0} ponerAlFinal x xs = foldr (:) (x:[]) xs`

$head\ (reverse (foldr\ (:)\ (x':[])\ (x:xs))) = x'$

Por la definición de `foldr`:

$head\ (reverse (x:foldr\ (:)\ (x':[])\ xs)) = x'$

`foldr (:) (x:[]) xs = ponerAlFinal x xs`:

$head\ (reverse (x:(ponerAlFinal\ x'\ xs)) = x'$

Por la definición de `reverse`:

$head\ (foldl\ (flip\ (:))\ []\ (x:(ponerAlFinal\ x'\ xs))) = x'$

Por la definición de `foldl`:

```hs
foldl f ac [] = ac
foldl f ac (x : xs) = foldl f (f ac x) xs
```

$head\ (foldl\ (flip\ (:))\ [x]\ (ponerAlFinal\ x'\ xs)) = x'$


$head\ (foldl\ (flip\ (:))\ []\ (ponerAlFinal\ x'\ xs)\ ++\ [x]) = x'$

Por la definición de `reverse = foldl (flip (:)) []`

$head\ (reverse (ponerAlFinal\ x'\ xs)\ ++\ [x]) = x'$

Lema ... $\uparrow$