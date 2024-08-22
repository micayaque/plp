-- OTRAS ESTRUCTURAS DE DATOS

-- En esta sección se permite (y se espera) el uso de recursión explícita únicamente para la definición 
-- de esquemas de recursión.

-- i. Definir y dar el tipo del esquema de recursión foldNat sobre los naturales. 
-- Utilizar el tipo Integer de Haskell 
-- (la función va a estar definida sólo para los enteros mayores o iguales que 0).

foldNat::(Integer -> a -> a) -> a -> Integer -> a
foldNat f z 0 = z
foldNat f z n = f n (foldNat f z (n-1))

--aplica la función f a cada número desde n hasta 1, acumulando los resultados.

----------------------------------------------------------------------------------------------------------

-- ii. Utilizando foldNat, definir la función potencia.

potencia::Integer -> Integer -> Integer
potencia n m = foldNat (\x y -> n*y) 1 m

--aplica la función n*y a cada número desde m hasta 1, acumulando los resultados.
--multiplica a n por n m veces.

----------------------------------------------------------------------------------------------------------
