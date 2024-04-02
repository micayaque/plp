-- valorAbsoluto :: Float → Float, que dado un número devuelve su valor absoluto.
valorAbsoluto :: Float -> Float
valorAbsoluto x | x >= 0 = x 
                | otherwise = (-1)*x

-- bisiesto :: Int → Bool, que dado un número que representa un año, indica si el mismo es bisiesto.
bisiesto :: Int -> Bool
bisiesto x  | mod x 400 == 0 = True
            | mod x 100 == 0 = False
            | mod x 4   == 0 = True
            | otherwise      = False

-- factorial :: Int → Int, deinida únicamente para enteros positivos, que computa el factorial.
factorial :: Int -> Int
factorial x | x == 1    = 1
            | otherwise = x * factorial(x-1)

-- Función auxiliar para verificar si un número n es primo
esPrimo :: Int -> Bool
esPrimo n   | n <= 1    = False
            | otherwise = esPrimoAux n 2
    where
        esPrimoAux :: Int -> Int -> Bool
        esPrimoAux n divisor    | divisor == n          = True
                                | n `mod` divisor == 0  = False
                                | otherwise             = esPrimoAux n (divisor + 1)

cantDivisoresPrimosAux :: Int -> Int -> Int
cantDivisoresPrimosAux n divisor    | divisor > n                               = 0                                    
                                    | n `mod` divisor == 0 && esPrimo divisor  = 1 + cantDivisoresPrimosAux n (divisor - 1) 
                                    | otherwise                                 = cantDivisoresPrimosAux n (divisor - 1)
-- cantDivisoresPrimos :: Int → Int, que dado un entero positivo devuelve la cantidad de divisores primos.
cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos x   = cantDivisoresPrimosAux x 1

