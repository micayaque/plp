-- Cuando se creo el universo, no habıa nada, luego el Big Bang lanzó 6 cristales elementales a lo largo del universo virgen, cada una de estas gemas del 
-- infinito controla un aspecto basico de la existencia.
-------------------------------------------------------------------------------------------------------------------------------
-- Thanos ya viene y está juntando las gemas del infinito. Si las consigue todas, tendrá el poder suficiente para hacer que todes recursen la materia. 
-- Es su responsabilidad evitarlo. Pero no se preocupen, tenemos la ayuda de Dr. Strange que nos paso su algoritmo para explorar 14,000,605 universos, 
-- con el cual podemos buscar uno en el que le ganemos a Thanos. En cada universo existen personajes (como Thanos, Iron man o Thor ) 
-- y Objetos (como el Escudo del Capitan America o la Gema del Tiempo). Algunos objetos estan sueltos y otros estan en posesion de algun personaje.
----------------------------------------------------------------------------------------------------------------------------------------
import Test.HUnit
{-- Tipos --}
import Data.Either
import Data.List

--import Data.List (foldr1)
-- Los personajes y objetos se representan con los tipos Personaje y Objeto respectivamente. Los personajes y objetos se inicializan con una posicion 
-- (representada con el tipo Posicion a partir de una tupla de Floats) y un nombre (un String). Los personajes se pueden mover en una de las cuatro direcciones 
-- (representadas con el tipo Direccion) y pueden morir. Cuando un personaje se mueve en una direccion una de las componentes de su posicion se incrementa o 
-- decrementa en uno (cual componente y si incrementa o decrementa depende de la direccion de movimiento). Los objetos pueden ser tomados por un personaje 
-- y pueden ser destruidos. Una vez que un objeto es tomado su posicion pasa a ser la del personaje que lo tomo. 
data Dirección = Norte | Sur | Este | Oeste
  deriving (Eq, Show)

type Posición = (Float, Float)

data Personaje = Personaje Posición String  -- posición inicial, nombre
  | Mueve Personaje Dirección               -- personaje que se mueve, dirección en la que se mueve
  | Muere Personaje                         -- personaje que muere
  deriving (Eq, Show)

data Objeto = Objeto Posición String        -- posición inicial, nombre
  | Tomado Objeto Personaje                 -- objeto que es tomado, personaje que lo tomó
  | EsDestruido Objeto                      -- objeto que es destruido
  deriving (Eq, Show)

type Universo = [Either Personaje Objeto]

{-- Observadores y funciones básicas de los tipos --}

siguiente_posición :: Posición -> Dirección -> Posición
siguiente_posición p Norte = (fst p, snd p + 1)
siguiente_posición p Sur = (fst p, snd p - 1)
siguiente_posición p Este = (fst p + 1, snd p)
siguiente_posición p Oeste = (fst p - 1, snd p)

posición :: Either Personaje Objeto -> Posición
posición (Left p) = posición_personaje p
posición (Right o) = posición_objeto o

posición_objeto :: Objeto -> Posición
posición_objeto = foldObjeto const (const posición_personaje) id

nombre :: Either Personaje Objeto -> String
nombre (Left p) = nombre_personaje p
nombre (Right o) = nombre_objeto o

nombre_personaje :: Personaje -> String
nombre_personaje = foldPersonaje (const id) const id

está_vivo :: Personaje -> Bool
está_vivo = foldPersonaje (const (const True)) (const (const True)) (const False)

fue_destruido :: Objeto -> Bool
fue_destruido = foldObjeto (const (const False)) const (const True)

universo_con :: [Personaje] -> [Objeto] -> [Either Personaje Objeto]
universo_con ps os = map Left ps ++ map Right os

es_un_objeto :: Either Personaje Objeto -> Bool
es_un_objeto (Left o) = False
es_un_objeto (Right p) = True

es_un_personaje :: Either Personaje Objeto -> Bool
es_un_personaje (Left o) = True
es_un_personaje (Right p) = False

-- Asume que es un personaje
personaje_de :: Either Personaje Objeto -> Personaje
personaje_de (Left p) = p

-- Asume que es un objeto
objeto_de :: Either Personaje Objeto -> Objeto
objeto_de (Right o) = o

en_posesión_de :: String -> Objeto -> Bool
en_posesión_de n = foldObjeto (const (const False)) (\ r p -> nombre_personaje p == n) (const False)

objeto_libre :: Objeto -> Bool
objeto_libre = foldObjeto (const (const True)) (const (const False)) (const False)

