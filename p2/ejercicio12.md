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

</font>