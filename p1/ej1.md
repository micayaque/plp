Currificación y tipos
---
#### Considerar las siguientes definiciones de funciones:
$\textcolor{purple}{(i.)}$ ¿Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float).

```haskell
max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y
```
```haskell
normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)
```
```haskell
subtract2 :: Float -> Float -> Float
subtract2 = flip (-)
```
```haskell
predecesor :: Float -> Float
predecesor = subtract 1
```
```haskell
evaluarEnCero :: (Float -> r) -> r
evaluarEnCero = \f -> f 0
```
```haskell
dosVeces :: (a -> a) -> a -> a
dosVeces = \f -> f . f
```
```haskell
flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = map flip
```
```haskell
flipRaro :: b -> (a -> b -> c) -> a -> c
flipRaro = flip flip
```
---

$\textcolor{purple}{(ii.)}$ Indicar cuáles de las funciones anteriores no están currificadas. 
```haskell
max2 :: (Float, Float) -> Float
max2 (x, y) | x >= y = x
            | otherwise = y
```
```haskell
normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x^2 + y^2)
```
---

Para cada una de ellas, definir la función currificada correspondiente. 

Recordar dar el tipo de la función.
```haskell
max2 :: Float -> Float -> Float
max2 x y = if x >= y then x else y
```
```haskell
normaVectorial' :: Float -> Float -> Float
normaVectorial' x y = sqrt (x^2 + y^2)
```