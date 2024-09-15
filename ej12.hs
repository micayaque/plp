data AB a = Nil | Bin (AB a) a (AB a)

foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d)
        where rec = foldAB cBin cNil

esNil :: AB a -> Bool
esNil arbol = case arbol of
                Nil -> True
                _ -> False

altura :: AB a -> Integer
altura  = foldAB (\r rec_i rec_d -> 1 + max rec_i rec_d) 0

recAB :: (a -> b -> b -> AB a -> AB a -> b) -> b -> AB a -> b
recAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d) i d
        where rec = recAB cBin cNil

cantNodos :: AB a -> Integer
cantNodos = foldAB (\r rec_i rec_d -> 1 + rec_i + rec_d) 0
