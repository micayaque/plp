<font face="LaTeX">

#### *Demostrar las siguientes igualdades utilizando el principio de extensionalidad funcional:*

```LaTeX
i.      flip . flip = id
ii.     ∀ f::(a,b)->c uncurry (curry f) = f
iii.    flip const = const id
iv.     ∀ f::a->b ∀ g::b->c ∀ h::c->d ((h . g) . f) = (h . (g . f))
```
#### *con la definición usual de la composición: `(.) f g x = f (g x)`.*

---

```haskell
Sean f, g :: a -> b. --Propiedad inmediata: Si f = g entonces (∀x::a. f x = g x).
```
## <u>Principio de extensionalidad funcional</u>
```haskell
Si (∀x::a. f x = g x) entonces f = g.
```
- ## i. flip . flip = id

Por la `extensionalidad funcional`.

### Sean f, g :: a&rarr;b Si f = g entonces (&forall;x::a. f x = g x).
### Si (&forall;x::a. flip . flip x = id x) entonces flip . flip = id.

<strong>Por la definición de la composición:</strong> `(.) f g x = f (g x)`

```LaTeX
flip . flip x y = flip (flip x y) 
```
<strong>Por la definición de `flip`:</strong>

```hs
flip :: (a -> b -> c) -> b -> a -> c
flip f = λ x y -> f y x  
```

```LaTeX
flip(flip x)    = flip(λ x y -> f y x)
                = λ y x --> f x y
                = f x y
```
<strong>Por la definición de `id`:</strong>
```hs
id :: a -> a
id x = x
```
```LaTeX
id f x y = f x y
```

---

- ## ii. ∀ f::(a,b)&rarr;c uncurry (curry f) = f

Por la `extensionalidad funcional`.

### Sean f :: (a,b)&rarr;c Si f = g entonces (&forall;x::a. f x = g x).
### Si (&forall;x::a. uncurry (curry f) x = f x) entonces uncurry (curry f) = f.

```hs
uncurry (curry f) x y   = uncurry(curry f x y)
```
<strong>Por la definición de `curry`:</strong>

```hs
curry :: ((a,b) -> c) -> a -> b -> c
curry f = λ x y -> f (x,y)
```

```LaTeX
uncurry(curry f x y) = uncurry (λ x y -> f (x,y))
                     = uncurry f(x,y)
```

<strong>Por la definición de `uncurry`:</strong>
```hs
uncurry :: (a -> b -> c) -> (a,b) -> c
uncurry f = λ (x,y) -> f x y
```

```LaTeX
uncurry f(x,y) = λ (x,y) -> f x y
               = f x y
```

---

- ## iii. flip const = const id

Por la `extensionalidad funcional`.

### Sean f, g :: a&rarr;b Si f = g entonces (&forall;x::a. f x = g x).

### Si (&forall;x::a. flip const x = const id x) entonces flip const = const id.

```hs
flip const x = const id x
```

<strong>Por la definición de `flip`:</strong>

```hs
flip :: (a -> b -> c) -> b -> a -> c
flip f x y = f y x
```

```LaTeX
flip const x = const x
```

<strong>Por la definición de `const`:</strong>
```hs
const :: a -> b -> a
const x _ = x
```

```LaTeX
const x = x
```

- ### flip const x y = x

<strong>Por la definición de `const`:</strong>

```LaTeX
const id x  = id x
```

<strong>Por la definición de `id`:</strong>
```hs
id :: a -> a
id x = x
```

```LaTeX
id x = x
```
Entonces `flip const = const id`.

---

- ## iv. ∀ f::a&rarr;b ∀ g::b&rarr;c ∀ h::c&rarr;d ((h . g) . f) = (h . (g . f))

Por la `extensionalidad funcional`.

### Sean f, g, h :: a&rarr;b Si f = g entonces (&forall;x::a. f x = g x).

### Si (&forall;x::a. ((h . g) . f) x = (h . (g . f)) x) entonces ((h . g) . f) = (h . (g . f)).

<strong>Por la definición de la composición:</strong> `(.) f g x = f (g x)`

```hs
((h . g) . f) x = (h . g) (f x)
                = h (g (f x))
                = h (g . f) x
```

</font>