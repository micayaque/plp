<font face="LaTeX">

## ∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys 

## Demostración

### Podemos demostrarlo usando el principio de inducción sobre listas.

### <u>Caso base</u>: `xs = []`

```hs
length (append [] ys) = length [] + length ys
--por definición de append
length ys = length [] + length ys
--por definición de length
length ys = 0 + length ys
length ys = length ys 
```
### Y por lo tanto vale el caso base

---

### <u>Caso inductivo</u>: P(xs) ⇒ P(x:xs)
### P(xs) = length (append xs ys) = length xs + length ys 

### P(x:xs) = length (append (x:xs) ys) = length (x:xs) + length ys

```hs
length (append (x:xs) ys) = length (x:xs) + length ys
--por definición de append
length (x:append xs ys) = length (x:xs) + length ys
--por definición de length
1 + length (append xs ys) = 1 + length xs + length ys
    length (append xs ys) = length xs + length ys
--vale por hipótesis inductiva
```

</font>