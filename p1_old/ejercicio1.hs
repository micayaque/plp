{- Considerar las siguientes definiciones de funciones:
 i. ¿Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float).
-}
max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y

normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)

_subtract :: Float -> Float -> Float
_subtract = flip (-)

predecesor :: Float -> Float
predecesor = subtract 1

evaluarEnCero :: (Float -> a) -> a
evaluarEnCero = \f -> f 0

dosVeces :: (a -> a) -> a -> a
dosVeces = \f -> f . f

flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = map flip

flipRaro :: b -> (a -> b -> c) -> a -> c
flipRaro = flip flip
{-
ii. Indicar cuáles de las funciones anteriores no están currificadas. 
 Para cada una de ellas, definir la función currificada correspondiente. 
 Recordar dar el tipo de la función.
-}

max2c :: Float -> Float -> Float
max2c x y   | x >= y    = x
            | otherwise = y

normaVectorialc :: Float -> Float -> Float
normaVectorialc x y = sqrt (x^2 + y^2)
