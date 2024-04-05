-- i. Definir la función curry, que dada una función de dos argumentos, devuelve su equivalente currificada.

-- curry' :: ((a,b) -> c) -> a -> b -> c 
-- curry' f = \x y -> f (x, y)

curry' :: ((a, b) -> c) -> a -> b -> c
curry' f x y = f (x, y)

-- ii. Definir la función uncurry, que dada una función currificada de dos argumentos, 
-- devuelve su versión no currificada equivalente. Es la inversa de la anterior.

-- uncurry' :: (a -> b -> c) -> (a, b) -> c
-- uncurry' f = \(x,y) -> f x y

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y

-- iii. ¿Se podría definir una función curryN, que tome una función de un número arbitrario de argumentos y
-- devuelva su versión currificada? Sugerencia: pensar cuál sería el tipo de la función.

{-  No podemos definir una función curryN que tome una función con un número arbitrario de parametros, 
    ya que la cantidad de parámetros de la función currificada depende de la cantidad de parámetros de la 
    función original. Esto significa que curryN debería poder modificar la cantidad de parámetros que toma 
    dependiendo de la función que se le pasa, lo que es imposible.
    Otra idea sería tratar de definirla de manera que dada una función vaya remplazando los parámetros de 
    a poco generando, de esta forma, n funciones parciales. Pero esto es imposible ya que la función debe 
    tener la tupla de parámetros completa para poder ser evaluada de cualquier manera.
-}

-- iv. ¿Y uncurryN? ¿Por qué?

{-  No podemos definir una función uncurryN que tome una función currificada con un número arbitrario de 
    parametros, ya que la cantidad de parámetros de la función no currificada depende de la cantidad de 
    parámetros de la función currificada. Esto significa que uncurryN debería poder modificar la cantidad de 
    parámetros que toma dependiendo de la función que se le pasa, lo que es imposible.
    Otra idea sería tratar de definirla de manera que dada una función currificada vaya remplazando los 
    parámetros de a poco generando, de esta forma, n funciones parciales. Pero esto es imposible ya que la 
    función debe tener la tupla de parámetros completa para poder ser evaluada de cualquier manera.
-}
