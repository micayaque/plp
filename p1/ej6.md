#### El siguiente esquema captura la $\textcolor{purple}{\underline{recursión\ primitiva}}$ sobre listas.
```haskell
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z []         = z
recr f z (x : xs)   = f x xs (recr f z xs)
```
**a.** Definir la función `sacarUna :: Eq a => a -> [a] -> [a]`
, que dados un **elemento** y una **lista** devuelve el resultado de eliminar de la lista la primera aparición del elemento (si está presente).

```haskell
sacarUna e = recr (\x xs rec -> if e==x then xs else x:rec) []
```

---

**b.** Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función `sacarUna` del punto anterior.

---

**c.** Definr la función `insertarOrdenado
:: Ord a => a -> [a] -> [a]` que inserta un elemento en una lista ordenada (de manera creciente), de manera que se preserva el ordenamiento.


---