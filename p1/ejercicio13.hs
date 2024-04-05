--Considerar el siguiente tipo, que representa a los árboles binarios:
data AB a = Nil | Bin (AB a) a (AB a)

-- i. Usando recursión explícita, definir los esquemas de recursión estructural 
-- (foldAB) y primitiva (recAB), y dar sus tipos.

foldAB :: (b -> a -> b -> b) -> b -> AB a -> b
foldAB _ z Nil = z
foldAB f z (Bin ar1 e ar2) = f (foldAB f z ar1) e (foldAB f z ar2)

