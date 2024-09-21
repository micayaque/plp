data RoseTree a = Rose a [RoseTree a]

foldRoseTree :: (a -> [b] -> b) -> RoseTree a -> b
foldRoseTree cRose (Rose x xs) = cRose x (map rec xs)
  where rec = foldRoseTree cRose

-- hojas :: RoseTree a -> [a]
-- hojas (Rose a []) = [a]
-- hojas (Rose _ xs) = concatMap hojas xs

hojas :: RoseTree a -> [a]
hojas = foldRoseTree (\x rec -> if null rec then [x] else concat rec)

-- distancias :: RoseTree a -> [Int]
-- distancias (Rose _ []) = [0]
-- distancias (Rose _ xs) = map (+1) (concatMap distancias xs)

distancias :: RoseTree a -> [Int]
distancias = foldRoseTree (\_ rec -> if null rec then [0] else map (+1) (concat rec))

-- altura :: RoseTree a -> Int
-- altura (Rose _ []) = 1
-- altura (Rose _ xs) = 1 + maximum (map altura xs)

altura :: RoseTree a -> Int
altura = foldRoseTree (\_ hijos -> if null hijos then 1 else 1 + maximum hijos)
