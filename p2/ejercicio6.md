<font face="LaTeX">

<strong>*Dadas las siguientes funciones:* </strong>

```haskell
nub :: Eq a => [a] -> [a]
{N0} nub [] = []
{N1} nub (x:xs) = x : filter (\y -> x /= y) (nub xs)

union :: Eq a => [a] -> [a] -> [a]
{U0} union xs ys = nub (xs++ys)

intersect :: Eq a => [a] -> [a] -> [a]
{I0} intersect xs ys = filter (\e -> elem e ys) xs
```

<strong>*Indicar si las siguientes propiedades son verdaderas o falsas. Si son verdaderas, realizar una demostración. Si
son falsas, presentar un contraejemplo.*</strong>

```LaTex
i. Eq a => ∀ xs::[a] . ∀ e::a . ∀ p::a -> Bool . elem e xs && p e = elem e (filter p xs)

ii.  Eq a => ∀ xs::[a] . ∀ e::a    . elem e xs = elem e (nub xs)

iii. Eq a => ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)

iv.Eq a => ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (intersect xs ys) = (elem e xs) && (elem e

v. Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) = length xs + length ys ys)

vi.  Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) ≤ length xs + length ys
```

---

### i. Eq a => ∀ xs::[a] . ∀ e::a . ∀ p::a -> Bool . elem e xs && p e = elem e (filter p xs)



---
### ii. Eq a => ∀ xs::[a] . ∀ e::a . elem e xs = elem e (nub xs)

La propiedad es verdadera. Se puede demostrar por el principio de inducción estructural sobre la estructura de la lista `xs`.

---

<u>Caso base</u>: `xs = []`

```haskell
elem e [] = elem e (nub []) = elem e []
```
Por definición de nub:
```haskell
False = elem e []
False = False    
True
```

---

<u>Caso inductivo</u>:

HI: P(xs) = `elem e xs = elem e (nub xs)`

TI: P((x:xs)) = `elem e (x:xs) = elem e (nub (x:xs))`

Por {N1} `nub (x:xs) = x : nub (filter (\y -> x /= y) xs)`, entonces:

```haskell
elem e (x:xs)       = elem e (nub (x:xs))
e == x || elem e xs = elem e (x : nub (filter (\y -> x /= y) xs))
e == x || elem e xs = elem e (x : nub xs)
e == x || elem e xs = e == x || elem e (nub xs)
```
* Si e == x entonces `True = True` y la propiedad es trivialmente verdadera.
* Si e != x entonces `elem e xs = elem e (nub xs)` y por HI se cumple la propiedad.

---


### iii. Eq a => ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)

La propiedad es verdadera. Se puede demostrar por el principio de inducción estructural sobre la estructura de la lista `xs`.

---

<u>Caso base</u>: `xs = []`

```haskell
elem e (union [] ys) = (elem e []) || (elem e ys)
```
Por {U0} `union [] ys = nub ([]++ys) = nub ys`, entonces:

```haskell
elem e (nub ys) = (elem e []) || (elem e ys)
elem e (nub ys) = False || elem e ys
elem e (nub ys) = elem e ys
```

Por definición de nub si elem e ys es verdadero entonces elem e (nub ys) también lo es.

---

<u>Caso inductivo</u>:

HI: P(xs) = `elem e (union xs ys) = (elem e xs) || (elem e ys)`

TI: P((x:xs)) = `elem e (union (x:xs) ys) = (elem e (x:xs)) || (elem e ys)`

Por {U0} `union (x:xs) ys = nub ((x:xs)++ys) = nub (x:(xs++ys))`, entonces:

```haskell
elem e (union (x:xs) ys) = (elem e (x:xs)) || (elem e ys)
elem e (x : union xs ys) = (e == x) || (elem e xs) || (elem e ys)
e == x || elem e (union xs ys) = (e == x) || elem e xs || elem e ys
```
Si e == x entonces,

```haskell
True = True
True
```

Si e != x entonces,

```haskell
elem e (union xs ys) = elem e xs || elem e ys
```
Es verdadero por HI. Por lo tanto, la propiedad es verdadera.

---

### iv. Eq a => ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (intersect xs ys) = (elem e xs) && (elem e ys)

Podemos probarlo usando el principio de inducción sobre listas en `xs`.

---

<u>Caso base</u>: `xs = []`
```haskell
elem e (intersect [] ys) = (elem e []) && (elem e ys)
elem e (intersect [] ys) = False && elem e ys
```

Por extencionalidad funcional y por `{I0}: intersect xs ys = filter (\e -> elem e ys) xs`

