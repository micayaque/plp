### Considerar las siguientes funciones:

Indicar si la recursión utilizada en cada una de ellas es o no estructural. Si lo es, reescribirla utilizando foldr.
En caso contrario, explicar el motivo.

```haskell
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                        then [x]
                                    else x : elementosEnPosicionesPares (tail xs)
```

La recursión utilizada no es recursión estructural porque no sigue el esquema de hacer algo con la cabeza y la cola de la lista sino que usa la cabeza y la cola de la cola de la lista.

```haskell
entrelazar :: [a] -> [a] -> [a]
entrelazar []   = id
entrelazar (x:xs) = \ys ->  if null ys
                                then x : entrelazar xs []
                            else x : head ys : entrelazar xs (tail ys)
```

Esta función sí, sigue el esquema de recursión estructural.

```haskell
entrelazar :: [a] -> [a] -> [a]
entrelazar xs = foldr (\ x rec -> (ys -> if null ys 
                                then x : rec [] 
                            else x : head ys : rec tail ys)) id
```