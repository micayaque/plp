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



</font>