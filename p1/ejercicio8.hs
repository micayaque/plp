{-Definir las siguientes funciones para trabajar sobre listas, y dar su tipo. 
Todas ellas deben poder aplicarse a listas finitas e infinitas.-}

{-i. mapPares, una versión de map que toma una función currificada de dos argumentos y una lista de pares
de valores, y devuelve la lista de aplicaciones de la función a cada par. Pista: recordar curry y uncurry.-}

mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares f = map(uncurry f)

{-ii. armarPares, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento
correspondiente a esa posición en cada una de las listas. Si una de las listas es más larga que la otra,
ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). Esta función en
Haskell se llama zip. Pista: aprovechar la currificación y utilizar evaluación parcial.-}

armarPares :: [a] -> [b] -> [(a,b)]
armarPares xs ys =  if length xs < length ys then 
                        foldr (\x acc -> \ys -> (x,head ys):acc (tail ys)) (\_ -> []) xs ys
                    else
                        foldr (\y acc -> \xs -> (head xs,y):acc (tail xs)) (\_ -> []) ys xs

-- foldr f z []        = z
-- foldr f z (x : xs)  = f x (foldr f z xs)

-- f:  Esta es una función binaria que se aplica a cada elemento de la lista y al resultado acumulado de las 
--     aplicaciones anteriores. En el caso de armarPares, f es una función lambda que toma un elemento x o y 
--     y una función acc (el resultado acumulado), y devuelve una nueva función que toma una lista ys o xs 
--     y devuelve un par (x, head ys) o (head xs, y) seguido del resultado de aplicar acc al resto de la lista.

-- z:  Este es el valor base que se utiliza cuando foldr llega al final de la lista. 
--     En el caso de armarPares, z es una función lambda que ignora su argumento y siempre devuelve una lista vacía. 
--     Esto significa que si una de las listas es más corta que la otra, los elementos extra de la lista más larga se ignoran.

-- xs o ys:    Esta es la lista a la que se aplica foldr. 
--             En el caso de armarPares, foldr se aplica a la lista más corta, ya sea xs o ys, 
--             y la lista más larga se pasa como argumento a la función acumulada.


-- iii. mapDoble, una variante de mapPares, que toma una función currificada de dos argumentos y dos listas
-- (de igual longitud), y devuelve una lista de aplicaciones de la función a cada elemento correspondiente de
-- las dos listas. Esta función en Haskell se llama zipWith.

mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f xs ys = map (uncurry f) (armarPares xs ys)

-- mapDoble f as = mapPares f.(zip as)
-- mapDoble f xs ys = zipWith f xs ys