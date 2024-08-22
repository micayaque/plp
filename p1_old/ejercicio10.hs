-- Definimos la función generate, que genera listas en base a un predicado y una función, 
-- de la siguiente manera:

generate :: ([a] -> Bool) -> ([a] -> a) -> [a]
generate stop next = generateFrom stop next []

generateFrom:: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
generateFrom stop next xs   | stop xs   = init xs
                            | otherwise = generateFrom stop next (xs ++ [next xs])

-- i. Usando generate, definir generateBase::([a] -> Bool) -> a -> (a -> a) -> [a], similar a
-- generate, pero con un caso base para el elemento inicial, 
-- y una función que, en lugar de calcular el siguiente elemento en base a la lista completa, 
-- lo calcula a partir del último elemento. 
-- Por ejemplo: generateBase (\l->not (null l) && (last l > 256)) 1 (*2) es la lista las potencias de 2 menores o iguales que 256.

generateBase::([a] -> Bool) -> a -> (a -> a) -> [a]
generateBase stop base next = generate stop (\xs-> if ((length xs) == 0) then base else (next (last xs)))

-------------------------------------------------------------------------------------------------------------

-- ii. Usando generate, definir factoriales::Int -> [Int], que dado un entero n genera la lista de 
-- los primeros n factoriales.

factoriales::Int -> [Int]
factoriales n = generate (\xs -> (length xs) == n) (\xs -> if ((length xs) == 0) then 1 else (last xs) * (length xs))

-- stop = (\xs -> (length xs) == n)
-- next = (\xs -> if ((length xs) == 0) then 1 else (last xs) * (length xs))

------------------------------------------------------------------------------------------------------------------------------

-- iii. Usando generateBase, definir iterateN :: Int -> (a -> a) -> a -> [a] que, toma un entero n, 
-- una función f y un elemento inicial x, y devuelve la lista [x, f x, f (f x), ..., f ( ...(f x) ...)] 
-- de longitud n. 
-- Nota: iterateN n f x = take n (iterate f x).

iterateN :: Int -> (a -> a) -> a -> [a]
iterateN n f x = generateBase (\xs -> (length xs) == n) x f 

-- stop = (\xs -> (length xs) == n)
-- base = x
-- next = f

------------------------------------------------------------------------------------------------------------------------------

-- iv. Redefinir generateFrom usando iterate y takeWhile.

-- iterate: 
--      This function takes two arguments: a function f and an initial value x. 
--      It returns an infinite list where the first element is x and each subsequent element is 
--      the result of applying f to the previous element. 
--      For example, iterate (*2) 1 would generate the list [1, 2, 4, 8, 16, ...].

-- takeWhile: 
--      This function takes a predicate (a function that returns a Boolean) and a list. 
--      It returns the longest prefix (sublist from the start of the list) 
--      of the list for which the predicate returns True. 
--      For example, takeWhile (<5) [1, 2, 3, 4, 5, 6, 7] would return [1, 2, 3, 4].

-- generateFrom':: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
-- generateFrom' stop next xs = takeWhile (not . stop) (iterate next xs)

generateFrom1:: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
generateFrom1 stop next = last . (takeWhile (not.stop)) . (iterate (\ys -> ys ++ [next ys]))

-- iterate genera una lista de listas de a, la función que se pasa a iterate es una función que
-- toma una lista y aplica next a esa lista para obtener el siguiente elemento y luego añade 
-- ese elemento a la lista.

-- takeWhile toma las sublistas generadas por iterate hasta que stop devuelve true para alguna sublista.

-- last toma la última sublista generada por takeWhile.