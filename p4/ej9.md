Decimos que un tipo $\tau$ está $\color{pink}habitado$ si existe un término $M$ tal que el juicio $\vdash M : \tau$ es derivable. 

En ese caso, decimos que $M$ es un $\color{pink}{habitante}$ de $\tau$. 

Por ejemplo, dado un tipo $\sigma$, la identidad $\lambda x : \sigma .\ x$ es un $habitante$ del tipo $\sigma \rightarrow \sigma$. 

Demostrar que los siguientes tipos están $habitados$ (para cualquier $\sigma$, $\tau$ y $\rho$):

$a)\ \sigma \rightarrow \tau \rightarrow \sigma$

$M:=\lambda \ x : \sigma \ \lambda \ y: \ x $ 


```math
\frac{}
{x:\sigma, y:\tau  \vdash  x : \sigma} {}_{T-VAR}
```
```math
\frac{}
{x:\sigma \vdash \lambda \ y:\tau.\ x : \tau \rightarrow \sigma} {}_{T-ABS}
```
```math
\frac{}
{\vdash (\lambda \ x : \sigma \ \lambda \ y: \tau \ x) : \ \sigma \rightarrow \tau \rightarrow \sigma } {}_{T-ABS}
```

$b)\ (\sigma \rightarrow \tau \rightarrow \rho) \rightarrow (\sigma \rightarrow \tau) \rightarrow \sigma \rightarrow \rho$






```math
\frac{}{\vdash }
```

$c)\ (\sigma \rightarrow \tau \rightarrow \rho) \rightarrow \tau \rightarrow \sigma \rightarrow \rho$

$d)\ (\tau \rightarrow \rho) \rightarrow (\sigma \rightarrow \tau) \rightarrow \sigma \rightarrow \rho$

Para pensar: el tipo $b$ es el de la función conocida como $Combinador\ S$. 

¿Con qué función ya conocida de `Haskell` se corresponden los habitantes de los otros tipos? 

¿Hay tipos que no estén habitados? 

¿Si se reemplaza $\rightarrow$ por $\Rightarrow$, las fórmulas habitadas son siempre tautologías? 

¿Las tautologías son siempre fórmulas habitadas?