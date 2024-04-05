-- Dado el siguiente modelo para árboles binarios: data AB a = Nil | Bin (AB a) a (AB a)
data AB a = Nil | Bin (AB a) a (AB a)

-- definir las siguientes funciones:
-- vacioAB :: AB a → Bool que indica si un árbol es vacío (i.e. no tiene nodos)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

-- negacionAB :: AB Bool → AB Bool que dado un árbol de booleanos construye otro formado por la 
-- negación de cada uno de los nodos.

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin l a r) = Bin (negacionAB l) (not a) (negacionAB r)

-- productoAB :: AB Int → Int que calcula el producto de todos los nodos del árbol.

productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin l a r) = productoAB l * productoAB r * a