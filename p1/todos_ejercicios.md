

Ejercicio 1
---
Currificación y tipos
---
#### Considerar las siguientes definiciones de funciones:
$\textcolor{purple}{(i.)}$ ¿Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float).

```haskell
max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y
```
```haskell
normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)
```
```haskell
subtract2 :: Float -> Float -> Float
subtract2 = flip (-)
```
```haskell
predecesor :: Float -> Float
predecesor = subtract 1
```
```haskell
evaluarEnCero :: (Float -> r) -> r
evaluarEnCero = \f -> f 0
```
```haskell
dosVeces :: (a -> a) -> a -> a
dosVeces = \f -> f . f
```
```haskell
flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = map flip
```
```haskell
flipRaro :: b -> (a -> b -> c) -> a -> c
flipRaro = flip flip
```
---

$\textcolor{purple}{(ii.)}$ Indicar cuáles de las funciones anteriores no están currificadas. 
```haskell
max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y
```
```haskell
normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)
```
---

Para cada una de ellas, definir la función currificada correspondiente. 

Recordar dar el tipo de la función.
```haskell
max2 :: Float -> Float -> Float
max2 x y = if x >= y then x else y
```
```haskell
normaVectorial' :: Float -> Float -> Float
normaVectorial' x y = sqrt (x^2 + y^2)
```

Ejercicio 2
---

$\textcolor{aqua}{(i.)}$ Definir la función `curry`, que dada una función de dos argumentos, devuelve su equivalente currificada.
```haskell
curry :: ((a, b) -> c) -> a -> b -> c
curry f x y = f (x, y)
```
---
$\textcolor{aqua}{(ii.)}$ Definir la función `uncurry`, que dada una función currificada de dos argumentos, devuelve su versión no currificada equivalente. 

Es la inversa de la anterior.
```haskell
uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (x, y) = f x y
```
---
$\textcolor{aqua}{(iii.)}$ ¿Se podría definir una función `curryN`, que tome una función de un número arbitrario de argumentos y devuelva su versión currificada?

Sugerencia: pensar cuál sería el tipo de la función.

No, no se puede definir una función curryN, ya que no se puede definir una función que tome un número arbitrario de argumentos.

Ejercicio 3
---

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

Ejercicio 4
---

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

Ejercicio 5
---

### Considerar las siguientes funciones:

Indicar si la recursión utilizada en cada una de ellas es o no estructural. Si lo es, reescribirla utilizando foldr.
En caso contrario, explicar el motivo.

```haskell
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                        then [x]
                                    else x : elementosEnPosicionesPares (tail xs)
```

La recursión utilizada no es recursión estructural porque no sigue el esquema de hacer algo con la cabeza y la cola de la lista sino que usa la cabeza y la cola de la cola de la lista.

```haskell
entrelazar :: [a] -> [a] -> [a]
entrelazar []   = id
entrelazar (x:xs) = \ys ->  if null ys
                                then x : entrelazar xs []
                            else x : head ys : entrelazar xs (tail ys)
```

Esta función sí, sigue el esquema de recursión estructural.

```haskell
entrelazar :: [a] -> [a] -> [a]
entrelazar xs = foldr (\ x rec -> (ys -> if null ys 
                                then x : rec [] 
                            else x : head ys : rec tail ys)) id
```

Ejercicio 6
---

#### El siguiente esquema captura la $\textcolor{purple}{\underline{recursión\ primitiva}}$ sobre listas.
```haskell
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z []         = z
recr f z (x : xs)   = f x xs (recr f z xs)
```
**a.** Definir la función `sacarUna :: Eq a => a -> [a] -> [a]`
, que dados un **elemento** y una **lista** devuelve el resultado de eliminar de la lista la primera aparición del elemento (si está presente).

```haskell
sacarUna :: a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if e==x then xs else x:rec) []
```

---

**b.** Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función `sacarUna` del punto anterior.

El esquema foldr continuaría procesando los elementos de la lista hasta el final.
Con recr podemos directamente retornar la cola de la lista y dejar de procesar el resto de los elementos.

---

**c.** Definir la función `insertarOrdenado
:: Ord a => a -> [a] -> [a]` que inserta un elemento en una lista ordenada (de manera creciente), de manera que se preserva el ordenamiento.

