-- Considerar las siguientes definiciones de funciones:
-- i. ¿Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float).
max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y

normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)

_subtract :: Float -> Float -> Float
_subtract = flip (-)

predecesor = subtract 1

evaluarEnCero = \f -> f 0

dosVeces = \f -> f . f

flipAll = map flip

flipRaro = flip flip
--ii. Indicar cuáles de las funciones anteriores no están currificadas. 
-- Para cada una de ellas, definir la función currificada correspondiente. Recordar dar el tipo de la función.