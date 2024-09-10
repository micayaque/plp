genLista :: a -> (a -> a) -> Integer -> [a]
genLista i f n = if n ==0 then [] else f i : genLista (f i) f (n-1)

desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta d h = if d==h then [h] else d:desdeHasta (d+1) h

--desdeHasta x y = genLista x (+1) (y-x+1) 