```haskell
--versión naive
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e []       = [e]
insertarOrdenado e (x:xs)   =   if e <= x 
                                    then e:x:xs 
                                else x:insertarOrdenado e xs
```

```haskell
--versión recr
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr (\x xs rec -> if e <= x 
                                            then e:x:xs
                                        else x:rec) [e]
```

Ejercicio 7
---

$\textcolor{aqua}{(i.)}$ Definir la función `genLista :: a -> (a -> a) -> Integer -> [a]`, que genera una lista de una cantidad dada de elementos, a partir de un elemento inicial y de una función de incremento entre los elementos
de la lista. Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente.

```haskell
genLista :: a -> (a -> a) -> Integer -> [a]
genLista i f n = if n ==0 then [] else f i : genLista (f i) f (n-1)
```
---

**$\textcolor{aqua}{(ii.)}$** Usando
genLista, definir la función `desdeHasta`, que dado un par de números (el primero menor que el
segundo), devuelve una lista de números consecutivos desde el primero hasta el segundo.


```haskell
desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta d h = if d==h then [h] else d:desdeHasta (d+1) h
```

```haskell
desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta x y = genLista x (+1) (y-x+1) 
```

Ejercicio 8
---

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

Ejercicio 9
---

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

---

Ejercicio 10
---

Otras estructuras de datos
---
En esta sección se permite (y se espera) el uso de recursión explícita únicamente para la definición de esquemas de recursión.

$\textcolor{aqua}{i.}$ Definir y dar el tipo del esquema de recursión `foldNat` sobre los naturales. 

Utilizar el tipo Integer de Haskell (la función va a estar definida sólo para los enteros mayores o iguales que 0).

```haskell
foldNat :: (Integer -> b -> b) -> b -> Integer -> b
foldNat cSucc cZero n = case n of
                    0 -> cZero 
                    _ -> cSucc n rec
        where rec = foldNat cSucc cZero (n-1)
```

---

$\textcolor{aqua}{ii.}$ Utilizando foldNat, definir la función potencia.

```haskell
potencia :: Integer -> Integer -> Integer
potencia n = foldNat (\_ rec -> rec*n) 1
```

Ejercicio 11
---

Definir el esquema de recursión estructural para el siguiente tipo:
```hs
data Polinomio a =  X
                |   Cte a 
                |   Suma (Polinomio a) (Polinomio a)
                |   Producto (Polinomio a) (Polinomio a)
```
Luego usar el esquema definido para escribir la función `evaluar :: Num a => a -> Polinomio a -> a` que, dado un número y un polinomio, devuelve el resultado de evaluar el polinomio dado en el número dado.

```hs
foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> a -> b
foldPoli cX cCte cSuma cProd poli = caso poli of
    X -> cX
    Cte a -> cCte a
    Suma p1 p2 -> cSuma (rec p1) (rec p2)
    Producto p1 p2 -> cProd (rec p1) (rec p2)
    where rec = foldPoli cX cCte cSuma cProd
```

```haskell
evaluar :: Num a => a -> Polinomio a -> a
evaluar n = foldPoli n id (+) (*)
```

Ejercicio 12
---

Considerar el siguiente tipo, que representa a los árboles binarios:
```hs
data AB a = Nil | Bin (AB a) a (AB a)
```

$\textcolor{aqua}{i.}$ Usando recursión explícita, definir los esquemas de recursión estructural (foldAB) y primitiva (recAB), y dar sus tipos.

```hs
foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d)
        where rec = foldAB cBin cNil
```
```hs
recAB :: (a -> b -> b -> AB a -> AB a -> b) -> b -> AB a -> b
recAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d) i d
        where rec = recAB cBin cNil
```

---
$\textcolor{aqua}{ii.}$ Definir las funciones esNil, altura y cantNodos (para esNil puede utilizarse case en lugar de foldAB o recAB).

```hs
esNil :: AB a -> Bool
esNil arbol = case arbol of
                Nil -> True
                _ -> False
```
```hs
altura :: AB a -> Integer
altura  = foldAB (\r rec_i rec_d -> 1 + max rec_i rec_d) 0
```

```hs
cantNodos :: AB a -> Integer
cantNodos = foldAB (\r rec_i rec_d -> 1 + rec_i + rec_d) 0
```
---
$\textcolor{aqua}{iii.}$ Definir la función `mejorSegún :: (a -> a -> Bool) -> AB a -> a`, análoga a la del ejercicio 3, para árboles.

