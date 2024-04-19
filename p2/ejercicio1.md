<font face="LaTeX">

#### *Sean las siguientes definiciones de funciones:*
```haskell
intercambiar (x,y) = (y,x)
espejar (Left x) = Right x
espejar (Right x) = Left x
asociarI (x,(y,z)) = ((x,y),z)
asociarD ((x,y),z)) = (x,(y,z))
flip f x y = f y x
curry f x y = f (x,y)
uncurry f (x,y) = f x y
```
#### *Demostrar las siguientes igualdades usando el principio de extensionalidad para pares y sumas:*
```latex
i.   ∀ p::(a,b) .intercambiar (intercambiar p) = p
ii.  ∀ p::(a,(b,c)) .asociarD (asociarI p) = p
iii. ∀ p::Either a b .espejar (espejar p) = p
iv.  ∀ f::a->b->c .∀x::a .∀y::b .flip (flip f) x y = f x y
v.   ∀f::a->b->c .∀x::a .∀y::b .curry(uncurry f) x y = f x y
```

## <u>Extensionalidad para pares</u>

```haskell
Si p::(a, b), entonces ∃x::a. ∃y::b. p = (x,y).
```
---
```haskell
data Either a b = Left a | Right b
```
## <u>Extensionalidad para sumas</u>
```haskell
Si e :: Either a b, entonces:
    o bien ∃x :: a. e = Left x
    o bien ∃y :: b. e = Right b
```
---

```haskell
Sean f, g :: a -> b. --Propiedad inmediata: Si f = g entonces (∀x::a. f x = g x).
```
## <u>Principio de extensionalidad funcional</u>
```haskell
Si (∀x::a. f x = g x) entonces f = g.
```

- ## i. ∀ p::(a,b) intercambiar (intercambiar p) = p

Por la `extensionalidad para pares`. 

`Si p::(a, b), entonces ∃x::a. ∃y::b. p=(x,y).`

 Por `definición de intercambiar`:
```haskell
intercambiar(intercambiar(x,y)) = intercambiar(y,x) 
                                = (x,y) 
                                = p   
```
---

- ## ii.  ∀ p::(a,(b,c)) .asociarD (asociarI p) = p

Por la `extensionalidad para pares`. 

`Si p::(a, (b,c)), entonces ∃x::a. ∃(y,z)::(b,c). p=(x,(y,z)).`

Por `definición de asociarI` y `asociarD`:
```haskell
asociarD(asociarI(p))   = asociarD(asociarI (x,(y,z))) 
                        = asociarD(((x,y),z)) 
                        = (x,(y,z)) 
                        = p
```
- ## iii. ∀ p::Either a b .espejar (espejar p) = p

Por la `extensionalidad para sumas`.

`Si p::Either a b, entonces: o bien ∃x::a. p=Left x o bien ∃y::b. p=Right b.`

Entonces: 

- `P=Left x`

Por `definición de espejar`:
```haskell
espejar(espejar(p)) = espejar(espejar(Left x))
                    = espejar(Right x)
                    = Left x
                    = p
```
- `P=Right x`

Por `definición de espejar`:
```haskell
espejar(espejar(p)) = espejar(espejar(Right x))
                    = espejar(Left x)
                    = Right x
                    = p
```

---

- ## iv. ∀ f::a&rarr;b&rarr;c .∀x::a .∀y::b .flip (flip f) x y = f x y

Por la `extensionalidad para funciones`.

```haskell
Sean f,g::a->b.
Si f = g entonces (∀x::a. f x = g x).

Si (∀x::a. f x = g x) entonces f = g.
```

`Si f::a->b->c. ∀x::a. ∀y::b. flip (flip f) x y = f x y.`

Por `definición de flip`: flip f x y = f y x

```haskell
flip(flip f) x y    = (flip f) y x
                    = f x y
```

---

- ## v. ∀f::a&rarr;b&rarr;c .∀x::a .∀y::b .curry(uncurry f) x y = f x y

Por la `extensionalidad para funciones`.

`Si f::a->b->c. ∀x::a. ∀y::b. curry(uncurry f) x y = f x y`

Por `definición de curry` y `uncurry`:

```haskell
curry(uncurry f) x y = uncurry f (x,y)
                     = f x y
```

</font>