<font face="LaTeX">

<strong>Dadas las siguientes funciones:</strong>

```haskell
zip :: [a] -> [b] -> [(a,b)]
{Z0} zip = foldr (\x rec ys ->  if null ys
                                then []
                                else (x, head ys) : rec (tail ys)) (const [])
zip' :: [a] -> [b] -> [(a,b)]
{Z'0} zip' [] ys = []
{Z'1} zip' (x:xs) ys =  if null ys             
                        then [] 
                        else (x, head ys):zip' xs (tail ys)
```
<strong> Demostrar que `zip = zip'` utilizando inducción estructural y el principio de extensionalidad</strong>

### `zip = zip'`

### HI: `zip xs ys = zip' xs ys`

```haskell
zip xs ys = foldr (\x rec ys ->  if null ys
                    then []
                    else (x, head ys) : rec (tail ys)) (const []) xs ys
zip' xs ys = if null ys             
            then [] 
            else (x, head ys):zip' xs (tail ys)
```

Por principio de extensionalidad, para demostrar que dos funciones son iguales, se debe demostrar que para todo elemento del dominio, la función aplicada a ese elemento es igual en ambos casos.

Para demostrar que `zip = zip'` se debe demostrar que para todo `xs` y `ys`, `zip xs ys = zip' xs ys`.

#### <u>Caso base</u>

Para el caso base, se tiene que `xs = []` y `ys = []`.

Por Z0 y definición de const

```haskell
zip [] []   = foldr (\x rec ys ->  if null ys
                                then []
                                else (x, head ys) : rec (tail ys)) (const []) [] []
zip [] []   = const [] []
zip [] []   = []
```

Por Z'0:

```haskell
zip' [] []  = []
```

Por lo tanto, `zip [] [] = zip' [] [] = []`.

#### <u>Caso inductivo</u>

Para el caso inductivo, se tiene que `xs = x:xs'` e `ys = y:ys'`.

```haskell
zip (x:xs') (y:ys') = foldr (\x rec ys ->  if null ys
                                then []
                                else (x, head ys) : rec (tail ys)) (const []) (x:xs') (y:ys')
zip' (x:xs') (y:ys') = if null (y:ys')
                        then []
                        else (x, head (y:ys')):zip' xs' (tail (y:ys'))
```

Por Z0:

```haskell
zip (x:xs') (y:ys') = (x, y) : foldr (\x rec ys ->  if null ys
                                then []
                                else (x, head ys) : rec (tail ys)) (const []) xs' ys'
--vale por HI
```

Por Z'1:

```haskell
zip' (x:xs') (y:ys') = (x, y) : zip' xs' ys'
--vale por HI
```

Por lo tanto, `zip (x:xs') (y:ys') = zip' (x:xs') (y:ys')`.


</font>