Se recomienda definir una función auxiliar para comparar la raíz con un posible resultado de la recursión
para un árbol que puede o no ser Nil.

```hs
mejorSegun :: Num a => (a -> a -> Bool) -> AB a -> a
mejorSegun f = foldAB (\i r d -> if f i d && f i r then i 
                                     else (if f d r then d else r)) (error "no hay mejor en nil")

```

---

$\textcolor{aqua}{iv.}$ Definir la función `esABB :: Ord a => AB a -> Bool` que chequea si un árbol es un árbol binario de búsqueda.

Recordar que, en un árbol binario de búsqueda, el valor de un nodo es mayor o igual que los valores que aparecen en el subárbol izquierdo y es estrictamente menor que los valores que aparecen en el subárbol derecho.

```hs
esABB :: Ord a => AB a -> Bool
esABB = recAB (\r rec_i rec_d (Bin i1 r1 d1) (Bin i2 r2 d2) -> rec_d && rec_i && r >= r1 && r <= r2) True
```

---
$\textcolor{aqua}{v.}$ Justificar la elección de los esquemas de recursión utilizados para los tres puntos anteriores.

$\textcolor{aqua}{i.}$ En el caso de definir un esquema de recursión sólo puede hacerse con recursión explćita.

$\textcolor{aqua}{ii.}$
* `esNil`sólo necesita comparar en el caso `Nil` por lo que no necesita recorrer todo el árbol
* `altura` necesitamos recorrer todo el árbol y no necesitamos información sobre la estructura del árbol además de la recursión por lo cual uso fold
* `cantNodos` ídem `altura`

$\textcolor{aqua}{iii.}$ Para saber si un árbol es ABB necesitamos comparar a cada nodo con la raíz de sus respectivos subárboles por lo cual necesitamos información de la estructura además de la recursión


Ejercicio 13
---

Dado el tipo `AB a` del ejercicio 12:

```hs
data AB a = Nil | Bin (AB a) a (AB a)
```
```hs
foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB cNil cBin arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d)
        where rec = foldAB cNil cBin
```
$\textcolor{aqua}{i.}$ Definir las funciones `ramas` (caminos desde la raíz hasta las hojas), `cantHojas` y `espejo`.

```hs
ramas :: AB a -> [[a]]
ramas Nil = [[]]
ramas (Bin i r d) = concatTodas r (ramas i) ++ concatTodas r (ramas d)
        where   concatTodas a = map (a:)
```
```hs
ramas :: AB a -> [[a]]
ramas = foldAB (\r i d -> map (r:) i ++ map (r:) d) [[]]
```

```hs
cantHojas :: AB a -> Int
cantHojas Nil = 0
cantHojas (Bin i r d) = 1 + cantHojas i + cantHojas d
```

```hs
cantHojas :: AB a -> Int
cantHojas = foldAB (\r rec_i rec_d -> 1 + rec_i + rec_d) 0
```

```hs
espejo :: AB a -> AB a
espejo Nil = Nil
espejo (Bin i r d) = Bin (espejo d) r (espejo i)
```

```hs
espejo :: AB a -> AB a
espejo = foldAB (\r rec_i rec_d -> Bin rec_d r rec_i) Nil
```

---
$\textcolor{aqua}{ii.}$ Definir la función
`mismaEstructura :: AB a -> AB b -> Bool` que, dados dos árboles, indica si éstos tienen la misma forma, independientemente del contenido de sus nodos.

Pista: usar evaluación parcial y recordar el ejercicio 8.

```hs
mismaEstructura :: AB a -> AB b -> Bool
mismaEstructura Nil Nil = True
mismaEstructura Nil Bin{} = False
mismaEstructura Bin{} Nil = False
mismaEstructura (Bin i1 _ d1) (Bin i2 _ d2) = mismaEstructura i1 i2 && mismaEstructura d1 d2
```

```hs
mismaEstructura :: AB a -> AB b -> Bool
mismaEstructura = recAB (\_ rec_i1 rec_d1 i1 d1 a -> not(esNil a) &&
                                                        esNil i1 == esNil(izq a)&&
                                                        esNil d1 == esNil(der a)&&
                                                        rec_i1 (izq a) &&
                                                        rec_d1 (der a)) esNil
```


