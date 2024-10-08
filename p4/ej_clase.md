$M, N, O := ...\ |\ Nil_{\sigma} \ |\ Bin(M, N, O)\ |\ map(M, N)$

$V := ...\ |\ Nil_{\sigma} \ |\ Bin(M, N, O)$

```math
\frac
{\Gamma \vdash M:\sigma \rightarrow \tau \hspace{1cm} \Gamma \vdash N:AB_{\sigma}}
{\Gamma \vdash map(M, N): AB_{\tau}}
```

```math
\frac{\Gamma \vdash M \rightarrow M'}{\Gamma \vdash map(M,N) \rightarrow map(M', N)}
```
```math
\frac{\Gamma \vdash N \rightarrow N'}{\Gamma \vdash map(V, N) \rightarrow map(V, N')}
```

```math
\frac{\vdash V : \sigma \rightarrow \rho}{\vdash map(V, Nil_{\sigma}) \rightarrow Nil_{\rho}}
```
```math
\frac{}{map(V, Bin(V_1, V_2, V_3)) \rightarrow Bin(map(V, V_1), V\ V_2, map(V, V_3))}
```
