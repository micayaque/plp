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
v. ∀ xs::[a] . ∀ x::a . ponerAlFinal x xs = xs ++ (x:[])
vi. reverse = foldr (\x rec -> rec ++ (x:[])) []
vii. ∀ xs::[a] . ∀ x::a . head (reverse (ponerAlFinal x xs)) = x
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

- ## v. ∀ xs::[a] . ∀ x::a . ponerAlFinal x xs = xs ++ (x:[])

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
ponerAlFinal x [] = [] ++ (x:[])
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
foldr (:) (x:[]) [] = [] ++ (x:[])
```
Por la definición de `foldr`, `foldr f z [] = z`
```hs
(x:[]) = [] ++ (x:[])
```
Por `{++} xs ++ ys = foldr (:) ys xs`
```hs
(x:[]) = foldr (:) (x:[]) []
```
Por la definición de `foldr`, `foldr f z [] = z`
```hs
(x:[]) = (x:[])
True
```
Y por lo tanto vale el caso base.

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = ponerAlFinal x xs = xs ++ (x:[])

### P(x:xs) = ponerAlFinal x (x:xs) = (x:xs) ++ (x:[])

```hs
ponerAlFinal x (x:xs) = (x:xs) ++ (x:[])
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
foldr (:) (x:[]) (x:xs) = (x:xs) ++ (x:[])
```
Por la definición de `foldr`, `foldr f z (x:xs) = f x : (foldr f z xs)`
```hs
x : foldr (:) (x:[]) xs = (x:xs) ++ (x:[])
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
x : ponerAlFinal x xs = (x:xs) ++ (x:[])
```
Por la definición de `(++)`, `xs ++ ys = foldr (:) ys xs`
```hs
x : ponerAlFinal x xs = foldr (:) (x:[]) (x:xs)
```
Por la definición de `foldr`, `foldr f z (x:xs) = f x : (foldr f z xs)`
```hs
x : ponerAlFinal x xs = x : foldr (:) (x:[]) xs
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
x : ponerAlFinal x xs = x : ponerAlFinal x xs
True
```
Y por lo tanto vale el caso inductivo.

---

- ## vi. reverse = foldr (\x rec -> rec ++ (x:[])) []

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
reverse [] = foldr (\x rec -> rec ++ (x:[])) []
```
Por `{R0} reverse = foldl (flip (:)) []`
```hs
foldl (flip (:)) [] [] = foldr (\x rec -> rec ++ (x:[])) []
```
Por la definición de `foldl`, `foldl f z [] = z`
```hs
[] = foldr (\x rec -> rec ++ (x:[])) []
```
Por la definición de `foldr`, `foldr f z [] = z`
```hs
[] = []
True
```
Y por lo tanto vale el caso base.

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = reverse xs = foldr (\x rec -> rec ++ (x:[])) xs

### P(x:xs) = reverse (x:xs) = foldr (\x rec -> rec ++ (x:[])) (x:xs)

```hs
reverse (x:xs) = foldr (\x rec -> rec ++ (x:[])) (x:xs)
```
Por `{R0} reverse = foldl (flip (:)) []`
```hs
foldl (flip (:)) [] (x:xs) = foldr (\x rec -> rec ++ (x:[])) (x:xs)
```
Por la definición de `foldl`, `foldl f z (x:xs) = foldl f ac (x : xs) = foldl f (f ac x) xs`
```hs
foldl (flip (:)) (flip (:) [] x) xs = foldr (\x rec -> rec ++ (x:[])) (x:xs)
```
Por la definición de `flip`, `flip f x y = f y x`
```hs
foldl (flip (:)) [x] (xs) = foldr (\x rec -> rec ++ (x:[])) (x:xs)
```
Por la definición de `foldr`, `foldr f z (x:xs) = f x (foldr f z xs)`
```hs
foldl (flip (:)) [x] (xs) = (\x rec -> rec ++ (x:[])) x (foldr (\x rec -> rec ++ (x:[])) xs)

(reverse xs) ++ [x] = foldr (\x rec -> rec ++ (x:[])) xs ++ [x]
```
Y esto vale por `HI`. Y por lo tanto vale el caso inductivo.


---



- ## vii. ∀ xs::[a] ∀ x::a head (reverse (ponerAlFinal x xs)) = x

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
head (reverse (ponerAlFinal x [])) = x
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
head (reverse (foldr (:) (x:[]) [])) = x
```
Por la definición de `foldr`, `foldr f z [] = z`
```hs
head (reverse (x:[])) = x
```
Por `{R0} reverse = foldl (flip (:)) []`
```hs
head (foldl (flip (:)) [] (x:[])) = x
```
Por la definición de `foldl`, `foldl f z [] = z`
```hs
head (x:[]) = x
```
Por la definición de `(:)`, `x:xs` es una lista que tiene a `x` como primer elemento y a `xs` como cola.
```hs
x = x
True
```
Y por lo tanto vale el caso base.

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)

### P(xs) = head (reverse (ponerAlFinal x xs)) = x

### P(x:xs) = head (reverse (ponerAlFinal x (x:xs))) = x

```hs
head (reverse (ponerAlFinal x (x:xs))) = x
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
head (reverse (foldr (:) (x:[]) (x:xs))) = x
```
Por la definición de `foldr`, `foldr f z (x:xs) = f x (foldr f z xs)`
```hs
head (reverse (x : foldr (:) (x:[]) xs)) = x
```
Por `{P0} ponerAlFinal x = foldr (:) (x:[])`
```hs
head (reverse (x : ponerAlFinal x xs)) = x
```
Por `{R0} reverse = foldl (flip (:)) []`
```hs
head (foldl (flip (:)) [] (x : ponerAlFinal x xs)) = x
```
Por la definición de `foldl`, `foldl f z (x:xs) = foldl f (f z x) xs`
```hs
head (foldl (flip (:)) (flip (:) [] x) (ponerAlFinal x xs)) = x
```
Por la definición de `flip`, `flip f x y = f y x`
```hs
head (foldl (flip (:)) (x:) (ponerAlFinal x xs)) = x
```
Por la definición de `foldl`, `foldl f z (x:xs) = foldl f (f z x) xs`
```hs
Por `{R0} reverse = foldl (flip (:)) []`
```hs
head (reverse (ponerAlFinal x xs) ++ [x]) = x
```
Por la definición de `(++)`, `xs ++ ys = foldr (:) ys xs`
```hs
head (foldr (:) [x] (reverse (ponerAlFinal x xs))) = x
```
Por la definición de `foldr`, `foldr f z [] = z`
```hs
head (x : reverse (ponerAlFinal x xs)) = x
```
Por la definición de `head`, `head (x:xs) = x`
```hs
x = x
True
```
Y por lo tanto vale el caso inductivo.


</font>