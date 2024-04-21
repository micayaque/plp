<font face="LaTeX">

### *Considerar las siguientes funciones:*

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

### *Demostrar las siguientes propiedades:*

```LaTeX
i.   ∀ xs::[a] . length (duplicar xs) = 2 * length xs
ii.  ∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys
iii. ∀ xs::[a] . ∀ f::(a->b) . length (map f xs) = length xs
iv.  ∀ xs::[a] . ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True)
(asumiendo Eq a)
v. ∀ xs::[a] . ∀ x::a . length (ponerAlFinal x xs) = 1 + length xs
vi. ∀ xs::[a] . ∀ x::a . head (reverse (ponerAlFinal x xs)) = x
```

## <u>Principio de inducción sobre listas</u>
```haskell
data [a] = [] | a : [a]
```

### Sea P una propiedad sobre expresiones de tipo [a] tal que:
- ### P([])
- ### ∀x :: a. ∀xs :: [a]. (P(xs) H.I. ⇒ P(x : xs)) T.I.

### Entonces ∀xs :: [a]. P(xs).

---

- ## i. ∀ xs::[a] length (duplicar xs) = 2 * length xs

Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
length (duplicar []) = 2 * length []
```
Por `{D0} duplicar [] = []`
```hs
length [] = 2 * length []
```
Por `{L0} length [] = 0`
```hs
0 = 2 * 0
0 = 0
True
```
Y por lo tanto vale el caso base.

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)
### P(xs) = length (duplicar xs) = 2 * length xs
### P(x:xs) = length (duplicar (x:xs)) = 2 * length (x:xs)

```hs
length (duplicar (x:xs)) = 2 * length (x:xs)
```
Por `{D1} duplicar (x:xs) = x : x : duplicar xs`
```hs
length (x:x:duplicar xs) = 2 * length (x:xs)
```
Por `{L1} length (x:xs) = 1 + length xs`
```hs
1 + length (x:duplicar xs) = 2 * (1 + length xs)
1 + 1 + length (duplicar xs) = 2 + 2 * length xs
2 + length (duplicar xs) = 2 + 2 * length xs
length (duplicar xs) = 2 * length xs
```
Que esto vale por `HI`. Y por lo tanto vale el caso inductivo.

---

- ## ii. ∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys 

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
length (append [] ys) = length [] + length ys
```
Por `{A0} append [] ys = ys`
```hs
length ys = length [] + length ys
```
Por `{L0} length [] = 0`
```hs
length ys = 0 + length ys
length ys = length ys 
True
```
Y por lo tanto vale el caso base.

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)
### P(xs) = length (append xs ys) = length xs + length ys 

### P(x:xs) = length (append (x:xs) ys) = length (x:xs) + length ys

```hs
length (append (x:xs) ys) = length (x:xs) + length ys
```
Por `{A1} append (x:xs) ys = x : append xs ys`
```hs
length (x:append xs ys) = length (x:xs) + length ys
```
Por `{L1} length (x:xs) = 1 + length xs`
```hs
1 + length (append xs ys) = 1 + length xs + length ys
    length (append xs ys) = length xs + length ys
```
Que esto vale por `HI`. Y por lo tanto vale el caso inductivo.

- ## iii. ∀ xs::[a] ∀ f::(a&rarr;b) length (map f xs) = length xs

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
length (map f []) = length []
```
Por la definición de `map`, `map f [] = []`
```hs
length [] = length []
True
```
Y por lo tanto vale el caso base

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = length (map f xs) = length xs

### P(x:xs) = length (map f (x:xs)) = length (x:xs)

```hs
length (map f (x:xs)) = length (x:xs)
```
Por la definición de `map`, `map f (x:xs) = f x : map f xs` y por `{L1} length (x:xs) = 1 + length xs`
```hs
length (f x : map f xs) = 1 + length xs
```
Por `{L1} length (f x : map f xs) = 1 + length xs`
```hs
1 + length (map f xs) = 1 + length xs
    length (map f xs) = length xs
