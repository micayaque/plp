#### El siguiente esquema captura la $\textcolor{purple}{\underline{recursión\ primitiva}}$ sobre listas.
```haskell
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z []         = z
recr f z (x : xs)   = f x xs (recr f z xs)
```
**a.** Definir la función `sacarUna :: Eq a => a -> [a] -> [a]`
, que dados un **elemento** y una **lista** devuelve el resultado de eliminar de la lista la primera aparición del elemento (si está presente).

```haskell
sacarUna :: a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if e==x then xs else x:rec) []
```

---

**b.** Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función `sacarUna` del punto anterior.

El esquema foldr continuaría procesando los elementos de la lista hasta el final.
Con recr podemos directamente retornar la cola de la lista y dejar de procesar el resto de los elementos.

---

**c.** Definir la función `insertarOrdenado
:: Ord a => a -> [a] -> [a]` que inserta un elemento en una lista ordenada (de manera creciente), de manera que se preserva el ordenamiento.

```haskell
--versión naive
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e []       = [e]
insertarOrdenado e (x:xs)   =   if e <= x 
                                    then e:x:xs 
                                else x:insertarOrdenado e xs
```

```haskell
--versión recr
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr (\x xs rec -> if e <= x 
                                            then e:x:xs
                                        else x:rec) [e]
```

---