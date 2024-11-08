--Ejercicio 1 Dar el tipo y describir el comportamiento de las siguientes funciones del módulo 
-- Prelude de Haskell:
-- null   :: Foldable t => t a -> Bool
-- Esta función toma una estructura plegable (como una lista) y devuelve True si la estructura está vacía 
-- y False en caso contrario.

-- head   :: GHC.Stack.Types.HasCallStack => [a] -> a
-- Devuelve el primer elemento de una lista. Si la lista está vacía, produce un error.

-- tail   :: GHC.Stack.Types.HasCallStack => [a] -> [a]
-- Devuelve una lista sin su primer elemento. Si la lista está vacía, produce un error.

-- init   :: GHC.Stack.Types.HasCallStack => [a] -> [a]
-- Devuelve una lista sin su último elemento. Si la lista está vacía, produce un error.

-- last   :: GHC.Stack.Types.HasCallStack => [a] -> a
--  Devuelve el último elemento de una lista. Si la lista está vacía, produce un error.

-- take   :: Int -> [a] -> [a]
-- Devuelve una lista con los primeros n elementos de la lista original. 
-- Si n es mayor que la longitud de la lista, se devuelve la lista completa.

-- drop   :: Int -> [a] -> [a]
-- Devuelve una lista sin los primeros n elementos de la lista original. 
-- Si n es mayor que la longitud de la lista, se devuelve una lista vacía.

-- (++)   :: [a] -> [a] -> [a]
-- Concatenación de dos listas. 
-- Toma dos listas y devuelve una nueva lista que es la concatenación de ambas.

-- concat :: Foldable t => t [a] -> [a]
-- Esta función toma una estructura que contiene listas y las concatena en una única lista.

-- reverse:: [a] -> [a]
-- Devuelve la lista en orden inverso.

-- elem   :: (Foldable t, Eq a) => a -> t a -> Bool
-- Verifica si un elemento está presente en una lista. 
-- Devuelve True si el elemento se encuentra en la lista, False en caso contrario.

--Ejercicio 2 Definir las siguientes funciones:
-- a.valorAbsoluto :: Float → Float, que dado un número devuelve su valor absoluto.

valorAbsoluto :: Float -> Float
valorAbsoluto x | x < 0 = -x
                | otherwise = x

-- b.bisiesto :: Int → Bool, que dado un número que representa un año, indica si el mismo es bisiesto.

bisiesto :: Int -> Bool
bisiesto x | mod x 400 == 0 = True
           | mod x 4 == 0 && mod x 100 /= 0 = True
           | otherwise = False

-- c.factorial :: Int → Int, definida únicamente para enteros positivos, que computa el factorial.

factorial :: Int -> Int
factorial n | n <= 1 = 1
            | otherwise = n * factorial (n-1)

-- d.cantDivisoresPrimos :: Int → Int, que dado un entero positivo devuelve la cantidad de divisores primos.

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos n = length [x | x <- [1..n], mod n x == 0, esPrimo x]
                        where esPrimo x = case x of
                                            1 -> False
                                            _ -> null [y | y <- [2..(x-1)], mod x y == 0]

--Ejercicio 3 Contamos con los tipos Maybe y Either definidos como sigue:
--data Maybe a = Nothing | Just a
--data Either a b = Left a | Right b

--a. Definir la función inverso:: Float → Maybe Float que dado un número devuelve su inverso multiplicativo
--si está definido, o Nothing en caso contrario.

inverso :: Float -> Maybe Float
inverso x   | x /= 0 = Just (1 / x)
            |  otherwise = Nothing

--b. Definir la función aEntero:: Either Int Bool → Int que convierte a entero una expresión que puede ser
--booleana o entera. En el caso de los booleanos, el entero que corresponde es 0 para False y 1 para True.

aEntero :: Either Int Bool -> Int
aEntero (Left x) = x
aEntero (Right True) = 1
aEntero (Right False) = 0

--Ejercicio 4 Definir las siguientes funciones sobre listas:

--a.limpiar :: String → String → String, que elimina todas las apariciones de cualquier carácter de la primera cadena en la segunda.
--Por ejemplo, limpiar ``susto'' ``puerta'' evalúa a ``pera''. 
--Nota: String es un renombre de [Char]. 
--La notación ``hola'' es equivalente a [`h',`o',`l',`a'] y a `h':`o':`l':`a':[].

limpiar :: String -> String -> String
limpiar str1 [] = []
limpiar str1 (x:xs) | x `elem` str1 = limpiar str1 xs
                    | otherwise = x : limpiar str1 xs

--b.difPromedio :: [Float] → [Float] que dada una lista de números devuelve la diferencia de cada uno con el
--promedio general. Por ejemplo, difPromedio [2, 3, 4] evalúa a [-1, 0, 1].

difPromedio :: [Float] -> [Float]
difPromedio [] = []
difPromedio (x:xs) = (x - promedio) : difPromedio xs
                    where promedio = sum (x:xs) / fromIntegral (length (x:xs))

--c.todosIguales :: [Int] → Bool que indica si una lista de enteros tiene todos sus elementos iguales.

todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) = x == y && todosIguales (y:xs)
