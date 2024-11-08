-- sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
-- sumaMat [[]] [[]] = []
-- sumaMat (x:xs) (y:ys) = sumaFila x y : sumaMat xs ys
--     where sumaFila [] [] = []
--           sumaFila (a:as) (b:bs) = a + b : sumaFila as bs

sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat = zipWith (zipWith (+))


