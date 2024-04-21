import Data.Foldable (Foldable(fold))
--Considerar el siguiente tipo, que representa a los árboles binarios:
data AB a = Nil | Bin (AB a) a (AB a)

-- i. Usando recursión explícita, definir los esquemas de recursión estructural 
-- (foldAB) y primitiva (recAB), y dar sus tipos.

foldAB :: (b -> a -> b -> b) -> b -> AB a -> b
foldAB _ z Nil = z
foldAB f z (Bin ar1 e ar2) = f (foldAB f z ar1) e (foldAB f z ar2)

recAB :: b -> (b -> a -> b -> b) -> AB a -> b
recAB z _ Nil = z
recAB z f (Bin ar1 e ar2) = f (recAB z f ar1) e (recAB z f ar2)

--ii. Definir las funciones esNil, altura y cantNodos (para esNil puede utilizarse case en lugar de foldAB o recAB).

esNil :: AB a -> Bool
esNil Nil = True
esNil _ = False

altura :: AB a -> Int
altura = foldAB (\a _ b -> 1 + max a b) 0 

cantNodos :: AB a -> Int
cantNodos = foldAB (\a _ b -> 1 + a + b) 0
