Gramáticas a tener en cuenta:

Términos anotados

```math
M ::= x |\ \lambda x: \sigma .M\ |\ M\ M\ |\ True\ |\ False\ |\ if\ M\ then\ M\ else\ M\
|\ zero\ |\ succ(M)\ |\ pred(M)\ |\ isZero(M)\ |\ \mu x: \sigma .M
```

Donde la letra $x$ representa un nombre de variable arbitrario. 

Tales nombres se toman de un conjunto infinito dado $X= \{ w,w_1,w_2,...,x,x_1,x_2,...,y,y_1,y_2,...,f,f_1,f_2,... \}$

Términos sin anotaciones

```math
U ::= x\ |\ \lambda x.U\ |\ U\ U\ |\ True\ |\ False\ |\ if\ U\ then\ U\ else\ U\ |\ zero\ |\ succ(U)\ |\ pred(U)\ |\ isZero(U)\ |\ \mu x.U
```

Tipos

```math
\tau ::= Bool\ |\ Nat\ |\ \tau \rightarrow \tau\ |\ X_n
```

Donde $n$ es un número natural, de tal modo que $X_n$ representa una variable de tipos arbitraria tomada de un conjunto $T = \{X_1,X_2,X_3,...\}$.

Nota: también podemos referirnos a las variables de tipos como incógnitas.

