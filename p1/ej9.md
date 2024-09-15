$\textcolor{aqua}{i.}$ Escribir la función
`sumaMat`, que representa la suma de matrices, usando `zipWith`. 

Representaremos una matriz como la lista de sus filas. Esto quiere decir que cada matriz será una lista finita de listas finitas, todas de la misma longitud, con elementos enteros.

Recordamos que la suma de matrices se define como la suma celda a celda. Asumir que las dos matrices a sumar están bien formadas y tienen las mismas dimensiones.

```hs
sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat [[]] [[]] = []
sumaMat (x:xs) (y:ys) = sumaFila x y : sumaMat xs ys
    where sumaFila [] [] = []
          sumaFila (a:as) (b:bs) = a + b : sumaFila as bs
```
```hs
sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat = zipWith (zipWith (+))

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f [] _ = []
zipWith f _ [] = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
```
zipWith es una función que toma una función y dos listas, y devuelve una lista con los resultados de aplicar la función a los elementos de las listas, en el mismo orden.

En este caso, zipWith (+) toma dos listas de enteros y devuelve una lista con la suma de los elementos de las listas, en el mismo orden.

Por lo tanto zipWith (zipWith (+)) toma dos lista de listas de enteros y a cada una le aplica zipWith (+), que suma los elementos de las listas, en el mismo orden.

---
$\textcolor{aqua}{ii.}$ Escribir la función `trasponer`, que, dada una matriz como las del ítem $i$, devuelva su traspuesta. 

Es decir, en la posición $i, j$ del resultado está el contenido de la posición $j, i$ de la matriz original. 

Notar que si la entrada es una lista de $N$ listas, todas de longitud $M$, la salida debe tener $M$ listas, todas de longitud $N$.

```hs
trasponer :: [[Int]] -> [[Int]]
trasponer ([]:_) = []
trasponer x = ?????

--trasponer [[1, 2, 3], 
--          [4, 5, 6], 
--          [7, 8, 9]] =

    --[[1, 4, 3],
    --[2, 5, 8],
    --[3, 6, 9]]
```

