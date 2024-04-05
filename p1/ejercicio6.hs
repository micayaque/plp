--El siguiente esquema captura la recursión primitiva sobre listas.
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z []         = z
recr f z (x : xs)   = f x xs (recr f z xs)

{-a. Definir la función sacarUna :: Eq a => a -> [a] -> [a], que dados un elemento y una lista devuelve el
resultado de eliminar de la lista la primera aparición del elemento (si está presente).-}

sacarUna :: Eq a => a -> [a] -> [a]
--sacarUna _ [] = []
--sacarUna x (y:ys) | x == y    = ys
--                  | otherwise = y : sacarUna x ys

sacarUna x = recr (\y ys rec -> if (x==y) then ys else y:rec) []

--b. Explicar por qué el esquema foldr no es adecuado para implementar la función sacarUna del punto anterior.
--foldr :: (a -> b -> b) -> b -> [a] -> b
--foldr f z [] = z
--foldr f z (x:xs) = f x (foldr f z xs)

--foldr no es adecuado para implementar la función sacarUna ya que foldr recorre la lista 
--de izquierda a derecha y no se puede saber si el elemento ya fue eliminado o no.

{-recr, nos permite escribir funciones recursivas cuyo paso recursivo no solo dependen del paso anterior,
sino que tambien dependen de la cola de la lista. Mientras que foldr es el esquema recursivo de inducción
estructural, es decir nos permite definir funciones que solo dependen del caso anterior.-}

{-c. Definr la función insertarOrdenado :: Ord a => a -> [a] -> [a] que inserta un elemento en una lista
ordenada (de manera creciente), de manera que se preserva el ordenamiento.-}

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado x = recr (\y ys rec -> if (x<=y) then x:y:ys else y:rec) [x]

