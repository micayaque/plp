--Ejercicio 2 ⋆
--i. Definir la función curry, que dada una función de dos argumentos, devuelve su equivalente currificada.

curry :: ((a, b) -> c) -> a -> b -> c
curry f x y = f (x, y)

--ii. Definir la función uncurry, que dada una función currificada de dos argumentos, devuelve su versión no
--currificada equivalente. Es la inversa de la anterior.

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (x, y) = f x y

--Ejemplo:  
--iii. ¿Se podría definir una función curryN, que tome una función de un número arbitrario de argumentos y
--devuelva su versión currificada?
--Sugerencia: pensar cuál sería el tipo de la función.

--No, no se puede definir una función curryN, 
--ya que no se puede definir una función que tome un número arbitrario de argumentos.