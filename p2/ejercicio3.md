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

```haskell
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
--por D1
length [] = 2 * length []
0 = 2 * 0
0 = 0
```
### Y por lo tanto vale el caso base

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)
### P(xs) = length (duplicar xs) = 2 * length xs
### P(x:xs) = length (duplicar (x:xs)) = 2 * length (x:xs)

```hs
length (duplicar (x:xs)) = 2 * length (x:xs)
--por D2
length (x:x:duplicar xs) = 2 * length (x:xs)
--por L2
1 + length (x:duplicar xs) = 2 * (1 + length xs)
1 + 1 + length (duplicar xs) = 2 + 2 * length xs
2 + length (duplicar xs) = 2 + 2 * length xs
length (duplicar xs) = 2 * length xs
--vale por hipótesis inductiva
```

---

- ## ii. ∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys 

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
length (append [] ys) = length [] + length ys
--por definición de append
length ys = length [] + length ys
--por definición de length
length ys = 0 + length ys
length ys = length ys 
```
### Y por lo tanto vale el caso base

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)
### P(xs) = length (append xs ys) = length xs + length ys 

### P(x:xs) = length (append (x:xs) ys) = length (x:xs) + length ys

```hs
length (append (x:xs) ys) = length (x:xs) + length ys
--por definición de append
length (x:append xs ys) = length (x:xs) + length ys
--por definición de length
1 + length (append xs ys) = 1 + length xs + length ys
    length (append xs ys) = length xs + length ys
--vale por hipótesis inductiva
```

</font>