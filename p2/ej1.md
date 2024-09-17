Extensionalidad
---
Sean las siguientes definiciones de funciones:
```hs
intercambiar (x,y) = (y,x)

espejar (Left x) = Right x
espejar (Right x) = Left x

asociarI (x,(y,z)) = ((x,y),z)

asociarD ((x,y),z)) = (x,(y,z))

flip f x y = f y x

curry f x y = f (x,y)

uncurry f (x,y) = f x y
```
---
Demostrar las siguientes igualdades usando los principios de $extensionalidad$ cuando sea necesario:

---
$\textcolor{purple}{i}.\ ∀\ p::(a,b)\ .\ intercambiar(intercambiar\ p) = p$
---

Como p es de tipo (a, b) entonces tiene la forma (x, y) para un x::a, y::b

$\textcolor{aqua}{\underline{Principio\ de\ extensionalidad\ para\ pares:}}$

### $\textcolor{aqua}{Si\ p :: (a, b),\ entonces\ ∃x :: a.\ ∃y :: b.\ p = (x, y).}$

Nos queda que:

$∀\ p::(a,b)\ .\ intercambiar(intercambiar\ (x',y')) = (x',y')$

Usando el Principio de Reemplazo y por definición de intercambiar.

```hs
intercambiar (x,y) = (y,x)
```

$intercambiar\ (x',y') = (y',x')$

Entonces,

$∀\ p::(a,b)\ .\ intercambiar((y',x')) = (x',y')$

Y de nuevo aplicando la definición de intercambiar,

#### $∀\ p::(a,b)\ .\ intercambiar((y',x')) = (x',y')$


---

$\textcolor{purple}{ii.\ } ∀\ p::(a,(b,c))\ .\ asociarD (asociarI\ p) = p$
---

De nuevo por el $\textcolor{aqua}{Principio\ de\ extensionalidad\ para\ pares:}$

### $\textcolor{aqua}{Si\ p :: (a, (b, c)),\ entonces\ ∃x :: a.\ ∃y :: b.\ ∃z :: c.\ p = (x, (y, z)).}$

Entonces, 

$∀\ p::(a,(b,c))\ .\ asociarD (asociarI\ (x', (y', z'))) = (x', (y', z'))$

Usando la definición de asociarI y asociarD:

```hs
asociarI (x,(y,z)) = ((x,y),z)
asociarD ((x,y),z)) = (x,(y,z))
```

$asociarI\ (x', (y', z')) = ((x', y'), z')$

Entonces, usamos el principio de reemplazo y nos queda que:

$∀\ p::(a,(b,c))\ .\ asociarD ((x', y'), z') = (x', (y', z'))$

Luego reemplazando por la ecuación de asociarD:

$∀\ p::(a,(b,c))\ .\ (x',(y',z')) = (x', (y', z'))$

Lo cual es cierto para cualquier p.

---

$\textcolor{purple}{iii.} ∀\ p::Either\ a\ b\ .\ espejar\ (espejar\ p) = p$
---

Por el Principio de $\textcolor{aqua}{\underline{Extensionalidad\ para\ sumas:}\\
Si\ e :: Either\ a\ b,\ entonces:\\
 o\ bien\ ∃x :: a.\ e = Left\ x\\
 o\ bien\ ∃y :: b.\ e = Right\ y}$

Entonces, para p tenemos dos casos posibles:
`p = Right x'` o `p = Left x'`

Caso `p = Left x'`:

$∀\ p::Either\ a\ b\ .\ espejar\ (espejar\ (Left\ x')) = Left\ x'$

Usando la definición de espejar:

```hs
espejar (Left x) = Right x
espejar (Right x) = Left x
```

$∀\ p::Either\ a\ b\ .\ espejar\ (Right\ x') = Left\ x'$

Y por la definición de espejar para el caso Right x:

$∀\ p::Either\ a\ b\ .\ Left x' = Left\ x'$

Lo que es verdadero para cualquier p.

Caso `p = Right x'`:

Análogamente al caso anterior, tenemos que:

$∀\ p::Either\ a\ b\ .\ espejar\ (espejar\ (Right\ x')) = Right\ x'$

$∀\ p::Either\ a\ b\ .\ espejar\ (Left\ x') = Right\ x'$

$∀\ p::Either\ a\ b\ .\ Right\ x' = Right\ x'$

---

$\textcolor{purple}{iv.}\ ∀ f::a\rightarrow b\rightarrow c\ .\ ∀\ x::a\ .\ ∀\ y::b\ .\ flip\ (flip\ f)\ x\ y = f\ x\ y$

Por el $\textcolor{aqua}{Principio\ de\ \underline{extensionalidad\ funcional}: Si\ \ (∀x\ ::\ a.\ \ f\ x = g\ x)\ entonces\ f = g.}$

$Si\ ∀\ x'::a\ .\ ∀\ y'::b\ .\ flip\ (flip\ f)\ x'\ y' = f\ x'\ y' entonces\ flip\ (flip\ f)\ = f$

$flip\ (flip\ f)\ x'\ y' = f\ x'\ y'$


Reemplazamos por la definición de flip:

```hs
flip f x y = f y x
```

En este caso $(flip\ f)$ estaría ocupando el papel de f en la definición de flip, entonces:

$flip\ (flip\ f)\ x'\ y' = (flip\ f)\ y'\ x'$


Y de nuevo por definición de flip

$(flip\ f)\ y'\ x' = f\ x'\ y'$

Por lo que se cumple la igualdad.


---


$\textcolor{purple}{v.} ∀ f::a\rightarrow b\rightarrow c .\ ∀ x::a .\ ∀ y::b .\ curry\ (uncurry\ f)\ x\ y = f\ x\ y$
---

Por el $\textcolor{aqua}{Principio\ de\ \underline{extensionalidad\ funcional}: Si\ \ (∀x\ ::\ a.\ \ f\ x = g\ x)\ entonces\ f = g.}$

$Si\ ∀\ x'::a\ .\ ∀\ y'::b\ .\ curry\ (uncurry\ f)\ x'\ y' = f\ x'\ y' entonces\ curry\ (uncurry\ f)\ = f$

$curry\ (uncurry\ f)\ x'\ y' = f\ x'\ y'$

Reemplazamos por las definiciones de curry y uncurry:

```hs
curry f x y = f (x,y)
uncurry f (x,y) = f x y
```

$curry\ (uncurry\ f)\ x'\ y' = uncurry\ f\ (x', y')\ =\ f\ x'\ y'$

Lo que cumple con la igualdad.