```haskell
elem e (filter (\e -> elem e ys) []) = False
```
Por la definición de filter, si la lista es vacía entonces el resultado es la lista vacía.
```haskell
elem e [] = False
False = False
True
```

---

<u>Caso inductivo</u>:

HI: P(xs) = `elem e (intersect xs ys) = (elem e xs) && (elem e ys)`

TI: P((x:xs)) = `elem e (intersect (x:xs) ys) = (elem e (x:xs)) && (elem e ys)`

Por la definición de elem:
```haskell
elem e (intersect (x:xs) ys)         = elem e (x:xs) && elem e ys
elem e (x : intersect xs ys)         = (e == x  || elem e xs) && elem e ys
(e == x) || elem e (intersect xs ys) = (e == x) || elem e xs  && elem e ys
```

* Si `e==x` entonces trivialmente ya se cumple la propiedad porque nos queda `True == True`
* Si `e!=x` entonces nos queda:
```haskell
elem e (intersect xs ys) = elem e xs && elem e ys
``` 
y por `HI` se cumple la propiedad.

---

### iv. Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) = length xs + length ys

Podemos probarlo por el principio de inducción sobre la estructura de la lista `xs`.

---

<u>Caso base</u>: `xs = []`

```haskell
length (union [] ys) = length [] + length ys
```
Por {U0}
{N1} nub (x:xs) = x : nub (filter (\y -> x /= y) xs)

```haskell
length (nub [] ++ ys) = length [] + length ys
```
Por definición de ++ y de length
```haskell
length (nub ys) = 0 + length ys
```
Por {N1}
```haskell
length (ys') = length ys
--donde ys' = ys sin repetidos
```
<strong>*Asumiendo que ys no tiene repetidos podemos decir que se cumple la propiedad, de lo contrario, esta propiedad es Falsa.*</strong>

---

<u>Caso inductivo</u>:

HI: `P(xs)` = `length (union xs ys) = length xs + length ys`

TI: `P((x:xs))` = `length (union (x:xs) ys) = length (x:xs) + length ys`

```haskell
length (union (x:xs) ys) = length (x:xs) + length ys
length (nub (x:xs) ++ ys) = length (x:xs) + length ys
length (nub (x:xs) ++ ys) = 1 + length xs + length ys
```
* Si `x` está en `xs` entonces (x:xs) tiene repetidos `nub (x:xs) = nub xs` y `length (nub (x:xs) ++ ys) < length xs + length ys` porque nub xs tiene menos elementos que xs por eliminar los repetidos.

Así es que nuevamente la propiedad solo vale si la lista (x:xs) no tiene repetidos.

```haskell
length (nub xs ++ ys) = length xs + length ys
```

Se cumple por HI

* Si `x` no está en `xs` entonces `nub (x:xs) = x : nub xs` 
y `length (nub (x:xs) ++ ys) = 1 + length xs + length ys` 

```haskell
1 + length (nub xs ++ ys) = 1 + length xs + length ys
length (nub xs ++ ys) = length xs + length ys
```

por lo que se cumple la propiedad por HI.

---

### v. Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) ≤ length xs + length ys

Podemos probarlo por el principio de inducción sobre la estructura de la lista `xs`.

---

<u>Caso base</u>: `xs = []`

```haskell
length (union [] ys) ≤ length [] + length ys
```
Por la definición de `union` y `length`
```haskell
length (ys) ≤ 0 + length ys
```
Que es trivialmente verdadero.

---

<u>Caso inductivo</u>:

HI: `P(xs)` = `length (union xs ys) ≤ length xs + length ys`

TI: `P((x:xs))` = `length (union (x:xs) ys) ≤ length (x:xs) + length ys`

```haskell
length (union (x:xs) ys) ≤ length (x:xs) + length ys
```
* Si `x` está en `xs` entonces `union (x:xs) ys = union xs ys`

Por la definición de `length`
```haskell 
length (union xs ys) ≤ 1 + length xs + length ys
```
Que es verdadero por la HI.

* Si `x` no está en `xs` entonces:

    * Si x no está en ys `union (x:xs) ys = x : union xs ys` 
    ```haskell
    length (x : union xs ys) ≤ 1 + length xs + length ys
    1 + length (union xs ys) ≤ 1 + length xs + length ys
    length (union xs ys) ≤ length xs + length ys
    ```
    Es verdadero por HI.

    * Si x está en ys `union (x:xs) ys = union xs ys` y este caso ya lo habíamos probado más arriba.

Como la propiedad se cumple para todos los casos, es verdadera.

</font>
