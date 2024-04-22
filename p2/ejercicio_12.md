<font face="LaTeX">

<strong>*Dados el tipo Polinomio definido en la práctica 1 y las siguientes funciones:*</strong>
    
```haskell
derivado :: Num a => Polinomio a -> Polinomio a
derivado poli = case poli of
                X        -> Cte 1
                Cte _    -> Cte 0
                Suma p q -> Suma (derivado p) (derivado q)
                Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)

sinConstantesNegativas :: Num a => Polinomio a -> Polinomio a
sinConstantesNegativas = foldPoli True (>=0) (&&) (&&)

esRaiz :: Num a => a -> Polinomio a -> Bool
esRaiz n p = evaluar n p == 0
```
<strong>*Demostrar las siguientes propiedades:*</strong>
```LaTeX
i. Num a=>∀p::Polinomio a ∀q::Polinomio a ∀r::a esRaiz r p ⇒ esRaiz r (Prod p q)
ii. Num a=>∀p::Polinomio a ∀k::a ∀e::a evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))
iii. Num a=>∀p::Polinomio a sinConstantesNegativas p⇒sinConstantesNegativas (derivado p)
```

<strong>*La recursión utilizada en la definición de la función derivado es estructural, primitiva o ninguna de las dos?*</strong>

---

*Inducción estructural*
---
*Principio de inducción sobre polinomios*
---
```hs
data Poli a = X
| Cte a
| Suma (Poli a) (Poli a)
| Prod (Poli a) (Poli a)
```

<strong>*Sea P una propiedad sobre expresiones de tipo Poli a tal que:*
1.  *`P(X)`*
2.  *∀k :: a. `P(Cte k)`*
3.  *∀p :: Poli a. ∀q :: Poli a. `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `*
4.  *∀p :: Poli a. ∀q :: Poli a. `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q)) (TI) `*

*Entonces ∀x :: Poli a. P(x).* </strong>

---

### i. `Num a=>∀p::(Polinomio a) ∀q::(Polinomio a) ∀r::a` 
### `(esRaiz r p) ⇒ (esRaiz r (Prod p q))`

---

<u>*Demostración*</u>

*Por inducción estructural en p.*

<u>*Casos base:*</u>

1.  `p = X`

    ```hs
    esRaiz r X ⇒ esRaiz r (Prod X q)
    ```
    Por `esRaiz n p = evaluar n p == 0`:
    ```hs
    evaluar r X == 0 => evaluar r (Prod X q) == 0
    ```
    Por la definición de evaluar: `evaluar r (Prod X q) = evaluar r X * evaluar r q` 
    ```hs
    evaluar r X == 0 => evaluar r X * evaluar r q == 0
    ```
    Si `evaluar r X == 0` es `True`, entonces `evaluar r X * evaluar r q == 0` es `True`.

    Si `evaluar r X == 0` es `False`, entonces la implicación vale trivialmente.

    Por lo tanto vale el caso base `p = X`.

    ---
2.  `p = Cte k`

    ```hs
    esRaiz r (Cte k) ⇒ esRaiz r (Prod (Cte k) q)
    ```
    Por `esRaiz n p = evaluar n p == 0`:
    ```hs
    evaluar r (Cte k) == 0 ⇒ evaluar r (Prod (Cte k) q) == 0
    ```
    Por la definición de evaluar: `evaluar r (Prod (Cte k) q) = evaluar r (Cte k) * evaluar r q`
    ```hs
    evaluar r (Cte k) == 0 ⇒ evaluar r (Cte k) * evaluar r q
    ```
    Si `evaluar r (Cte k) == 0` es `True`, entonces `evaluar r (Cte k) * evaluar r X == 0` es `True`.

    Si `evaluar r (Cte k) == 0` es False, entonces la implicación vale trivialmente.

    Por lo tanto vale el caso base `p = Cte k`.

    ---

<u>*Casos inductivos*</u>

