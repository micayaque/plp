Definir las siguientes funciones para trabajar sobre listas, y dar su tipo. 

Todas ellas deben poder aplicarse a listas $finitas$ e $infinitas$.

---

$\textcolor{aqua}{i.}$ `mapPares`, una versión de `map` que toma una función currificada de dos argumentos y una lista de pares de valores, y devuelve la lista de aplicaciones de la función a cada par.

Pista: recordar curry y uncurry.

```hs
mapPares :: (a -> b -> c) -> [(a, b)] -> [c]
mapPares f [] = []
mapPares f (x:xs) = f (fst x) (snd x) : mapPares f xs
```
Lo que hace mapPares es aplicarle la función f a cada par de la lista de pares (osea lo mismo que hace map).

La función $f$ recibe pares de valores, pero la función map recibe una función que recibe un solo valor. Para solucionar esto, usamos la función `uncurry` que toma una función que recibe dos argumentos y devuelve una función que recibe un par de argumentos.

```hs
mapPares :: (a -> b -> c) -> [(a, b)] -> [c]
mapPares f = map (uncurry f)
```

---

$\textcolor{aqua}{ii.}$ `armarPares`, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento correspondiente a esa posición en cada una de las listas. 

Si una de las listas es más larga que la otra, ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). Esta función en Haskell se llama `zip`.

Pista: aprovechar la currificación y utilizar evaluación parcial.

```hs
armarPares :: [a] -> [b] -> [(a, b)]
armarPares [] _ = []
armarPares _ [] = []
armarPares (x:xs) (y:ys) = (x, y) : armarPares xs ys
```

```hs
armarPares :: [a] -> [b] -> [(a, b)]
armarPares = foldr (\x rec ys ->
                if null ys then []
                else (x, head ys) : rec (tail ys)) (const [])
```
En este caso la función que le pasamos a `foldr` recibe un elemento de la primera lista y una función que recibe la segunda lista y devuelve la lista de pares.

---

$\textcolor{aqua}{iii.}$  `mapDoble`, una variante de `mapPares`, que toma una función currificada de dos argumentos y dos listas (de igual longitud), y devuelve una lista de aplicaciones de la función a cada elemento correspondiente de las dos listas. Esta función en Haskell se llama `zipWith`.

```hs
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f [] _ = []
mapDoble f _ [] = []
mapDoble f (x:xs) (y:ys) = f x y : mapDoble f xs ys
```
```hs
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f = foldr (\ x rec ys -> 
                        if null ys then [] 
                        else f x (head ys) : rec (tail ys)) (const [])
```
