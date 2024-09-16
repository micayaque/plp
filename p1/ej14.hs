data AIH a = Hoja a | Bin (AIH a) (AIH a)

foldAIH :: (a -> b) -> (b -> b -> b) -> AIH a -> b
foldAIH cHoja cBin (Hoja x) = cHoja x
foldAIH cHoja cBin (Bin i d) = cBin (rec i) (rec d)
    where rec = foldAIH cHoja cBin

-- altura :: AIH a -> Integer
-- altura (Hoja _) = 1
-- altura (Bin i d) = 1 + max (altura i) (altura d)

altura :: AIH a -> Integer
altura = foldAIH (const 1) (\rec_i rec_d -> 1 + max rec_i rec_d)

-- tamaño :: AIH a -> Integer
-- tamaño (Hoja _) = 1
-- tamaño (Bin i d) = tamaño i + tamaño d

tamaño :: AIH a -> Integer
tamaño = foldAIH (const 1) (+)
