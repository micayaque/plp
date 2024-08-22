-- ESQUEMAS DE RECURSIÓN

-- i. Redefinir usando foldr las funciones sum, elem, (++), filter y map.
sumFold :: Num a => [a] -> a
sumFold = foldr (+) 0

elemFold :: Eq a => a -> [a] -> Bool
elemFold x = foldr (\y acc -> y == x || acc) False

-- concatFold :: [a] -> [a] -> [a]
-- concatFold = flip (foldr (\x rec-> x:rec) )

concatFold :: [a] -> [a] -> [a]
concatFold = foldr (:)  

filterFold :: (a -> Bool) -> [a] -> [a]
filterFold f = foldr (\x acc -> if f x then x:acc else acc) []

mapFold :: (a -> b) -> [a] -> [b]
mapFold f = foldr (\x acc -> f x : acc) []

------------------------------------------------------------------------------------------------------------
-- ii. Definir la función mejorSegún :: (a -> a -> Bool) -> [a] -> a, que devuelve el máximo elemento
-- de la lista según una función de comparación, utilizando foldr1. Por ejemplo, maximum = mejorSegún (>).

{- La función foldr1 :: Foldable t => (a -> a -> a) -> t a -> a está definida en Prelude. 
Esta función es una variante de foldr en la que el caso base se da cuando la estructura contiene un único
elemento y ese elemento es el resultado del caso base.
-}

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun cmp xs = foldr1 (\x y -> if cmp x y then x else y) xs

------------------------------------------------------------------------------------------------------------
{-iii. Definir la función sumasParciales :: Num a => [a] -> [a], que dada una lista de números devuelve
otra de la misma longitud, que tiene en cada posición la suma parcial de los elementos de la lista original
desde la cabeza hasta la posición actual. Por ejemplo, sumasParciales [1,4,-1,0,5] ; [1,5,4,4,9].-}

-- Para definir la función sumasParciales, podemos utilizar scanl, que es similar a foldl pero devuelve 
-- una lista de todos los valores acumulados. Acumula la suma de los elementos de la lista, 
-- comenzando desde el valor inicial 0. Cada elemento en la lista resultante es la suma parcial de 
-- los elementos en la lista original hasta esa posición.
sumasParciales :: Num a => [a] -> [a]
sumasParciales = scanl (+) 0

------------------------------------------------------------------------------------------------------------
{-iv. Definir la función sumaAlt, que realiza la suma alternada de los elementos de una lista. 
Es decir, da como resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. 
Usar foldr.-}

--sumaAlt = fst . foldr (\(acc, i) x -> if even i then (acc - x, i + 1) else (acc + x, i + 1)) (0, 0)

sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0

------------------------------------------------------------------------------------------------------------

{-v. Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo,
etc.). Pensar qué esquema de recursión conviene usar en este caso.-}

sumaAltInv :: Num a => [a] -> a
sumaAltInv = fst foldl (\(acc, i) x -> if even i then (acc - x, i + 1) else (acc + x, i + 1)) (0, 0)
