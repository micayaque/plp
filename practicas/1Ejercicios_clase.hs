 -- clase.hs


curry' :: ((a,b) -> c) -> a -> b -> c 
-- curry' f x y = f (x, y)
curry' f = \x y-> f (x, y)


uncurry' :: (a -> b -> c) -> (a, b) -> c
-- uncurry' f (x,y) = f x y
uncurry' f = \(x,y) -> f x y


triple :: Float -> Float
triple = (*) 3


esMayorDeEdad :: Int -> Bool
-- esMayorDeEdad = (<) 18
esMayorDeEdad = (> 18)

-- (.)
componer :: (b -> c) -> (a -> b) -> a -> c
-- componer f g x = f (g (x))
-- componer f g x = f $ g x
componer = \f -> \g -> \x -> f $ g x 


-- flip
flip' :: (a -> b -> c) -> b -> a -> c
-- flip' f y x = f x y
flip' f = \y x -> f x y  


-- ($)
ss :: (a -> b) -> a -> b
ss f = f
-- Usos: ss id 6, id `ss` 6 


-- const
const' :: a -> b -> a
--const' x y = x
--const' x = \y -> x
const' x = \_ -> x


maximo :: Ord a => [a] -> a
maximo = mejorSegún (>)

--maximo [x] = x
--maximo (x:y:ys) = if x > y then maximo (x:ys) else maximo (y:ys)


minimo :: Ord a => [a] -> a
minimo = mejorSegún (<)


listaMásCorta :: [[a]] -> [a]
listaMásCorta = mejorSegún (\x y->length x < length y)


mejorSegún :: (a -> a -> Bool) -> [a] -> a
mejorSegún comp [x] = x
mejorSegún comp (x:y:ys) = if comp x y
                           then mejorSegún comp (x : ys)
                           else mejorSegún comp (y:ys)


deLongitudN :: Int -> [[a]] -> [[a]]
deLongitudN n = filter (\x -> length x == n)  


soloPuntosFijosEnN :: Int -> [Int->Int] ->[Int->Int]
soloPuntosFijosEnN n = filter (\x ->x n == n)


reverseAnidado :: [[Char]] -> [[Char]]
reverseAnidado = reverse . (map reverse)


listaComp :: (a -> b) -> [a] -> (a -> Bool) -> [b]
listaComp f xs p = map f (filter p xs)


mejorSegún2 comp = foldr1 (\x rec -> if comp x rec then x else rec)


elem' :: Eq a => a -> [a] -> Bool
elem' e=foldr (\x rec -> x == e || rec)   False


sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0


recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z []       = z
recr f z (x : xs) = f x xs (recr f z xs)


sacarPrimera:: Eq a => a -> [a] -> [a]
sacarPrimera e = recr (\x xs rec -> if e == x then xs else x:rec) []


data AEB a = Hoja a | Bin (AEB a) a (AEB a)


foldAEB :: (a -> b) -> (b -> a -> b -> b) -> AEB a -> b
foldAEB cHoja cBin arbol = case arbol of
    Hoja x -> cHoja x
    Bin i r d -> cBin (rec i) r (rec d)
  where rec = foldAEB cHoja cBin 


cantNodos :: AEB a -> Int
cantNodos = foldAEB (const 1) (\ri _ rd -> 1 + ri + rd)


data Polinomio a = X
                 | Cte a
                 | Suma (Polinomio a) (Polinomio a)
                 | Prod (Polinomio a) (Polinomio a)


evaluar n poli = case poli of
       X -> n
       Cte k -> k
       Suma p q -> evaluar n p + evaluar n q
       Prod p q -> evaluar n p * evaluar n q
-- evaluar n = foldPoli n id (+) (*)


foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPoli cX cCte cSuma cProd poli = case poli of
    X -> cX
    Cte k -> cCte k
    Suma p q -> cSuma (rec p) (rec q)
    Prod p q -> cProd (rec p) (rec q)
  where rec = foldPoli cX cCte cSuma cProd


data RoseTree a = Rose a [RoseTree a]


tamaño :: RoseTree a -> Int
tamaño (Rose x hijos) = 1 + sum (map tamaño hijos)
-- tamaño = foldRT (\_ recs -> 1 + sum recs)


foldRT :: (a -> [b] -> b) -> RoseTree a -> b
foldRT f (Rose x hijos) = f x (map (foldRT f) hijos)