3. `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `

    `P(p):`
    ```hs
    esRaiz r p ⇒ esRaiz r (Prod p z)
    ```
    `P(q):`
    ```hs
    esRaiz r q ⇒ esRaiz r (Prod q z)
    ```
    `HI:`
    ```hs
    (esRaiz r p ⇒ esRaiz r (Prod p z)) ∧ (esRaiz r q ⇒ esRaiz r (Prod q z)) 
    ```
    `TI:`
    ```hs
    (esRaiz r p ⇒ esRaiz r (Prod p z)) ∧ (esRaiz r q ⇒ esRaiz r (Prod q z))  => (esRaiz r (Suma p q) ⇒ esRaiz r (Prod (Suma p q) z))
    ```

    Por `esRaiz n p = evaluar n p == 0`:
    ```hs
    (evaluar r p == 0 ⇒ evaluar r (Prod p z) == 0) ∧ (evaluar r q == 0 ⇒ evaluar r (Prod q z) == 0)  =>
    (evaluar r (Suma p q) == 0 ⇒ evaluar r (Prod (Suma p q) z) == 0)
    ```
    Por la definición de evaluar: `evaluar r (Prod (Suma p q) z) = evaluar r (Suma p q) * evaluar r z`
    ```hs
    (evaluar r p == 0 ⇒ evaluar r p * evaluar r z == 0) ∧ (evaluar r q == 0 ⇒ evaluar r q * evaluar r z == 0)  => 
    (evaluar r (Suma p q) == 0 ⇒ evaluar r (Suma p q) * evaluar r z == 0)
    ```
    Por la definición de evaluar: `evaluar r (Suma p q) = evaluar r p + evaluar r q`
    ```hs
    (evaluar r p == 0 ⇒ evaluar r p * evaluar r z == 0) ∧ (evaluar r q == 0 ⇒ evaluar r q * evaluar r z == 0)  =>
    (evaluar r p + evaluar r q == 0 ⇒ (evaluar r p + evaluar r q) * evaluar r z == 0)
    ```

    Por `HI` si `evaluar r p == 0` y `evaluar r q == 0` entonces `evaluar r p * evaluar r z == 0` y `evaluar r q == 0`. 

    ```hs
    (evaluar r p == 0 ⇒ evaluar r p * evaluar r z == 0) ∧ (evaluar r q == 0 ⇒ evaluar r q * evaluar r z == 0)  =>
    (0 + 0 == 0 ⇒ (0 + 0) * 0 == 0)
    (0 == 0 ⇒ 0 == 0)
    (True ⇒ True)
    True
    ```

    Por lo tanto vale el caso inductivo `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `.

    ---

4. `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q)) (TI) `

    `P(p): esRaiz r p ⇒ esRaiz r (Prod p z)`

    `P(q): esRaiz r q ⇒ esRaiz r (Prod q z)`

    `HI: (esRaiz r p ⇒ esRaiz r (Prod p z)) ∧ (esRaiz r q ⇒ esRaiz r (Prod q z))`

    `TI: HI  => (esRaiz r (Prod p q) ⇒ esRaiz r (Prod (Prod p q) z))`

    ```hs
    (esRaiz r p ⇒ esRaiz r (Prod p z)) ∧ (esRaiz r q ⇒ esRaiz r (Prod q z))  => (esRaiz r (Prod p q) ⇒ esRaiz r (Prod (Prod p q) z))
    ```
    Por `esRaiz n p = evaluar n p == 0`:
    ```hs
    (evaluar r p == 0 ⇒ evaluar r (Prod p z) == 0) ∧ (evaluar r q == 0 ⇒ evaluar r (Prod q z) == 0)  => 
    (evaluar r (Prod p q) == 0 ⇒ evaluar r (Prod (Prod p q) z) == 0)
    ```
    Por `evaluar r (Prod (Prod p q) z) = evaluar r (Prod p q) * evaluar r z`
    ```hs
    (evaluar r p == 0 ⇒ evaluar r (Prod p z) == 0) ∧ (evaluar r q == 0 ⇒ evaluar r (Prod q z) == 0)  => 
    (evaluar r p * evaluar r q == 0 ⇒ evaluar r (Prod p q) * evaluar r z == 0)
    ```
    Por `HI:` Si `evaluar r p == 0 => evaluar r (Prod p z) == 0` 
    ```hs
    (evaluar r p == 0 ⇒ evaluar r (Prod p z) == 0) ∧ (evaluar r q == 0 ⇒ evaluar r (Prod q z) == 0)  => 
    (0 * evaluar r q == 0 ⇒ 0 * evaluar r z == 0)
    0 == 0 ⇒ 0 == 0
    True
    ```

    Por lo tanto vale el caso inductivo `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q)) (TI) `.

    ---