norma2 :: (Float, Float) -> (Float, Float) -> Float
norma2 p1 p2 = sqrt ((fst p1 - fst p2) ^ 2 + (snd p1 - snd p2) ^ 2)

cantidad_de_objetos :: Universo -> Int
cantidad_de_objetos = length . objetos_en

cantidad_de_personajes :: Universo -> Int
cantidad_de_personajes = length . personajes_en

distancia :: (Either Personaje Objeto) -> (Either Personaje Objeto) -> Float
distancia e1 e2 = norma2 (posición e1) (posición e2)

objetos_libres_en :: Universo -> [Objeto]
objetos_libres_en u = filter objeto_libre (objetos_en u)

está_el_personaje :: String -> Universo -> Bool
está_el_personaje n = foldr (\x r -> es_un_personaje x && nombre x == n && (está_vivo $ personaje_de x) || r) False

está_el_objeto :: String -> Universo -> Bool
está_el_objeto n = foldr (\x r -> es_un_objeto x && nombre x == n && not (fue_destruido $ objeto_de x) || r) False

-- Asume que el personaje está
personaje_de_nombre :: String -> Universo -> Personaje
personaje_de_nombre n u = foldr1 (\x1 x2 -> if nombre_personaje x1 == n then x1 else x2) (personajes_en u)

-- Asume que el objeto está
objeto_de_nombre :: String -> Universo -> Objeto
objeto_de_nombre n u = foldr1 (\x1 x2 -> if nombre_objeto x1 == n then x1 else x2) (objetos_en u)

es_una_gema :: Objeto -> Bool
es_una_gema o = isPrefixOf "Gema de" (nombre_objeto o)
-------------------------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 1-}
-- Definir el esquema de recursion estructural para los tipos Personaje (foldPersonaje) y Objeto (foldObjeto). 
-- Por tratarse de esquemas de recursion esta permitido definirlos usando recursion explıcita.
-- data Personaje = Personaje Posición String  -- posición inicial, nombre
--   | Mueve Personaje Dirección               -- personaje que se mueve, dirección en la que se mueve
--   | Muere Personaje                         -- personaje que muere
--   deriving (Eq, Show)
-- tenemos tres constructores de Personaje:
-- Personaje: toma una posición inicial y un nombre.
-- Mueve:     toma un Personaje y una dirección en la que se mueve.
-- Muere:     toma un Personaje.
foldPersonaje :: (Posición -> String -> a) -> (a -> Dirección -> a) -> (a -> a) -> Personaje -> a
foldPersonaje f1 f2 f3 (Personaje pos nombre) = f1 pos nombre                       -- f1 para el constructor Personaje 
foldPersonaje f1 f2 f3 (Mueve p dir)          = f2 (foldPersonaje f1 f2 f3 p) dir   -- f2 para el constructor Mueve
foldPersonaje f1 f2 f3 (Muere p)              = f3 (foldPersonaje f1 f2 f3 p)       -- f3 para el constructor Muere
-- data Objeto = Objeto Posición String        -- posición inicial, nombre
--   | Tomado Objeto Personaje                 -- objeto que es tomado, personaje que lo tomó
--   | EsDestruido Objeto                      -- objeto que es destruido
--   deriving (Eq, Show)
--tenemos tres constructores de Objeto:
-- Objeto: toma una posición inicial y un nombre.
-- Tomado: toma un Objeto y un Personaje.
-- EsDestruido: toma un Objeto.
foldObjeto :: (Posición -> String -> a) -> (a -> Personaje -> a)  ->  (a -> a) -> Objeto -> a       
foldObjeto f1 f2 f3 (Objeto pos nombre)     = f1 pos nombre                             -- f1 para el constructor Objeto
foldObjeto f1 f2 f3 (Tomado obj personaje)  = f2 (foldObjeto f1 f2 f3 obj) personaje    -- f2 para el constructor Tomado
-- toma el resultado del procesamiento recursivo del objeto obj, lo utiliza para manejar el objeto Tomado y lo combina con el personaje que lo tomó
foldObjeto f1 f2 f3 (EsDestruido obj)       = f3 (foldObjeto f1 f2 f3 obj)              -- f3 para el constructor EsDestruido
--------------------------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 2-}
-- Definir las funciones posición_personaje (que dado un personaje devuelve su posición actual)
-- Notar que está disponible la función siguiente_posición :: Posición -> Dirección -> Posición que dada una posición y una dirección devuelve la posición siguiente a la dada en la dirección dada.
posición_personaje :: Personaje -> Posición
posición_personaje p = foldPersonaje  (\pos _ -> pos) (\personaje dir -> siguiente_posición (posición_personaje personaje) dir) id p
-- y nombre_objeto (que dado un objeto devuelve su nombre). 
nombre_objeto :: Objeto -> String
nombre_objeto obj = foldObjeto (\_ nombre -> nombre) (\obj _ -> nombre_objeto obj) id obj
-- los parámetros p y obj no son necesarios
---------------------------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 3-}
-- Definir las funciones objetos_en y personajes_en que dado un universo devuelven la lista de objetos y la lista de personajes de dicho universo, respectivamente. 
-- Los universos se representan con listas cuyos elementos pueden ser personajes u objetos ası que se utilizara el tipo [Either Personaje Objeto] para representarlos.
--type Universo = [Either Personaje Objeto]
--un universo es una lista de personajes y objetos
objetos_en :: Universo -> [Objeto]
objetos_en u = foldr (\x rec -> if es_un_objeto x then objeto_de x : rec else rec) [] u

