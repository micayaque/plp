$\textcolor{aqua}{i.)}$ Definir la función `permutaciones :: [a] -> [[a]]`, que dada una lista devuelve todas sus permutaciones

Se recomienda utilizar `concatMap :: (a -> [b]) -> [a] -> [b]`, y también `take` y `drop`.

Aplicación de la función:

`concatMap` aplica la función `(a -> [b])` a cada elemento de la lista `[a]`, generando una lista de listas de tipo `[[b]]`.

Concatenación:

Luego, `concatMap` concatena todas estas listas individuales `([b])` en una sola lista de tipo `[b]`.

```haskell
permutaciones :: [a] -> [[a]]
-- permutaciones = foldr (concatMap . agregarEnTodasLasPosiciones) [[]]
--     where   agregarEnTodasLasPosiciones j js = [ fst h ++ [j]++ snd h | h <- partir js]
--             partir xs = [splitAt n xs | n <- [0..(length xs)]]
permutaciones =  foldr (\x rec -> concatMap (\ys -> [take n ys ++ [x] ++ drop n ys | n <- [0..length ys]]) rec) [[]]
```
---
$\textcolor{aqua}{ii.)}$ Definir la función `partes`, que recibe una lista `L` y devuelve la lista de todas las listas formadas por los mismos elementos de `L`, en su mismo orden de aparición. 

Ejemplo: `partes [5, 1, 2] → [[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]]`(en algún orden).

```haskell
partes :: [a] -> [[a]]
partes = foldr (\x res -> res ++ map (x:) res) [[]]
```
---
$\textcolor{aqua}{iii.)}$ Definir la función `prefijos`, que dada una lista, devuelve todos sus prefijos.

Ejemplo: `prefijos [5, 1, 2] → [[], [5], [5, 1], [5, 1, 2]]`.
```haskell
prefijos :: [a] -> [[a]]
prefijos = foldr (\x res -> []:map (x:) res) [[]]
--prefijos xs = [take i xs | i <- [0..(length xs)]]
```
---
$\textcolor{aqua}{iv.)}$ Definir la función `sublistas` que, dada una lista, devuelve todas sus sublistas (listas de elementos que aparecen consecutivos en la lista original).

Ejemplo: `sublistas [5, 1, 2] → [[], [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]]` (en algún orden).
```haskell
sublistas :: [a] -> [[a]]
sublistas xs = [] : [ take j (drop i xs) | i<-[0..(length xs)] , j<-[1.. length xs -i]]
```