Se extienden el Cálculo Lambda y algoritmo de inferencia para soportar uniones disjuntas de la siguiente manera:

```math
\tau ::= . . . | \tau + \tau
```

```math
M::= . . . | left_\tau (M ) | right_\tau (M ) | case M of left(x) \rightsquigarrow M [] right(y) \rightsquigarrow M
```

$W(left(U )) =^{def} \Gamma \vdash left_X (M ) : \sigma + X$
donde:
* $W(U ) = \Gamma \vdash M : \sigma$

* $X$ variable fresca

$W(right(U )) =^{def} \Gamma \vdash right_X (M ) : X + \tau$

donde:

* $W(U ) = \Gamma ⊢ M : \tau$
* $X$ variable fresca.

$W(case\ U_1\ of\ left(x) \rightsquigarrow U_2\ []\ right(y) \rightsquigarrow U_3 ) =^{def}
S\Gamma_1 \cup S\Gamma_{2'} ∪ S\Gamma_{3'} \vdash S(case\ M_1\ of\ left(x) \rightsquigarrow M_2\ []\ right(y) \rightsquigarrow M_3 ) : S\tau_2$

donde:

* $W(U_1 ) = \Gamma_1 \vdash M_1 : \tau_1$
* $W(U_2 ) = \Gamma_2 \vdash M_2 : \tau_2$
* $W(U_3) = \Gamma_3 ⊢ M_3 : \tau_3$

```math
\tau_x = \begin{cases}
\alpha \text{ si x :} \alpha \in \Gamma_2 \\
\text{Variable fresca en otro caso}
\end{cases}
```
```math
\tau_y = \begin{cases}
\beta \text{ si y :} \beta \in \Gamma_3 \\
\text{Variable fresca en otro caso}
\end{cases}
```

* $\Gamma_{2'} = \Gamma_2 \ominus \{x\}$
* $\Gamma_{3'} = \Gamma_3 \ominus \{y\}$


$S = mgu (\{\tau_1 =^? \tau_x + \tau_y , \tau_2 =^? \tau_3 \} \cup \{\rho =^? \sigma | z : \rho \in \Gamma_i \land z : \sigma \in \Gamma_j \land i, j \in \{1, 2' , 3' \}\})$

Utilizando esta extensión del algoritmo, encontrar los juicios de tipado más generales para los siguientes términos o indicar por qué no es posible:

$i.\ \text{case left(1) of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow True$

![árbol](./img/image%20copy%209.png)

>$W(1) = \empty \vdash 1 : Nat$

>$W(isZero(x)) = x:Nat \vdash isZero(x) : Bool$

>$W(left(1)) = \empty \vdash left_{X_1}(1) :  Nat + X_1$

>$W(True) = \empty \vdash True : Bool$

$\tau_x = Nat, \tau_y = X_2, \Gamma_{2'} = \Gamma_{3'} = \empty$

$S = MGU \{Nat + X_1 =^? Nat + X_2, Bool =? Bool\}=\{X_1 := X_2\}$

>$\empty \vdash \text{case left(1) of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow True : Bool$

$ii.\ \text{case right(z) of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow y$

>$\empty \vdash \text{case right(z) of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow y : Bool$

$iii.\ \text{case right(zero) of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow y$

![árbol](./img/image%20copy%2010.png)

>$W(isZero(x)) = x:Nat \vdash isZero(x) : Bool$

>$W(y) = y:X_1 \vdash y : X_1$

>$W(right(zero)) = \empty \vdash right_{X_2}(zero) : X_2 + Nat$

$S = MGU\{X_2 + Nat =^? Nat + X_1,Bool =^? X_1\}_{swap} = \{X_2 + Nat =^? Nat + X_1,X_1 =^? Bool\}_{elim} = \{X_2 + Nat =^? Nat + Bool\} = \{X_2 =^? Nat, Nat =^? Bool\}_{Falla}$

$iv.\ \text{case x of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow y$

![árbol](./img/image%20copy%2011.png)

>$W(isZero(x)) = x:Nat \vdash isZero(x) : Bool$

>$W(y) = y:X_1 \vdash y : X_1$

>$W(x) = x:X_2 \vdash x:X_2$

$\tau_x = Nat, \tau_y = X_1, \Gamma_{2'} = \Gamma_{3'} = \empty$

$S=MGU\{X_2 =^? Nat + X_1, X_2 =^? Bool\}_{elim} = \{X_2 =^? Nat + Bool\}$

>$x:Nat + Bool \vdash \text{case x of left(x)} \rightsquigarrow \text{isZero(x) [] right(y)} \rightsquigarrow y : Bool$

$v.\ \text{case left(z) of left(x)} \rightsquigarrow \text{z [] right(y)} \rightsquigarrow y$

$vi.\ \text{case z of left(x)} \rightsquigarrow \text{z [] right(y)} \rightsquigarrow y$