personajes_en :: Universo -> [Personaje]
personajes_en u = foldr (\x rec -> if es_un_personaje x then personaje_de x : rec else rec) [] u
-- Luego demostrar la siguiente propiedad: ∀ u :: Universo . ∀ o :: Objeto . elem o (objetos_en u) ⇒ elem (Right o) u
-- Es decir, que todo objeto que está en la lista de objetos de un universo, está en el universo.
-- ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????
----------------------------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 4-}
-- Definir la función objetos_en_posesión_de que dado un nombre de personaje y un universo, devuelve la lista de los objetos del universo que están en posesión del personaje con ese nombre.

objetos_en_posesión_de :: String -> Universo -> [Objeto]
objetos_en_posesión_de n u = filter (en_posesión_de n) (objetos_en u)

-- objetos_en_posesión_de :: String -> Universo -> [Objeto]
-- objetos_en_posesión_de n u = foldr (\x rec -> if es_un_objeto x && en_posesión_de n (objeto_de x) then objeto_de x : rec else rec) [] u
-- filtra los objetos que están en posesión del personaje con el nombre dado en el universo dado, recorre con foldr los elementos del universo, y para cada 
-- objeto, verifica si es un objeto (es_un_objeto) y si está en posesión del personaje con el nombre dado (en_posesión_de). 
-- Si ambas condiciones se cumplen, el objeto se agrega a la lista de resultados; de lo contrario, se ignora.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 5-}
-- Definir la función objeto_libre_mas_cercano que dado un personaje y un universo devuelve el objeto del universo más cercano al personaje. 
-- Se puede asumir que hay al menos un objeto en el universo. En caso de empate se puede devolver cualquiera de ellos.
-- Asume que hay al menos un objeto

-- distancia :: (Either Personaje Objeto) -> (Either Personaje Objeto) -> Float
-- distancia e1 e2 = norma2 (posición e1) (posición e2)

-- objetos_libres_en :: Universo -> [Objeto]
-- objetos_libres_en u = filter objeto_libre (objetos_en u)

-- objeto_libre :: Objeto -> Bool
-- objeto_libre = foldObjeto (const (const True)) (const (const False)) (const False)

objeto_libre_mas_cercano :: Personaje -> Universo -> Objeto 
objeto_libre_mas_cercano p u = foldr1 (\x1 x2 -> if distancia (Right x1) (Left p) < distancia (Right x2) (Left p) then x1 else x2) (objetos_libres_en u)

-- recorre con foldr1 los objetos libres en el universo, y para cada objeto, compara la distancia entre el objeto y el personaje con la distancia entre el
-- objeto y el personaje del objeto anterior. Si la distancia entre el objeto y el personaje es menor que la distancia entre el objeto y el personaje del
-- objeto anterior, se devuelve el objeto; de lo contrario, se devuelve el objeto anterior.
-- foldr1 toma como caso base el último elemento de la lista.
---------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 6-}
-- Definir la función tiene_thanos_todas_las_gemas que dado un universo devuelve si Thanos (es decir, si algún personaje del universo 
-- con nombre “Thanos”) ya tiene las 6 gemas en su posesión en ese universo (es decir, si la cantidad de objetos en su posesión que son 
-- gemas es igual a 6).