Por lo tanto, por inducción estructural en `p`, se cumple que:

 `esRaiz r p ⇒ esRaiz r (Prod p q)`. $\blacksquare$

---

### ii. `Num a=>∀p::Polinomio a ∀k::a ∀e::a`
 
### `evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))`

---

<u>*Demostración*</u>

*Por inducción estructural en `p`.*

<u>*Casos base:*</u>

1.  `p = X`

    ```hs
    evaluar e (derivado (Prod (Cte k) X)) = evaluar e (Prod (Cte k) (derivado X))
    ```
    Por la definición de `derivado X -> Cte 1`:
    ```hs
    evaluar e (derivado (Prod (Cte k) X)) = evaluar e (Prod (Cte k) (Cte 1))
    ```
    Por la definición de `Prod`:
    ```hs
    evaluar e (derivado (Prod (Cte k) X)) = evaluar e Cte k
    ```
    Por la definición de `evaluar`:
    ```hs
    evaluar e (derivado (Prod (Cte k) X)) = k
    ```
    Por la definición de `derivado Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)`:
    ```hs
    evaluar e (Suma (Prod (derivado (Cte k)) X) (Prod (derivado X) (Cte k))) = k
    ```
    Por la definición de `derivado X -> Cte 1` y `derivado (Cte k) -> Cte 0`:
    ```hs
    evaluar e (Suma (Prod (Cte 0) X) (Prod (Cte 1) (Cte k))) = k
    ```
    Por la definición de `Prod`:
    ```hs
    evaluar e (Suma (Cte 0) (Cte k)) = k
    ```
    Por la definición de `Suma`:
    ```hs
    evaluar e (Cte k) = k
    ```
    Por la definición de `evaluar`:
    ```hs
    k = k
    ```

    Por lo tanto vale el caso base `p = X`.

    ---

2.  `p = Cte k`

    ```hs
    evaluar e (derivado (Prod (Cte k) (Cte k))) = evaluar e (Prod (Cte k) (derivado (Cte k)))
    ```
    Por la definición de `derivado Cte k -> Cte 0`:
    ```hs
    evaluar e (derivado (Prod (Cte k) (Cte k))) = evaluar e (Prod (Cte k) (Cte 0))
    ```
    Por la definición de `Prod`:
    ```hs
    evaluar e (derivado (Prod (Cte k) (Cte k))) = evaluar e (Cte 0)
    ```
    Por la definición de `evaluar`:
    ```hs
    evaluar e (derivado (Prod (Cte k) (Cte k))) = 0
    ```
    Por la definición de `derivado Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)`:
    ```hs
    evaluar e (Suma (Prod (derivado (Cte k)) (Cte k)) (Prod (derivado (Cte k)) (Cte k))) = 0
    ```
    Por la definición de `derivado Cte k -> Cte 0`:
    ```hs
    evaluar e (Suma (Prod (Cte 0) (Cte k)) (Prod (Cte 0) (Cte k))) = 0
    ```
    Por la definición de `Prod`:
    ```hs
    evaluar e (Suma (Cte 0) (Cte 0)) = 0
    ```
    Por la definición de `Suma`:
    ```hs
    evaluar e (Cte 0) = 0
    ```
    Por la definición de `evaluar`:
    ```hs
    0 = 0
    True
    ```

    Por lo tanto vale el caso base `p = Cte k`.

    ---


<u>*Casos inductivos*</u>

