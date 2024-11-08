Notación para este segmento de la materia:
* las letras $M$, $N$, $O$, $P,...$ denotan $términos$.
* las letras $V$, $W$, $...$ denotan $valores$.
* las letras griegas $\rho$, $\sigma$, $\tau$, $...$ denotan $tipos$.

`Gramáticas a tener en cuenta:`

$Términos$

$M ::= x$ | $λx: \tau. M$ | $M M$ | $true$ | $false$ | $if\ M\ then\ M\ else\ M$ | $zero$ | $succ(M)$ | $pred(M)$ | $isZero(M)$

Donde la letra $x$ representa un nombre de variable arbitrario. 

Dichos nombres se toman de un conjunto
infinito numerable dado $X= {w,w_1,w_2,...,x,x_1,x_2,...,y,y_1,y_2,...,z,z_1,z_2,...}$

$Tipos$

$τ ::= Bool\ |\ Nat\ |\ \tau \rightarrow \tau$

