Deducción natural
---
Demostrar en deducción natural que las siguientes fórmulas son teoremas sin usar principios de razonamiento clásicos salvo que se indique lo contrario. 

Recordemos que una fórmula $\sigma$ es un teorema si y sólo si vale $\vdash \sigma$:

$\color{pink}i.$ $Modus\ ponens$ relativizado: $\color{pink}{(\rho \Rightarrow \sigma \Rightarrow \tau) \Rightarrow (\rho \Rightarrow
\sigma) \Rightarrow \rho \Rightarrow \tau}$

La implicación es asociativa a derecha $\tau \Rightarrow \sigma \Rightarrow \rho = (\tau \Rightarrow (\sigma \Rightarrow \rho))$

$(\rho \Rightarrow \sigma \Rightarrow \tau) \Rightarrow (\rho \Rightarrow
\sigma) \Rightarrow \rho \Rightarrow \tau = (\rho \Rightarrow \sigma \Rightarrow \tau) \Rightarrow ((\rho \Rightarrow
\sigma) \Rightarrow \rho \Rightarrow \tau)$

---

```math
 \frac{}{(\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \rho \Rightarrow \sigma \Rightarrow \tau} \ \ \ ax \ \ \ \ \frac{}{\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \rho } \ \ \ ax \ \ \ \ \ \ \frac{}{\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \rho \Rightarrow \sigma} \ \ \  ax \ \ \ \ \ \ \frac{}{\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \rho} \ \ \ ax
```

```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{(\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \sigma \Rightarrow \tau} \ \ \ \Rightarrow_e \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \sigma} \ \ \  \Rightarrow_e
```

```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{(\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma), \rho \vdash \tau}\ \ \  \Rightarrow_e
```

```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{(\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \Rightarrow
\sigma) \vdash \rho \Rightarrow \tau}\ \ \  \Rightarrow_i
```

```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{(\rho \Rightarrow \sigma \Rightarrow \tau) \vdash (\rho \Rightarrow
\sigma) \Rightarrow (\rho \Rightarrow \tau)}\ \ \ \Rightarrow_i
```

```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{\vdash (\rho \Rightarrow \sigma \Rightarrow \tau) \Rightarrow ((\rho \Rightarrow
\sigma) \Rightarrow \rho \Rightarrow \tau)}\ \ \ \Rightarrow_i
```


$\color{pink}{ii.}$ Reducción al absurdo: $\color{pink}{(\rho \Rightarrow \bot) \Rightarrow \neg \rho}$





