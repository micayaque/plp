Utilizando el árbol de inferencia, inferir el tipo de las siguientes expresiones o demostrar que no son tipables.

En cada paso donde se realice una unificación, mostrar el conjunto de ecuaciones a unificar y la sustitución obtenida como resultado de la misma.

## $\lambda x.\ \lambda y.\ \lambda z.\ z\ x\ y\ z$

Árbol:

![Árbol de inferencia](./img/image%20copy%202.png)

$\color{purple}W(z) \rightsquigarrow \{x : X_k\} \vdash x : X_k, \ \ X_k \text{incógnita fresca}$

> $W(z) \rightsquigarrow \{z:X_1\} \vdash z:X_1$

> $W(x) \rightsquigarrow \{x:X_2\} \vdash x:X_2$

> $W(y) \rightsquigarrow \{y:X_3\} \vdash y:X_3$

> $W(z) \rightsquigarrow \{z:X_4\} \vdash z:X_4$

$\color{violet}W(U V) \rightsquigarrow S(\Gamma_1) \cup S(\Gamma_2) \vdash S(M N) : S(X_k) \text{, donde}$
* $\color{violet}W(U) = \Gamma_1 \vdash M : \tau$
* $\color{violet}W(V) = \Gamma_2 \vdash N : \rho$
* $\color{violet}X_k \text{variable fresca}$
* $\color{violet}S = MGU\{\tau =^? \rho \rightarrow X_k\} \cup \{\sigma_1 =^? \sigma_2\ |\ x : \sigma_1 \in \Gamma_1, x : \sigma_2 \in \Gamma_2\}$

> $W(z\ x) \rightsquigarrow \{z:X_2 \to X_5\}, \{x:X_2\} \vdash z\ x : X_5$

$S=MGU\{X_1 =^? X_2 \to X_5\} = \{X_1 := X_2 \to X_5\}$

> $W((z\ x)\ y) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash (z\ x)\ y) : X_6$

$S=MGU\{X_5 =^? X_3 \to X_6\} = \{X_5 := X_3 \to X_6\}$

> $W(((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash ((z\ x)\ y)\ z : X_7 \rightsquigarrow \{z:X_2 \to X_3 \to X_4 \to X_7\}, \{x:X_2\}, \{y:X_3\} \vdash ((z\ x)\ y)\ z : X_7$

$S=MGU\{X_6 =^? X_4 \to X_7\} = X_6 := X_4 \to X_7$ 


$\color{orange} W(\lambda x. U) \rightsquigarrow \Gamma' \vdash  \lambda x : \tau'.M : \tau' \rightarrow \rho \text{, donde}$
* $\color{orange}W(U) = \Gamma \vdash M : \rho$
*   ```math
    \color{orange}
    \tau' = \begin{cases} 
    \alpha & \text{si } x : \alpha \in \Gamma  \\
    X_k \text{con } X_k \text{variable fresca} & \text{en otro caso}
    \end{cases}
    ```
* $\color{orange}\Gamma' = \Gamma \ominus	\{x\}$

> $W(\lambda z.\ ((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash \lambda z: X_2 \to X_3 \to X_6.\ ((z\ x)\ y)\ z : X_2 \to X_3 \to X_6 \to X_7$

> $W(\lambda y.\ \lambda z.\ ((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash \lambda y:X_3.\ \lambda z: X_2 \to X_3 \to X_6.\ ((z\ x)\ y)\ z : X_3 \to X_2 \to X_3 \to X_6 \to X_7$

> $W(\lambda x.\ \lambda y.\ \lambda z.\ ((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash \lambda x:X_2 .\ \lambda y:X_3.\ \lambda z: X_2 \to X_3 \to X_6.\ ((z\ x)\ y)\ z : X_2 \to X_3 \to X_2 \to X_3 \to X_6 \to X_7$


## $\lambda x.\ x\ (w\ (\lambda y.\ w\ y))$

Árbol:

![Árbol de inferencia](./img/image%20copy%203.png)

$\color{purple}W(z) \rightsquigarrow \{x : X_k\} \vdash x : X_k, \ \ X_k \text{incógnita fresca}$

> $W(y) \rightsquigarrow \{y:X_1\} \vdash y:X_1$

> $W(w) \rightsquigarrow \{w:X_2\} \vdash w:X_2$

$\color{violet}W(U V) \rightsquigarrow S(\Gamma_1) \cup S(\Gamma_2) \vdash S(M N) : S(X_k) \text{, donde}$
* $\color{violet}W(U) = \Gamma_1 \vdash M : \tau$
* $\color{violet}W(V) = \Gamma_2 \vdash N : \rho$
* $\color{violet}X_k \text{variable fresca}$
* $\color{violet}S = MGU\{\tau =^? \rho \rightarrow X_k\} \cup \{\sigma_1 =^? \sigma_2\ |\ x : \sigma_1 \in \Gamma_1, x : \sigma_2 \in \Gamma_2\}$

> $W(w\ y) \rightsquigarrow \{y:X_1\}, \{w:X_2\} \vdash w\ y : X_3 \rightsquigarrow \{y:X_2 \to X_3\}, \{w:X_2\} \vdash w\ y : X_3$

$S = MGU\{X_1 =^? X_2 \to X_3\} = \{X_1 := X_2 \to X_3\}$

$\color{orange} W(\lambda x. U) \rightsquigarrow \Gamma' \vdash  \lambda x : \tau'.M : \tau' \rightarrow \rho \text{, donde}$
* $\color{orange}W(U) = \Gamma \vdash M : \rho$
*   ```math
    \color{orange}
    \tau' = \begin{cases} 
    \alpha & \text{si } x : \alpha \in \Gamma  \\
    X_k \text{con } X_k \text{variable fresca} & \text{en otro caso}
    \end{cases}
    ```
* $\color{orange}\Gamma' = \Gamma \ominus	\{x\}$

> $W(\lambda y.\ w\ y) \rightsquigarrow \{y:X_1\}, \{w:X_2\} \vdash \lambda y:X_1.\ w\ y : X_1 \to X_3$

> $W(w) \rightsquigarrow \{w:X_4\} \vdash w:X_4$

> $W(w\ (\lambda y.\ w\ y)) \rightsquigarrow  \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash w\ (\lambda y.\ w\ y) : X_5 \rightsquigarrow \{w:X_1 \to X_3 \to X_5\}, \{y:X_1\}, \{w:X_2\} \vdash w\ (\lambda y:X_1.\ w\ y) : X_5$

$S = MGU\{X_4 =^? X_1 \to X_3 \to X_5\} = \{X_4 := X_1 \to X_3 \to X_5\}$

> $W(x) \rightsquigarrow \{x:X_6\} \vdash x:X_6$

> $W(x\ (w\ \lambda y.\ w\ y)) \rightsquigarrow  \{x:X_6\}, \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash x\ (w\ \lambda y.\ w\ y) : X_7$

$S = MGU\{X_6 =^? X_5 \to X_7 \} = \{X_6 := X_5 \to X_7\}$

> $W(x\ (w\ \lambda y.\ w\ y)) \rightsquigarrow  \{x:X_5 \to X_7\}, \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash x\ (w\ \lambda y.\ w\ y) : X_7$

> $W(\lambda x.\ x\ (w\ \lambda y.\ w\ y)) \rightsquigarrow  \{x:X_5 \to X_7\}, \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash \lambda x.\ x\ (w\ \lambda y.\ w\ y) : X_5 \to X_7 \to X_7$


* λx.λy. xy
* λx.λy. yx
* λx.(λx. x)
* λx.(λy. y)x
* (λz.λx. x (z (λy. z))) True