foldNat :: (Integer -> b -> b) -> b -> Integer -> b
foldNat cSucc cZero n = case n of
                    0 -> cZero 
                    _ -> cSucc n rec
        where rec = foldNat cSucc cZero (n-1)

potencia :: Integer -> Integer -> Integer
potencia n = foldNat (\_ rec -> rec*n) 1

