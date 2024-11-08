Demostrar las siguientes propiedades utilizando $\textcolor{aqua}{inducción\ estructural\ sobre\ listas\ y\ el\ principio\ de\ extensionalidad.}$

$Sean\ f,\ g :: a \rightarrow b.\\
Propiedad\ inmediata:\ Si\ f = g\ entonces\ (∀x :: a.\ f\ x = g\ x).\\
Principio\ de\ extensionalidad\ funcional:\\
Si\ (∀x :: a.\ f x = g x)\ entonces\ f = g.$

---

### $\textcolor{pink}{i.\ reverse\ .\ reverse\ = id}$

Queremos ver que $\forall xs::[a]\ reverse\ .\ reverse\ xs = id\ xs $

Usamos inducción estructural sobre la lista $xs$.

$P(xs): reverse\ .\ reverse\ xs = id\ xs$

<u>Caso base:</u>

$P([]): reverse\ reverse\ [] = id\ []$

Por las definiciones de $reverse$ e $id$:

$P([]): reverse\ [] = []$

$P([]): [] = []$

$P([]): True$

<u>Caso inductivo:</u>

$P(xs) \Rightarrow P(x:xs)$

$P(x:xs): reverse\ .\ reverse\ (x:xs) = id\ (x:xs)$

Por definición de $reverse$:
```hs
reverse :: [a] -> [a]
{R0} reverse = foldl (flip (:)) []
```

$P(x:xs): reverse\ .\ (foldl\ (flip\ (:))\ []\ (x:xs)) = id\ (x:xs)$

Por definición de $foldl$:

$P(x:xs): reverse\ .\ (foldl\ (flip\ (:))\ []\ x\ xs) = id\ (x:xs)$

$P(x:xs): reverse\ .\ (foldl\ (flip\ (:))\ (flip\ (:))\ []\ x\ xs) = id\ (x:xs)$

$P(x:xs): reverse\ .\ (foldl\ (flip\ (:))\ [x]\ xs) = id\ (x:xs)$

---
### $\textcolor{pink}{ii.\ append = (++)}$

---
### $\textcolor{pink}{iii.\ map\ id = id}$

---
### $\textcolor{pink}{iv.\ ∀ f::a\rightarrow b .\ ∀ g::b\rightarrow c .\ map\ (g\ .\ f) = map\ g\ .\ map\ f}$

---
### $\textcolor{pink}{ v.\ ∀ f::a\rightarrow b .\ ∀ p::b\rightarrow Bool .\ map\ f\ .\ filter\ (p\ .\ f) = filter\ p\ .\ map\ f}$

---
### $\textcolor{pink}{ vi.\ ∀ f::a\rightarrow b .\ ∀ e::a .\ ∀ xs::[a] .\ ((elem\ e\ xs) \Rightarrow (elem\ (f\ e)\ (map\ f\ xs)))\ (asumiendo\ Eq\ a\ y\ Eq\ b)}$

