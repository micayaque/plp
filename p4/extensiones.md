En esta sección puede asumirse, siempre que sea necesario, que el cálculo ha sido extendido con la suma de números naturales $(M + N)$, con las siguiente reglas de tipado y semántica:

```math
\frac{\Gamma \vdash M : Nat \hspace{1cm} \Gamma \vdash N : Nat}{\Gamma \vdash M + N : Nat} {}_+
```

Si $M \rightarrow M′$, entonces: $M + N \rightarrow M′+ N \hspace{1cm} (+_{c_1})$

Si $N \rightarrow N′$, entonces: $V + N \rightarrow V + N′ \hspace{1.3cm} (+_{c_2})$

$V + zero \rightarrow V \hspace{4.9cm} (+_0)$

$V_1 + succ(V_2) \rightarrow succ(V_1) + V_2 \hspace{2.4cm} (+_{succ})$

