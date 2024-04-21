<font face="LaTeX">

*Dadas las funciones altura y cantNodos definidas en la práctica 1 para árboles binarios, demostrar la siguiente propiedad:*

```haskell
foldAEB :: (a -> b) -> (b -> a -> b -> b) -> AEB a -> b
foldAEB cHoja cBin arbol = case arbol of
    Hoja x -> cHoja x
    Bin i r d -> cBin (rec i) r (rec d)
  where rec = foldAEB cHoja cBin 

altura :: AEB a -> Int
altura = foldAEB (const 1) (\ri _ rd -> 1 + max ri rd)

cantNodos :: AEB a -> Int
cantNodos = foldAEB (const 1) (\ri _ rd -> 1 + ri + rd)
```

### *∀ x::AB a .altura x ≤ cantNodos x*

---

*Inducción estructural*
---
<strong>*En el caso general, tenemos un tipo de datos inductivo:* </strong>

```LaTeX
data T = CBase1 hparámetrosi
...
| CBasen hparámetrosi
| CRecursivo1 hparámetrosi
...
| CRecursivom hparámetrosi
```
*Principio de inducción estructural*
---
<strong>*Sea P una propiedad acerca de las expresiones tipo T tal que:*
* *P vale sobre todos los constructores base de T,*
* *P vale sobre todos los constructores recursivos de T,
asumiendo como hipótesis inductiva que vale para los
parámetros de tipo T,*

*entonces ∀x :: T. P(x).* </strong>

---

<strong>Para demostrar la propiedad, se utilizará inducción estructural sobre el árbol binario x.</strong>

<strong><u>Caso base:</u> `x = Hoja a`</strong>

```LaTeX
altura x <= cantNodos x
altura Hoja a <= cantNodos Hoja a
```
Por 

`altura = foldAEB (const 1) (\ri _ rd -> 1 + max ri rd)` y,

 `cantNodos = foldAEB (const 1) (\ri _ rd -> 1 + ri + rd)`.

```LaTeX
const 1 a <= const 1 a
1 <= 1
True
```
Y por lo tanto, vale el caso base.

---

<strong><u>Caso inductivo:</u> `x = Bin i r d`</strong>

<strong>*Se asume que vale para los parámetros de tipo `AEB a`, es decir, para `i` y `d`.*</strong>

`TI`: <strong>`P(Bin i r d) = altura (Bin i r d) <= cantNodos (Bin i r d)`</strong>

`HI`: <strong>`P(i) = altura i <= cantNodos i`</strong> y <strong>`P(d) = altura d <= cantNodos d`</strong>

```hs
altura (Bin i r d) <= cantNodos (Bin i r d)
```

Por `altura = foldAEB (const 1) (\ri _ rd -> 1 + max ri rd)` y,

 `cantNodos = foldAEB (const 1) (\ri _ rd -> 1 + ri + rd)`.

```hs
1 + max (altura i) (altura d) <= 1 + (cantNodos i) + (cantNodos d)
max (altura i) (altura d) <= (cantNodos i) + (cantNodos d)
```

Por hipótesis inductiva, `altura i <= cantNodos i` y `altura d <= cantNodos d`.

```hs
max (altura i) (altura d) <= max (cantNodos i) (cantNodos d) <= (cantNodos i) + (cantNodos d)
max (cantNodos i) (cantNodos d) <= (cantNodos i) + (cantNodos d)
```

Por definición de `max`, se tiene que `max a b` es mayor o igual que `a` y `b`. Si al mayor de ellos se le suma el otro, el resultado es mayor o igual que el doble del mayor de ellos. Por lo tanto, se cumple la propiedad.

```hs
max (cantNodos i) (cantNodos d) <= (cantNodos i) + (cantNodos d)
```

Y por lo tanto, vale el caso inductivo.

</font>