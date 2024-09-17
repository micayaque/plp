Demostrar las siguientes igualdades utilizando el $\textcolor{aqua}{principio\ de\ extensionalidad\ funcional:}$ 

### $\textcolor{pink}{i.\ flip\ .\ flip = id}$

$\textcolor{aqua}{principio\ de\ extensionalidad\ funcional:\ Si (∀x :: a.\ f\ x = g\ x)\ entonces\ f = g.}$

Definición de `flip`:
```hs
flip f x y = f y x
```

Usando el principio de extensionalidad funcional y la definición de `flip`:

$flip\ .\ flip\ f\ x\ y  = flip\ f\ y\ x  = f\ x\ y$

$id\ f\ x\ y = f\ x\ y$

Por lo tanto, $flip\ .\ flip = id$.

---

### $\textcolor{pink}{ii. ∀ f::(a,b)\rightarrow c\ .\ uncurry\ (curry\ f) = f}$

$\textcolor{aqua}{principio\ de\ extensionalidad\ funcional:\ Si (∀x :: a.\ f\ x = g\ x)\ entonces\ f = g.}$

$∀ f::(a,b)\rightarrow c\ .\ uncurry\ (curry\ f)(x,y) = f(x,y)$

Definición de `curry`:
```hs
curry f x y = f (x,y)
uncurry f (x,y) = f x y
```

Usando el principio de extensionalidad funcional y las definiciones de `curry` y `uncurry`:

$uncurry\ (curry\ f (x,y)) =\\
uncury\ (f\ x\ y) =\\
uncurry\ f\ x\ y=\\
 f(x,y)$

 Lo que cumple la igualdad.

 ---

### $\textcolor{pink}{iii.\ flip\ const\ =\ const\ id}$

$\textcolor{aqua}{principio\ de\ extensionalidad\ funcional:\ Sean\ f,\ g\ :: a \rightarrow b.\ Si (∀x :: a.\ f\ x = g\ x)\ entonces\ f = g.}$

$Si (∀x :: a.\ ∀y :: b.\ f\ x y = g\ x y)\ entonces\ f = g$

$(flip\ const)\ x\ y\ =\ (const\ id)\ x\ y\ $

Definición de `flip`:

```hs
flip f x y = f y x
const x y = y
id f = f
```

$(flip\ const)\ x\ y\ =\ \\
const\ y\ x\ =\ \\
x $

$(const\ id)\ x\ y\ =\ \\
id\ x=\\
x  $

Por lo tanto, $flip\ const\ =\ const\ id$.


---


### $\textcolor{pink}{iv. ∀ f::a\rightarrow b.\ ∀ g::b\rightarrow c.\ ∀ h::c\rightarrow d.\ ((h\ .\ g)\ .\ f) = (h\ .\ (g\ .\ f))}$

$con\ la\ definición\ usual\ de\ la\ composición:\ (.)\ f\ g\ x = f\ (g\ x).$

---

$\textcolor{aqua}{principio\ de\ extensionalidad\ funcional:\ Sean\ f,\ g\ :: a \rightarrow b.\ Si (∀x :: a.\ f\ x = g\ x)\ entonces\ f = g.}$

$∀ f::a \rightarrow b.\ ∀g::b\rightarrow c.\ ∀ h::c\rightarrow d.\ ((h\ .\ g)\ .\ f) = (h\ .\ (g\ .\ f))\\
con\ la\ definición\ usual\ de\ la\ composición:\ (.)\ f\ g\ x = f\ (g\ x).$

$∀x :: a.\ ∀ f::a \rightarrow b.\ ∀g::b\rightarrow c.\ ∀ h::c\rightarrow d.\ ((h\ .\ g)\ .\ f)\ x = (h\ .\ (g\ .\ f))\ x$

Por la definición de la composición:

$((h\ .\ g)\ .\ f)\ x = (h\ .\ (g\ .\ f))\ x \\
((h\ .\ g)\ .\ f)\ x =\ h\ .\ g\ .\ f\ x \\
(h\ .\ g\ ) (f\ x) =  h\ .\ g\ .\ f\ x \\
h\ .\ g\ .\ f\ x = h\ .\ g\ .\ f\ x$

