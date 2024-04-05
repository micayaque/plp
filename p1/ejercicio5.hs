{-Considerar las siguientes funciones:
    elementosEnPosicionesPares :: [a] -> [a]
    elementosEnPosicionesPares [] = []
    elementosEnPosicionesPares (x:xs) = if null xs then [x] else x : elementosEnPosicionesPares (tail xs)
    
    entrelazar :: [a] -> [a] -> [a]
    entrelazar [] = id
    entrelazar (x:xs) = \ys -> if null ys then x : entrelazar xs [] else x : head ys : entrelazar xs (tail ys)

Indicar si la recursión utilizada en cada una de ellas es o no estructural. 

La función elementosEnPosicionesPares no es estructural.
El hecho de que se use tail xs implica que estás usando la cola xs de otra manera. 
Eso ya hace que la recursión no sea estructural.

La función entrelazar si es estructural.

Si lo es, reescribirla utilizando foldr. En caso contrario, explicar el motivo.-}

{-
f [] = z
f (x:xs) = M
Es recursión estructural si te queda la misma función al hacer:
foldr (\x rec -> M{f xs <- rec} z
-}

-- La función entrelazar si es estructural.
entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr (\x rec -> \ys -> if null ys then x : rec [] else x : head ys : rec (tail ys)) id

-- foldr toma una función, un valor inicial y una lista. 
-- En este caso, la función es una función lambda que toma un elemento x y una función 
-- rec (que representa el resultado de la llamada recursiva), 
-- y devuelve una nueva función que toma una lista ys.

-- Esta nueva función comprueba si ys está vacía (null ys). 
-- Si lo está, añade x al principio de la lista resultante de llamar a rec con una lista vacía (x : rec []).
-- Si ys no está vacía, añade x al principio de la lista, seguido del primer elemento de ys (head ys), 
-- y luego el resultado de llamar a rec con el resto de ys (tail ys).

-- El valor inicial para foldr es id, que es la función identidad. 
-- Esto significa que si la lista de entrada está vacía, el resultado es la lista de entrada sin cambios.

