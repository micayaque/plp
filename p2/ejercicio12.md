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
* *`P(X)`*
* *∀k :: a. `P(Cte k)`*
* *∀p :: Poli a. ∀q :: Poli a. `((P(p) ∧ P(q)) (HI) ⇒ P(Suma p q)) (TI) `*
* *∀p :: Poli a. ∀q :: Poli a. `((P(p) ∧ P(q)) (HI) ⇒ P(Prod p q)) (TI) `*

*Entonces ∀x :: Poli a. P(x).* </strong>

---

i. `Num a=>∀p::(Polinomio a) ∀q::(Polinomio a) ∀r::a (esRaiz r p) ⇒ (esRaiz r (Prod p q))`
---

<u>*Demostración*</u>

*Por inducción estructural en p.*

<u>*Casos base:*</u>

* `p = X`

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
* `p = Cte k`

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

<u>*Hipótesis inductiva:*</u>

```hs
esRaiz r p ⇒ esRaiz r (Prod p q)
```

<u>*Paso inductivo:*</u>







ii. Num a=>∀p::Polinomio a ∀k::a ∀e::a evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))
iii. Num a=>∀p::Polinomio a sinConstantesNegativas p⇒sinConstantesNegativas (derivado p)

</font>