3. `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `

    `P(p): evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))`

    `P(q): evaluar e (derivado (Prod (Cte k) q)) = evaluar e (Prod (Cte k) (derivado q))`

    `P(Suma p q): evaluar e (derivado (Prod (Cte k) (Suma p q))) = evaluar e (Prod (Cte k) (derivado (Suma p q))`

    ```hs
    evaluar e (derivado (Prod (Cte k) (Suma p q))) = evaluar e (Prod (Cte k) (derivado (Suma p q)))
    ```
    Por la definición de `derivado Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)`:
    ```hs
    evaluar e (Suma (Prod (derivado (Cte k)) (Suma p q)) (Prod (derivado (Suma p q)) (Cte k))) = evaluar e (Prod (Cte k) (derivado (Suma p q)))
    ```
    Por la definición de `derivado Cte k -> Cte 0`:
    ```hs
    evaluar e (Suma (Prod (Cte 0) (Suma p q)) (Prod (derivado (Suma p q)) (Cte k))) = evaluar e (Prod (Cte k) (derivado (Suma p q)))
    ```
    Por la definición de `derivado Suma p q -> Suma (derivado p) (derivado q)`
    ```hs
    evaluar e (Suma (Prod (Cte 0) (Suma p q)) (Prod (Suma (derivado p) (derivado q)) (Cte k))) = evaluar e (Prod (Cte k) (Suma (derivado p) (derivado q)))
    ```
    Por la definición de `Prod`:
    ```hs
    evaluar e (Suma (Cte 0) (Prod (Suma (derivado p) (derivado q)) (Cte k))) = evaluar e (Prod (Cte k) (Suma (derivado p) (derivado q)))
    ```
    Por la definición de `Suma`:
    ```hs
    evaluar e (Prod (Suma (derivado p) (derivado q)) Cte k) = evaluar e (Prod (Cte k) (Suma (derivado p) (derivado q)))
    ```
    El orden de los factores no altera el producto:
    ```hs
    evaluar e (Prod (Suma (derivado p) (derivado q)) Cte k) = 
    evaluar e (Prod (Suma (derivado p) (derivado q)) Cte k)
    True
    ```
    Por lo tanto vale el caso inductivo `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `.


---

4. `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q))`

    `P(p): evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))`

    `P(q): evaluar e (derivado (Prod (Cte k) q)) = evaluar e (Prod (Cte k) (derivado q))`

    `P(Prod p q): evaluar e (derivado (Prod (Cte k) (Prod p q))) = evaluar e (Prod (Cte k) (derivado (Prod p q))`

    ---

    ```hs
    evaluar e (derivado (Prod (Cte k) (Prod p q))) = evaluar e (Prod (Cte k) (derivado (Prod p q)))
    ```
    Por la definición de `derivado Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)`:
    ```hs
    evaluar e (Suma (Prod (derivado (Cte k)) (Prod p q)) (Prod (derivado (Prod p q)) (Cte k))) = evaluar e (Prod (Cte k) (Suma (Prod (derivado p) q) (Prod (derivado q) p)))

    evaluar e (Suma (Prod (derivado (Cte k)) (Prod p q)) (Prod (Suma (Prod (derivado p) q) (Prod (derivado q) p)) (Cte k))) = evaluar e (Prod (Cte k) (Suma (Prod (derivado p) q) (Prod (derivado q) p)))

    ```
    Por la definición de `derivado Cte k -> Cte 0`:
    ```hs
    evaluar e (Suma (Prod (Cte 0) (Prod p q)) (Prod (Suma (Prod (derivado p) q) (Prod (derivado q) p)) (Cte k))) = evaluar e (Prod (Cte k) (Suma (Prod (derivado p) q) (Prod (derivado q) p)))
    ```
    Por la definición de `Prod`:
    ```hs
    evaluar e (Suma (Cte 0) (Prod (Suma (Prod (derivado p) q) (Prod (derivado q) p)) (Cte k))) = evaluar e (Prod (Cte k) (Suma (Prod (derivado p) q) (Prod (derivado q) p)))
    ```
    Por la definición de `Suma`:
    ```hs
    evaluar e (Prod (Suma (Prod (derivado p) q) (Prod (derivado q) p)) (Cte k)) = 
    evaluar e (Prod (Cte k) (Suma (Prod (derivado p) q) (Prod (derivado q) p)))
    ```
    Como en los polinomios el orden de los factores no altera el Producto:
    ```hs
    evaluar e (Prod (Suma (Prod (derivado p) q) (Prod (derivado q) p)) (Cte k)) = 
    evaluar e (Prod (Suma (Prod (derivado p) q) (Prod (derivado q) p)) (Cte k))
    True
    ```
    Por lo tanto vale el caso inductivo `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q))`.

    ---

Por lo tanto, por inducción estructural en `p`, se cumple que: 

`evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))`. $\blacksquare$

---

### iii. `Num a=>∀p::Polinomio a` 
### `sinConstantesNegativas p⇒sinConstantesNegativas (derivado p)`

---

<u>*Demostración*</u>

*Por inducción estructural en `p`.*

<u>*Casos base:*</u>

