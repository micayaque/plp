$(vi)\ Diagonal(\exists) \ \exists X.P (X, X) \Rightarrow \exists X.\exists Y.P (X, Y ).$


```math
\frac{}{\exists X.P (X, X) \vdash \exists Y.P (Y, Y )}{ax}
```
```math
\frac{}{\exists X.P (X, X) \vdash \exists X.\exists Y.P (X, Y )}{\exists_i, \{X:=Y\}}
```
```math
\frac{}{\empty \vdash \exists X.P (X, X) \Rightarrow \exists X.\exists Y.P (X, Y )}{\Rightarrow_i}
```

$(xi) Existencial/disyunción: \exists X.(P (X) \lor Q(X)) \Leftrightarrow (\exists X.P (X) \lor \exists X.Q(X))$


```math
\hspace{7cm}

\hspace{0.5cm}
\frac{}{\Gamma,  \exists X. P (X), P(X) \vdash P (X)} {ax}
\hspace{1.5cm}


```


```math
\hspace{6cm}

\hspace{0.5cm}
\frac{}{\Gamma,  \exists X. P (X), P(X) \vdash P (X) \lor Q(X)} {\lor_{i_1}}
\hspace{1.5cm}


```


```math
\hspace{6cm}

\hspace{0.5cm}
\frac{}{\Gamma,  \exists X. P (X), P(X) \vdash P (X) \lor Q(X)} {\exists_i}
\hspace{1.5cm}

```


```math
\hspace{2cm}
\frac{}{\Gamma, \exists X. P (X) \vdash \exists X (P (X)}{ax}

\hspace{0.5cm}
\frac{}{\Gamma,  \exists X. P (X), P(X) \vdash \exists X.(P (X) \lor Q(X))} {\exists_i}
\hspace{1.5cm}

\frac{}{\leftarrow Análoga }

```

```math
\frac{}{\Gamma \vdash \exists X. P (X) \lor \exists X.Q(X)}{ax}
\hspace{0.5cm}
\frac{}{\Gamma, \exists X. P (X) \vdash \exists X.(P (X) \lor Q(X))}{\exists_e}
\hspace{4.5cm}
\frac{}{\Gamma, \exists X. Q (X) \vdash \exists X.(P (X) \lor Q(X))}
```

```math
\frac{}{\Gamma = \exists X.P (X) \lor \exists X.Q(X) \vdash \exists X.(P (X) \lor Q(X))} \lor_e
```
```math
\frac{}{\empty \vdash \exists X.P (X) \lor \exists X.Q(X) \Rightarrow \exists X.(P (X) \lor Q(X))}{\Rightarrow_i} 
```