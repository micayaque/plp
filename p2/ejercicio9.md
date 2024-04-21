<font face="LaTeX">

*Dadas las funciones altura y cantNodos definidas en la práctica 1 para árboles binarios, demostrar la siguiente propiedad:*

```haskell
foldAEB :: (a -> b) -> (b -> a -> b -> b) -> AEB a -> b
foldAEB cHoja cBin arbol = case arbol of
    Hoja x -> cHoja x
    Bin i r d -> cBin (rec i) r (rec d)
  where rec = foldAEB cHoja cBin 

altura :: AEB a -> Int
altura = foldAEB (const 1) (\ri _ rd -> 1 + max ri rd)

cantNodos :: AEB a -> Int
cantNodos = foldAEB (const 1) (\ri _ rd -> 1 + ri + rd)
```

### *∀ x::AB a .altura x ≤ cantNodos x*

---



</font>