```
Que esto vale por hipótesis inductiva. Y por lo tanto vale el caso inductivo.

---

- ## iv. ∀ xs::[a] ∀ p::a&rarr;Bool ∀ e::a (elem e (filter p xs) = True) ⇒ (elem e xs = True)

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
(elem e (filter p []) = True) ⇒ (elem e [] = True)
```
Por la definición de `filter`, `filter p [] = []`
```hs
(elem e [] = True) ⇒ (elem e [] = True)
```
Por la definición de `elem`, `elem e [] = False`
```hs
(False = True) ⇒ (False = True)
False ⇒ False
True
```
Y por lo tanto vale el caso base.

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = (elem e (filter p xs) = True) ⇒ (elem e xs = True)

### P(x:xs) = (elem e (filter p (x:xs)) = True) ⇒ (elem e (x:xs) = True)

```hs
(elem e (filter p (x:xs)) = True) ⇒ (elem e (x:xs) = True)
```
Por la definición de `filter`, `filter p (x:xs) = if p x then x : filter p xs else filter p xs`
```hs
(elem e (if p x then x : filter p xs else filter p xs) = True) ⇒ (elem e (x:xs) = True)
```
Por la definición de `elem`, `elem e (if p x then x : filter p xs else filter p xs) = e == x || elem e (filter p xs)`

* Si `p x` es verdadero.

    ```hs
    elem e (x:filter p xs) = True ⇒ elem e (x:xs) = True
    (e == x || elem e (filter p xs)) = True ⇒ (e == x || elem e xs) = True
    ```
    * Si `e == x` entonces nos queda `True ⇒ True` que es trivialmente verdadero.
    * Si `e != x` :
        ```hs
        elem e (filter p xs) = True ⇒ elem e xs = True
        ```
        Que esto vale por hipótesis inductiva.

* Si `p x` es falso.

    ```hs
    elem e (filter p xs) = True ⇒ elem e (x:xs) = True
    elem e (filter p xs) = True ⇒ (e == x || elem e xs) = True
    ```
    Como la implicación para que sea verdadera sólo necesita implicar una de las dos proposiciones del lado derecho de la implicación, entonces esto vale por HI.

---

- ## v. ∀ xs::[a] ∀ x::a length (ponerAlFinal x xs) = 1 + length xs

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
length (ponerAlFinal x []) = 1 + length []
--por P0 y foldr 
--ponerAlFinal x [] = (f x [] = [x])
length [x] = 1 + length []
1 + length [] = 1 + 0
1 + 0 = 1
1 = 1
```

### Y por lo tanto vale el caso base

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = length (ponerAlFinal x xs) = 1 + length xs

### P(x:xs) = length (ponerAlFinal x (x:xs)) = 1 + length (x:xs)

```hs
length (ponerAlFinal x (x:xs)) = 1 + length (x:xs)
--por P0 y foldr
length (ponerAlFinal x (x:xs)) = length (x:xs) + 1
1 + length(ponerAlFinal x (xs)) = 1 + 1 + length xs
length (ponerAlFinal x (xs)) = 1 + length xs
--vale por hipótesis inductiva
```

### Y por lo tanto vale el caso inductivo

---

- ## vi. ∀ xs::[a] ∀ x::a head (reverse (ponerAlFinal x xs)) = x

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
head (reverse (ponerAlFinal x [])) = x
--por P0 y foldr
head (reverse (f x [])) = x
head (reverse [x]) = x
head [x] = x
x = x
```

### Y por lo tanto vale el caso base

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = head (reverse (ponerAlFinal x xs)) = x

### P(x:xs) = head (reverse (ponerAlFinal x (x:xs))) = x

```hs
head (reverse (ponerAlFinal x (x:xs))) = x
--poner al final pone x al final de la lista y reverse tiene como primer elemento al último de la lista
--por lo que el head de la lista invertida es x
--por {R0} reverse = foldl (flip (:)) []
--por {P0} ponerAlFinal x = foldr (:) (x:[])
head(reverse(x' : ponerAlFinal x xs)) = x
head(foldl ponerAlFinal x xs ++ [x']) = x
head(x : foldl ponerAlFinal x'' xs ++ [x]) = x
head(x:resto) = x
x = x
True
```

### Y por lo tanto vale el caso inductivo

</font>