tiene_thanos_todas_las_gemas :: Universo -> Bool
tiene_thanos_todas_las_gemas u = 6 == (length (filter es_una_gema (objetos_en_posesión_de "Thanos" u)))
-- puede haber muchos Thanos ????????????????????????????????????????????????????????????????????????????????????????????????????????????????
---------------------------------------------------------------------------------------------------------------------------------------------
{-Ejercicio 7-}
-- Definir la función podemos_ganarle_a_thanos que toma un universo y devuelve si en ese universo tenemos alguna chance de ganarle a Thanos. 
-- Para que exista esa chance necesitamos en primer lugar que no haya pasado ya que Thanos haya conseguido todas las gemas (en ese caso
-- ya perdimos) y por otro que Thor pueda vencerlo con Stormbreaker (es decir, que estén en el universo el personaje de nombre “Thor” y 
-- el objeto de nombre “StormBreaker”) o que Wanda pueda destruir la Gema de la Mente matando a Visión (es decir, que estén en el universo los
-- personajes de nombre “Wanda” y “Visión” y además que el personaje de nombre “Visión” esté en posesión del objeto de nombre “Gema de la Mente”).

-- está_el_personaje :: String -> Universo -> Bool
-- está_el_personaje n = foldr (\x r -> es_un_personaje x && nombre x == n && (está_vivo $ personaje_de x) || r) False

-- está_el_objeto :: String -> Universo -> Bool
-- está_el_objeto n = foldr (\x r -> es_un_objeto x && nombre x == n && not (fue_destruido $ objeto_de x) || r) False

podemos_ganarle_a_thanos :: Universo -> Bool
podemos_ganarle_a_thanos = (not tiene_thanos_todas_las_gemas) && stormbreaker || tiene_gema_de_la_mente
  where stormbreaker = está_el_personaje "Thor" && está_el_objeto "StormBreaker"
        tiene_gema_de_la_mente = está_el_personaje "Wanda" && está_el_personaje "Visión" && en_posesión_de "Visión" (objeto_de_nombre "Gema de la Mente")

---------------------------------------------------------------------------------------------------------------------------------------------
{-Tests-}

main :: IO Counts
main = do runTestTT allTests

allTests = test [ -- Reemplazar los tests de prueba por tests propios
  "ejercicio1" ~: testsEj1,
  "ejercicio2" ~: testsEj2,
  "ejercicio3" ~: testsEj3,
  "ejercicio4" ~: testsEj4,
  "ejercicio5" ~: testsEj5,
  "ejercicio6" ~: testsEj6,
  "ejercicio7" ~: testsEj7
  ]

phil = Personaje (0,0) "Phil"
mjölnir = Objeto (2,2) "Mjölnir"
universo_sin_thanos = universo_con [phil] [mjölnir]

testsEj1 = test [ -- Casos de test para el ejercicio 1
  foldPersonaje (\p s -> 0) (\r d -> r+1) (\r -> r+1) phil             -- Caso de test 1 - expresión a testear
    ~=? 0                                                               -- Caso de test 1 - resultado esperado
  ,
  foldPersonaje (\p s -> 0) (\r d -> r+1) (\r -> r+1) (Muere phil)     -- Caso de test 2 - expresión a testear
    ~=? 1                                                               -- Caso de test 2 - resultado esperado
  ]

testsEj2 = test [ -- Casos de test para el ejercicio 2
  posición_personaje phil       -- Caso de test 1 - expresión a testear
    ~=? (0,0)                   -- Caso de test 1 - resultado esperado
  ]

testsEj3 = test [ -- Casos de test para el ejercicio 3
  objetos_en []       -- Caso de test 1 - expresión a testear
    ~=? []            -- Caso de test 1 - resultado esperado
  ]

testsEj4 = test [ -- Casos de test para el ejercicio 4
  objetos_en_posesión_de "Phil" []       -- Caso de test 1 - expresión a testear
    ~=? []                             -- Caso de test 1 - resultado esperado
  ]

testsEj5 = test [ -- Casos de test para el ejercicio 5
  objeto_libre_mas_cercano phil [Right mjölnir]       -- Caso de test 1 - expresión a testear
    ~=? mjölnir                                       -- Caso de test 1 - resultado esperado
  ]

testsEj6 = test [ -- Casos de test para el ejercicio 6
  tiene_thanos_todas_las_gemas universo_sin_thanos       -- Caso de test 1 - expresión a testear
    ~=? False                                            -- Caso de test 1 - resultado esperado
  ]

testsEj7 = test [ -- Casos de test para el ejercicio 7
  podemos_ganarle_a_thanos universo_sin_thanos         -- Caso de test 1 - expresión a testear
    ~=? False                                          -- Caso de test 1 - resultado esperado
  ]