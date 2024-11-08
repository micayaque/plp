data Polinomio a =  X
                |   Cte a 
                |   Suma (Polinomio a) (Polinomio a)
                |   Producto (Polinomio a) (Polinomio a)


foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPoli cX cCte cSuma cProd poli = case poli of
    X -> cX
    Cte a -> cCte a
    Suma p1 p2 -> cSuma (rec p1) (rec p2)
    Producto p1 p2 -> cProd (rec p1) (rec p2)
    where rec = foldPoli cX cCte cSuma cProd

evaluar :: Num a => a -> Polinomio a -> a
evaluar n = foldPoli n id (+) (*)