1.  `p = X`

    ```hs
    sinConstantesNegativas X ⇒ sinConstantesNegativas (derivado X)
    ```
    Por la definición de `derivado X -> Cte 1`:
    ```hs
    sinConstantesNegativas X ⇒ sinConstantesNegativas (Cte 1)
    ```
    Por la definición de `sinConstantesNegativas = foldPoli True (>=0) (&&) (&&)`:
    ```hs
    True ⇒ sinConstantesNegativas (Cte 1)
    True ⇒ True
    True
    ```

    Por lo tanto vale el caso base `p = X`.

    ---

2.  `p = Cte k`

    ```hs
    sinConstantesNegativas (Cte k) ⇒ sinConstantesNegativas (derivado (Cte k))
    ```
    Por la definición de `derivado Cte k -> Cte 0`:
    ```hs
    sinConstantesNegativas (Cte k) ⇒ sinConstantesNegativas (Cte 0)
    ```
    Por la definición de `sinConstantesNegativas = foldPoli True (>=0) (&&) (&&)`:
    ```hs
    Cte k >= 0 ⇒ Cte 0 >= 0
    Cte k >= 0 ⇒ True
    True
    ```
    Por lo tanto vale el caso base `p = Cte k`.

    ---

<u>*Casos inductivos*</u>

3. `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `

    `P(p): sinConstantesNegativas p ⇒ sinConstantesNegativas (derivado p)`

    `P(q): sinConstantesNegativas q ⇒ sinConstantesNegativas (derivado q)`

    `P(Suma p q): sinConstantesNegativas (Suma p q) ⇒ sinConstantesNegativas (derivado (Suma p q))`

    ```hs
    sinConstantesNegativas (Suma p q) ⇒ sinConstantesNegativas (derivado (Suma p q))
    ```
    Por la definición de `derivado Suma p q -> Suma (derivado p) (derivado q)`:
    ```hs
    sinConstantesNegativas (Suma p q) ⇒ sinConstantesNegativas (Suma (derivado p) (derivado q))
    ```
    Por la definición de `sinConstantesNegativas = foldPoli True (>=0) (&&) (&&)`:
    ```hs
    (sinConstantesNegativas p && sinConstantesNegativas q) ⇒ (sinConstantesNegativas (derivado p) && sinConstantesNegativas (derivado q))
    ```
    Y esto vale por hipótesis inductiva.

    Por lo tanto vale el caso inductivo `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q))`.

    ---

4. `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q))`

    `P(p): sinConstantesNegativas p ⇒ sinConstantesNegativas (derivado p)`

    `P(q): sinConstantesNegativas q ⇒ sinConstantesNegativas (derivado q)`

    `P(Prod p q): sinConstantesNegativas (Prod p q) ⇒ sinConstantesNegativas (derivado (Prod p q))`

    ```hs
    sinConstantesNegativas (Prod p q) ⇒ sinConstantesNegativas (derivado (Prod p q))
    ```
    Por la definición de `derivado Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)`:
    ```hs
    sinConstantesNegativas (Prod p q) ⇒ sinConstantesNegativas (Suma (Prod (derivado p) q) (Prod (derivado q) p))
    ```
    Por la definición de `sinConstantesNegativas = foldPoli True (>=0) (&&) (&&)`:
    ```hs
    (sinConstantesNegativas p && sinConstantesNegativas q) ⇒ 
    (sinConstantesNegativas (Prod (derivado p) q) && sinConstantesNegativas (Prod (derivado q) p))

    (sinConstantesNegativas p && sinConstantesNegativas q) ⇒
    (sinConstantesNegativas (derivado p) && sinConstantesNegativas q) && (sinConstantesNegativas (derivado q) && sinConstantesNegativas p)

    (sinConstantesNegativas p && sinConstantesNegativas q) ⇒
    (sinConstantesNegativas (derivado p) && sinConstantesNegativas (derivado q))
    ```
    Y esto vale por hipótesis inductiva.

    Por lo tanto vale el caso inductivo `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q))`.

    ---

Por lo tanto, por inducción estructural en `p`, se cumple que:

 `sinConstantesNegativas p ⇒ sinConstantesNegativas (derivado p)`. $\blacksquare$

---

*La recursión utilizada en la definición de la función `derivado` es estructural.*


</font>