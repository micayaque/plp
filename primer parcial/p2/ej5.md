Dadas las siguientes funciones:
```hs
zip :: [a] -> [b] -> [(a,b)]
{Z0} zip = foldr (\x rec ys ->
                    if null ys
                    then []
                    else (x, head ys) : rec (tail ys))
                    (const [])
```
```hs
zip' :: [a] -> [b] -> [(a,b)]
{Z'0} zip' [] ys = []
{Z'1} zip' (x:xs) ys = if null ys 
                        then [] 
                    else (x, head ys):zip' xs (tail ys)
```
Demostrar que $zip = zip'$ utilizando `inducción estructural` y el `principio de extensionalidad`.

Por el principio de extensionalidad funcional basta ver que para todo $xs$ e $ys :: [a]$  se cumple que $zip\ xs\ ys = zip'\ xs\ ys$.

**Inducción estructural sobre $xs$.**

$P(xs):\ zip\ xs\ ys = zip'\ xs\ ys$

<u>Caso base:</u>

$P([\ ]):\  zip\ [\ ]\ ys = zip'\ [\ ]\ ys$

Por `{Z0}` y `{Z'0}`:

$foldr\ (\backslash x'\ rec'\ ys'\ \rightarrow if\ null\ ys'\ then\ [\ ]\ else\ (x',\ head\ ys')\ :\ rec\ (tail\ ys'))\ (const\ [\ ])\ [\ ]\ ys = [\ ]$

Por la definición de `foldr`:

$const\ [\ ]\ ys = [\ ]$

$[\ ] = [\ ]$

$P([\ ])$ es verdadero.

<u>Caso inductivo:</u>

$P(xs) \Rightarrow P(x:xs)$

Supongo $P(xs)$ verdadero.

<u>Hipótesis inductiva:</u>

$zip\ xs\ ys = zip'\ xs\ ys$

$P(x:xs):\ zip\ (x:xs)\ ys = zip'\ (x:xs)\ ys$

Por `{Z0}` y `{Z'1}`:

$foldr\ (\backslash x'\ rec'\ ys'\ \rightarrow if\ null\ ys'\ then\ [\ ]\ else\ (x',\ head\ ys')\ :\ rec\ (tail\ ys'))\ (const\ [\ ])\ (x:xs)\ ys = if\ null\ ys\ then\ [\ ]\ else\ (x,\ head\ ys):zip'\ xs\ (tail\ ys)$

$(if\ null\ ys\ then\ [\ ]\ else\ (x, head\ ys))\ :\  foldr\ (\backslash x'\ rec'\ ys'\ \rightarrow if\ null\ ys'\ then\ [\ ]\ else\ (x',\ head\ ys')\ :\ rec\ (tail\ ys'))\ (const\ [\ ])\ xs\ (tail\ ys) = if\ null\ ys\ then\ [\ ]\ else\ (x,\ head\ ys):zip'\ xs\ (tail\ ys)$

Por `{Z0}`:

$(if\ null\ ys\ then\ [\ ]\ else\ (x, head\ ys))\ :\  zip\ xs\ (tail\ ys) = (if\ null\ ys\ then\ [\ ]\ else\ (x,\ head\ ys)):zip'\ xs\ (tail\ ys)$

Esto vale por HI.

<u>Lema:</u>

$Para\ toda\ lista\ xs,ys::[a]\ xs = ys \Rightarrow x:xs = x:ys $