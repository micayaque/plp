data AB a = Nil | Bin (AB a) a (AB a)

foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d)
        where rec = foldAB cBin cNil

recAB :: (a -> b -> b -> AB a -> AB a -> b) -> b -> AB a -> b
recAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d) i d
        where rec = recAB cBin cNil


esNil :: AB a -> Bool
esNil arbol = case arbol of
                Nil -> True
                _ -> False

altura :: AB a -> Integer
altura  = foldAB (\r rec_i rec_d -> 1 + max rec_i rec_d) 0


cantNodos :: AB a -> Integer
cantNodos = foldAB (\r rec_i rec_d -> 1 + rec_i + rec_d) 0


mejorSegun :: Num a => (a -> a -> Bool) -> AB a -> a
mejorSegun f = foldAB (\i r d -> if f i d && f i r then i 
                                     else (if f d r then d else r)) (error "no hay mejor en nil")


esABB :: Ord a => AB a -> Bool
esABB = recAB (\r rec_i rec_d (Bin i1 r1 d1) (Bin i2 r2 d2) -> rec_d && rec_i && r >= r1 && r <= r2) True

