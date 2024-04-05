import GHC.Exts.Heap (ClosureType(TREC_CHUNK))
-- Definir las siguientes funciones sobre listas:
-- limpiar :: String → String → String, que elimina todas las apariciones de cualquier carácter de la primera
-- cadena en la segunda. 
-- Por ejemplo, limpiar ``susto'' ``puerta'' evalúa a ``pera''. 
-- Nota:String es un renombre de [Char]. La notación ``hola'' es equivalente a[`h',`o',`l',`a'] y a `h':`o':`l':`a':[].

borrar :: String -> Char -> String
borrar [] _                 = []
borrar (x:xs) a | x == a    = borrar xs a
                | otherwise = borrar (x:xs) a

limpiar :: String -> String -> String
limpiar []      l   = l
limpiar (x:xs)  l   = limpiar xs (borrar l x)

-- limpiar xs l = foldl borrar l xs

-- limpiar chars str = filter (`notElem` chars) str

-- difPromedio :: [Float] → [Float] que dada una lista de números devuelve la diferencia de cada uno con el promedio general. 
-- Por ejemplo, difPromedio [2, 3, 4] evalúa a [-1, 0, 1]

sumaElementos :: [Float] -> Float
sumaElementos []        = 0
sumaElementos (x:xs)    = x + sumaElementos xs 

--sumaElementos xs = foldr (+) 0 xs

longitud :: [Float] -> Int
longitud []     = 0
longitud (x:xs) = 1 + longitud xs 

--longitud xs = foldr (\ x -> (+) 1) 0 xs

promedio :: [Float] -> Float
promedio l = sumaElementos l / (fromIntegral (longitud l) :: Float)

difPromedio :: [Float] -> [Float]
difPromedio []      = []
difPromedio (x:xs)  = (x - promedio (x:xs)) : difPromedio xs

-- todosIguales :: [Int] → Bool que indica si una lista de enteros tiene todos sus elementos iguales.
todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [_] = True
todosIguales (x:y:resto)    | x /= y = False 
                            | otherwise = todosIguales (y:resto)

-- todosIguales [] = True
-- todosIguales (x:xs) = foldr ((&&) . (== x)) True xs
