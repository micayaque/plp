$\textcolor{aqua}{(i.)}$ Definir la función `genLista :: a -> (a -> a) -> Integer -> [a]`, que genera una lista de una cantidad dada de elementos, a partir de un elemento inicial y de una función de incremento entre los elementos
de la lista. Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente.

```haskell
genLista :: a -> (a -> a) -> Integer -> [a]
genLista i f n = if n ==0 then [] else f i : genLista (f i) f (n-1)
```
---

**$\textcolor{aqua}{(ii.)}$** Usando
genLista, definir la función `desdeHasta`, que dado un par de números (el primero menor que el
segundo), devuelve una lista de números consecutivos desde el primero hasta el segundo.


```haskell
desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta d h = if d==h then [h] else d:desdeHasta (d+1) h
```

```haskell
desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta x y = genLista x (+1) (y-x+1) 
```