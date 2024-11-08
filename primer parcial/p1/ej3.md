Esquemas de recursión
---
$\textcolor{aqua}{i.)}$ Redefinir usando `foldr` las funciones `sum`, `elem`, `(++)`, `filter` y `map`.
```haskell
sum' :: Num a => [a] -> a
sum' = foldr (+) 0
```haskell
elem' :: Eq a => a -> [a] -> Bool
elem' x = foldr (\y rec -> y == x || rec) False
```
```haskell
concat' :: [[a]] -> [a]
concat' = foldr (++) []
```
```haskell
filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x rec -> if f x then x : rec else rec) []
```
```haskell
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x rec -> f x : rec) []
```
---
$\textcolor{aqua}{ii.)}$ Definir la función `mejorSegún :: (a -> a -> Bool) -> [a] -> a`, que devuelve el máximo elemento de la lista según una función de comparación, utilizando `foldr1`. 

Por ejemplo, `maximum = mejorSegún (>)`.
```haskell
mejorSegún :: (a -> a -> Bool) -> [a] -> a
mejorSegún f = foldr1 (\x rec -> if f x rec then x else rec)
```
---
$\textcolor{aqua}{iii.)}$ Definir la función `sumasParciales :: Num a => [a] -> [a]`, que dada una lista de números devuelve otra de la misma longitud, que tiene en cada posición la suma parcial de los elementos de la lista original desde la cabeza hasta la posición actual. 

Por ejemplo, `sumasParciales [1,4,-1,0,5] -> [1,5,4,4,9]`.
```haskell
sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldr (\x rec -> x + head rec : rec) [0]
```
---
$\textcolor{aqua}{iv.)}$ Definir la función `sumaAlt`, que realiza la suma alternada de los elementos de una lista. 

Es decir, da como resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. Usar foldr.
```haskell
sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0
```
---
$\textcolor{aqua}{v.)}$ Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo, etc.). 

Pensar qué esquema de recursión conviene usar en este caso.
```haskell
sumaAltInv :: Num a => [a] -> a
sumaAltInv = foldl (-) 0
```