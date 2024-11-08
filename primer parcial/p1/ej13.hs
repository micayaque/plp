data AB a = Nil | Bin (AB a) a (AB a)

-- ramas :: AB a -> [[a]]
-- ramas Nil = [[]]
-- ramas (Bin i r d) = concatTodas r (ramas i) ++ concatTodas r (ramas d)
--         where   concatTodas a = map (a:)

foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
foldAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d)
        where rec = foldAB cBin cNil
ramas :: AB a -> [[a]]
ramas = foldAB (\r rec_i rec_d -> map (r:) rec_i ++ map (r:) rec_d) [[]]

-- cantHojas :: AB a -> Int
-- cantHojas Nil = 0
-- cantHojas (Bin i r d) = 1 + cantHojas i + cantHojas d

cantHojas :: AB a -> Int
cantHojas = foldAB (\r rec_i rec_d -> 1 + rec_i + rec_d) 0

-- espejo :: AB a -> AB a
-- espejo Nil = Nil
-- espejo (Bin i r d) = Bin (espejo d) r (espejo i)

espejo :: AB a -> AB a
espejo = foldAB (\r rec_i rec_d -> Bin rec_d r rec_i) Nil


-- mismaEstructura :: AB a -> AB b -> Bool
-- mismaEstructura Nil Nil = True
-- mismaEstructura Nil Bin{} = False
-- mismaEstructura Bin{} Nil = False
-- mismaEstructura (Bin i1 _ d1) (Bin i2 _ d2) = mismaEstructura i1 i2 && mismaEstructura d1 d2

esNil :: AB a -> Bool
esNil arbol = case arbol of
                Nil -> True
                _ -> False

recAB :: (a -> b -> b -> AB a -> AB a -> b) -> b -> AB a -> b
recAB cBin cNil arbol = case arbol of
                Nil -> cNil
                Bin i r d -> cBin r (rec i) (rec d) i d
        where rec = recAB cBin cNil

izq :: AB a -> AB a
izq Nil = Nil
izq (Bin i _ _) = i

der :: AB a -> AB a
der Nil = Nil
der (Bin _ _ d) = d

mismaEstructura :: AB a -> AB b -> Bool
mismaEstructura = recAB (\_ rec_i1 rec_d1 i1 d1 a -> not(esNil a) &&
                                                        esNil i1 == esNil(izq a)&&
                                                        esNil d1 == esNil(der a)&&
                                                        rec_i1 (izq a) &&
                                                        rec_d1 (der a)) esNil