Ejercicio 14
---

Se desea modelar en Haskell los árboles con información en las hojas (y sólo en ellas). 

Para esto introduciremos el siguiente tipo:

```haskell
data AIH a = Hoja a | Bin (AIH a) (AIH a)
```
$\textcolor{aqua}{a)}$ Definir el esquema de recursión estructural `foldAIH` y dar su tipo. 

Por tratarse del primer esquema de recursión que tenemos para este tipo, se permite usar recursión explícita.

```hs
foldAIH :: (a -> b) -> (b -> b -> b) -> AIH a -> b
foldAIH cHoja cBin (Hoja x) = cHoja x
foldAIH cHoja cBin (Bin i d) = cBin (rec i) (rec d)
    where rec = foldAIH cHoja cBin
```

---
$\textcolor{aqua}{b)}$ Escribir las funciones `altura
:: AIH a -> Integer` y `tamaño :: AIH a -> Integer`.

Considerar que la altura de una hoja es $1$ y el tamaño de un `AIH` es su cantidad de hojas.

```hs
altura :: AIH a -> Integer
altura (Hoja _) = 1
altura (Bin i d) = 1 + max (altura i) (altura d)
```

```hs
altura :: AIH a -> Integer
altura = foldAIH (const 1) (\rec_i rec_d -> 1 + max rec_i rec_d)
```

```hs
tamaño :: AIH a -> Integer
tamaño (Hoja _) = 1
tamaño (Bin i d) = tamaño i + tamaño d
```

```hs
tamaño :: AIH a -> Integer
tamaño = foldAIH (const 1) (+)
```


Ejercicio 15
---

$\textcolor{aqua}{i.}$ Definir el tipo `RoseTree` de árboles no vacíos, con una cantidad indeterminada de hijos para cada nodo.

```haskell
data RoseTree a = Rose a [RoseTree a]
```

---
$\textcolor{aqua}{ii.}$ Escribir el esquema de recursión estructural para `RoseTree`. Importante escribir primero su tipo.

```haskell
foldRoseTree :: (a -> [b] -> b) -> RoseTree a -> b
foldRoseTree cRose (Rose x xs) = cRose x (map rec xs)
  where rec = foldRoseTree cRose
```

---
$\textcolor{aqua}{iii.}$ Usando el esquema definido, escribir las siguientes funciones:

$\textcolor{aqua}{a)}$ `hojas`, que dado un `RoseTree`, devuelva una lista con sus hojas ordenadas de izquierda a derecha, según su aparición en el `RoseTree`.

```haskell
hojas :: RoseTree a -> [a]
hojas (Rose a []) = [a]
hojas (Rose _ xs) = concatMap hojas xs
```
`concatMap` le aplica hojas a cada `RoseTree` en la lista `xs`, consigue una lista de hojas para cada `RoseTree` y luego concatena todas esas listas teniendo así todas las hojas del RoseTree original

```haskell
hojas :: RoseTree a -> [a]
hojas = foldRoseTree (\x rec -> if null rec then [x] else concat rec)
```
En este caso usamos concat porque rec ya es una lista de listas de hojas.

---
$\textcolor{aqua}{b)}$ `distancias`, que dado un `RoseTree`, devuelva las distancias de su raíz a cada una de sus hojas.

```haskell
distancias :: RoseTree a -> [Int]
distancias (Rose _ []) = [0]
distancias (Rose _ xs) = map (+1) (concatMap distancias xs)
```

```haskell
distancias :: RoseTree a -> [Int]
distancias = foldRoseTree (\_ rec -> if null rec then [0] else map (+1) (concat rec))
```

---
$\textcolor{aqua}{c)}$ `altura`, que devuelve la altura de un `RoseTree` (la cantidad de nodos de la rama más larga). 

Si el `RoseTree` es una hoja, se considera que su altura es $1$.

```haskell
altura :: RoseTree a -> Int
altura (Rose _ []) = 1
altura (Rose _ xs) = 1 + maximum (map altura xs)
```

```haskell
altura :: RoseTree a -> Int
altura = foldRoseTree (\_ hijos -> if null hijos then 1 else 1 + maximum hijos)
```