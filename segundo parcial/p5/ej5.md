Utilizando el árbol de inferencia, inferir el tipo de las siguientes expresiones o demostrar que no son tipables.

En cada paso donde se realice una unificación, mostrar el conjunto de ecuaciones a unificar y la sustitución obtenida como resultado de la misma.

## $\lambda x.\ \lambda y.\ \lambda z.\ z\ x\ y\ z$


![Árbol de inferencia](./img/image%20copy%202.png)

$\color{purple}W(z) \rightsquigarrow \{x : X_k\} \vdash x : X_k, \ \ X_k \text{incógnita fresca}$

> $W(z) \rightsquigarrow \{z:X_1\} \vdash z:X_1$

> $W(x) \rightsquigarrow \{x:X_2\} \vdash x:X_2$

> $W(y) \rightsquigarrow \{y:X_3\} \vdash y:X_3$

> $W(z) \rightsquigarrow \{z:X_4\} \vdash z:X_4$


> $W(z\ x) \rightsquigarrow \{z:X_2 \to X_5\}, \{x:X_2\} \vdash z\ x : X_5$

$S=MGU\{X_1 =^? X_2 \to X_5\} = \{X_1 := X_2 \to X_5\}$

> $W((z\ x)\ y) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash (z\ x)\ y) : X_6$

$S=MGU\{X_5 =^? X_3 \to X_6\} = \{X_5 := X_3 \to X_6\}$

