--data Maybe a = Nothing | Just a
--data Either a b = Left a | Right b
-- Deinir la función:
-- inverso:: Float → Maybe Float que dado un número devuelve su inverso multiplicativo si está definido, 
-- o Nothing en caso contrario.

inverso:: Float -> Maybe Float
inverso a   | a /= 0    = Just (1 / a)
            | otherwise = Nothing

-- Deinir la función aEntero:: Either Int Bool → Int que convierte a entero una expresión que puede ser 
-- booleana o entera. En el caso de los booleanos, el entero que corresponde es 0 para False y 1 para True.

aEntero:: Either Int Bool -> Int
aEntero (Left a)    = a
aEntero (Right a)   = fromEnum a

-- fromEnum se usa para obtener el valor numérico asociado con un valor de tipo enumerado. 
-- Es decir, convierte un valor de un tipo enumerado en su representación numérica.