> $W(((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash ((z\ x)\ y)\ z : X_7 \rightsquigarrow \{z:X_2 \to X_3 \to X_4 \to X_7\}, \{x:X_2\}, \{y:X_3\} \vdash ((z\ x)\ y)\ z : X_7$

$S=MGU\{X_6 =^? X_4 \to X_7\} = X_6 := X_4 \to X_7$ 



> $W(\lambda z.\ ((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash \lambda z: X_2 \to X_3 \to X_6.\ ((z\ x)\ y)\ z : X_2 \to X_3 \to X_6 \to X_7$

> $W(\lambda y.\ \lambda z.\ ((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash \lambda y:X_3.\ \lambda z: X_2 \to X_3 \to X_6.\ ((z\ x)\ y)\ z : X_3 \to X_2 \to X_3 \to X_6 \to X_7$

> $W(\lambda x.\ \lambda y.\ \lambda z.\ ((z\ x)\ y)\ z) \rightsquigarrow \{z:X_2 \to X_3 \to X_6\}, \{x:X_2\}, \{y:X_3\} \vdash \lambda x:X_2 .\ \lambda y:X_3.\ \lambda z: X_2 \to X_3 \to X_6.\ ((z\ x)\ y)\ z : X_2 \to X_3 \to X_2 \to X_3 \to X_6 \to X_7$


## $\lambda x.\ x\ (w\ (\lambda y.\ w\ y))$


![Árbol de inferencia](./img/image%20copy%203.png)

$\color{purple}W(z) \rightsquigarrow \{x : X_k\} \vdash x : X_k, \ \ X_k \text{incógnita fresca}$

> $W(y) \rightsquigarrow \{y:X_1\} \vdash y:X_1$

> $W(w) \rightsquigarrow \{w:X_2\} \vdash w:X_2$


> $W(w\ y) \rightsquigarrow \{y:X_1\}, \{w:X_2\} \vdash w\ y : X_3 \rightsquigarrow \{y:X_2 \to X_3\}, \{w:X_2\} \vdash w\ y : X_3$

$S = MGU\{X_1 =^? X_2 \to X_3\} = \{X_1 := X_2 \to X_3\}$

> $W(\lambda y.\ w\ y) \rightsquigarrow \{y:X_1\}, \{w:X_2\} \vdash \lambda y:X_1.\ w\ y : X_1 \to X_3$

> $W(w) \rightsquigarrow \{w:X_4\} \vdash w:X_4$

> $W(w\ (\lambda y.\ w\ y)) \rightsquigarrow  \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash w\ (\lambda y.\ w\ y) : X_5 \rightsquigarrow \{w:X_1 \to X_3 \to X_5\}, \{y:X_1\}, \{w:X_2\} \vdash w\ (\lambda y:X_1.\ w\ y) : X_5$

$S = MGU\{X_4 =^? X_1 \to X_3 \to X_5\} = \{X_4 := X_1 \to X_3 \to X_5\}$

> $W(x) \rightsquigarrow \{x:X_6\} \vdash x:X_6$

> $W(x\ (w\ \lambda y.\ w\ y)) \rightsquigarrow  \{x:X_6\}, \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash x\ (w\ \lambda y.\ w\ y) : X_7$

$S = MGU\{X_6 =^? X_5 \to X_7 \} = \{X_6 := X_5 \to X_7\}$

> $W(x\ (w\ \lambda y.\ w\ y)) \rightsquigarrow  \{x:X_5 \to X_7\}, \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash x\ (w\ \lambda y.\ w\ y) : X_7$

> $W(\lambda x.\ x\ (w\ \lambda y.\ w\ y)) \rightsquigarrow  \{x:X_5 \to X_7\}, \{w:X_4\}, \{y:X_1\}, \{w:X_2\} \vdash \lambda x.\ x\ (w\ \lambda y.\ w\ y) : X_5 \to X_7 \to X_7$


## $\lambda x.\ \lambda y.\ x\ y$


![Árbol de inferencia](./img/image%20copy%204.png)

> $W(x) = x:X_1 \vdash x:X_1$

> $W(y) = y:X_2 \vdash y:X_2$

$W(x\ y) = x:X_1, y:X_2 \vdash x\ y:X_3$

$S = MGU\{X_1 =^? X_2 \to X_3\} = \{X_1 := X_2 \to X_3\}$

> $W(x\ y) = x:X_2 \to X_3, y:X_2 \vdash x\ y:X_3$

> $W(\lambda y.\ x\ y) = x:X_2 \to X_3, y:X_2 \vdash \lambda y:X_2.\ x\ y:X_2 \to X_3$

> $W(\lambda x.\ \lambda y.\ x\ y) = x:X_2 \to X_3, y:X_2 \vdash \lambda x:X_2 \to X_3.\ \lambda y.\ x\ y:X_2 \to X_3 \to X_2 \to X_3$


## $\lambda x.\ \lambda y.\ y\ x$


![Árbol de inferencia](./img/image%20copy%205.png)

> $W(y) = y:X_1 \vdash y:X_1$

> $W(x) = x:X_2 \vdash x:X_2$

 $W(y\ x) = y:X_1, x:X_2 \vdash y\ x:X_3$

$S = MGU\{X_1 =^? X_2 \to X_3\} = \{X_1 := X_2 \to X_3\}$

> $W(y\ x) = y:X_2 \to X_3, x:X_2 \vdash y\ x:X_3s$

> $W(\lambda y.\ y\ x) = y:X_2 \to X_3, x:X_2 \vdash \lambda y:X_2 \to X_3.\ y\ x:X_2 \to X_3 \to  X_3$

> $W(\lambda x.\ \lambda y.\ y\ x) = y:X_2 \to X_3, x:X_2 \vdash \lambda x:X_2.\ \lambda y.\ y\ x: X_2 \to X_2 \to X_3 \to  X_3$


## $\lambda x.\ (\lambda x.\ x)$


![Árbol de inferencia](./img/image%20copy%206.png)

> $W(x) = x:X_1 \vdash x:X_1$

> $W(\lambda x.\ x) = x:X_1 \vdash \lambda x:X_1.\ x : X_1 \to X_1$

> $W(\lambda x.\ (\lambda x.\ x)) = \empty \vdash \lambda x:X_2.\ (\lambda x.\ x) : X_2 \to X_1 \to X_1$


## $\lambda x.\ (\lambda y.\ y)\ x$

![Árbol de inferencia](./img/image%20copy%207.png)

>$W(y) = y:X_1 \vdash y:X_1$

>$W(\lambda y.\ y) = \empty \vdash \lambda y:X_1.\ y:X_1 \to X_1$

>$W(x) = x:X_2 \vdash x:X_2$

$W((\lambda y.\ y)\ x) = x:X_2 \vdash (\lambda y.\ y)\ x:X_3$

$S = MGU\{X_1 \to X_1 =^? X_2 \to X_3\} = \{X_1 =^? X_2, X_1 =^? X_3\} = \{X_2 =^? X_3\} = \{X_2 := X_3\}$

>$W((\lambda y.\ y)\ x) = x:X_3 \vdash (\lambda .\ y)\ x:X_3$

>$W(\lambda x.\ (\lambda y.\ y)\ x) = \empty \vdash \lambda x:X_3.\ (\lambda y.\ y)\ x : X_3 \to X_3$


## $(\lambda z.\ \lambda x.\ x\ (z\ (\lambda y.\ z)))\ True$

![Árbol de inferencia](./img/image%20copy%208.png)

>$W(z) = z:X_1 \vdash z:X_1$

>$W(z) = z:X_2 \vdash z:X_2$

> $W(\lambda y.\ z) = z:X_1 \vdash \lambda y:X_3.\ z: X_3 \to X_1$

> $W(x) = x:X_4 \vdash x:X_4$

> $W(z\ \lambda y.\ z) =z:X_2, z:X_1 \vdash z\ \lambda y.\ z : X_5$ 

$S = MGU\{X_2 =^? X_3 \to X_1 \to X_5, X_2 =^? X_1 \}_{elim} = \{X_1 := X_3 \to X_1 \to X_5 \}_{Falla, occurs-check}$