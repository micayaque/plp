Demostrar en deducción natural que vale $\vdash \sigma$ para cada una de las siguientes fórmulas. Para estas fórmulas es imprescindible usar **lógica clásica**:

$\color{pink}{i.}$ Absurdo clásico: $\color{pink}{(\neg \tau \Rightarrow \bot) \Rightarrow \tau}$






```math
\frac{}{(\neg \tau \Rightarrow \bot), \neg \tau \vdash \neg \tau \Rightarrow \bot} ax
\ \
\frac{}{(\neg \tau \Rightarrow \bot), \neg \tau \vdash \neg \tau} ax
```
```math
\frac{}{(\neg \tau \Rightarrow \bot), \neg \tau \vdash \bot} \Rightarrow_e
```
```math
\frac{}{(\neg \tau \Rightarrow \bot) \vdash \tau} {}_{PBC}
```
```math
\frac{}{\vdash \color{pink}{(\neg \tau \Rightarrow \bot) \Rightarrow \tau}} \Rightarrow_i
```

$\color{pink}{ii.}$ Ley de Peirce: $\color{pink}{((\tau \Rightarrow \rho) \Rightarrow \tau) \Rightarrow \tau}$






```math
??? consultar
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \tau} 
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash (\tau \Rightarrow \rho) \Rightarrow \tau} ax
\ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \neg \tau} ax
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash (\tau \Rightarrow \rho) \Rightarrow \tau} ax
\ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \tau} \bot_e
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 

\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \neg (\tau \Rightarrow \rho)} {}_{MT}
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \tau \Rightarrow \rho} \Rightarrow_i
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \bot} \neg_e
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau) \vdash \tau \lor \neg \tau} 
{}_{LEM}
\ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \tau \vdash \tau} {}_{ax}
\ \ 
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \tau} {}_{PBC}
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau) \vdash \tau} \lor_e
```
```math
\frac{}{\vdash \color{pink}{((\tau \Rightarrow \rho) \Rightarrow \tau) \Rightarrow \tau}} \Rightarrow_i
```


$\color{pink}{iii.}$ Tercero excluido: $\color{pink}{\tau \lor \neg \tau}$




```math
\frac{}{\vdash \color{pink}{\tau \lor \neg \tau}} {}_{LEM}
```


$\color{pink}{iv.}$ Consecuencia milagrosa: $\color{pink}{(\neg \tau \Rightarrow \tau) \Rightarrow \tau}$



```math
\frac{}{ (\neg \tau \Rightarrow \tau), \neg \tau \vdash \neg \tau \Rightarrow \tau} {}_{ax}
\ \
\frac{}{ (\neg \tau \Rightarrow \tau), \neg \tau \vdash \neg \tau} {}_{ax}
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
\frac{}{ (\neg \tau \Rightarrow \tau), \neg \tau \vdash \tau} \Rightarrow_e
\ \ \ \ \ \ \ \ \ \
\frac{}{ (\neg \tau \Rightarrow \tau), \neg \tau \vdash \neg \tau} ax
```
```math
\frac{}{ (\neg \tau \Rightarrow \tau), \neg \tau \vdash \bot} \neg_e
```
```math
\frac{}{ (\neg \tau \Rightarrow \tau) \vdash \tau} {}_{PBC}
```
```math
\frac{}{\vdash \color{pink}{(\neg \tau \Rightarrow \tau) \Rightarrow \tau}} \Rightarrow_i
```

$\color{pink}{v.}$ Contraposición clásica: $\color{pink}{(\neg \rho \Rightarrow \neg \tau) \Rightarrow (\tau \Rightarrow \rho)}$









$\color{pink}{vi.}$ Análisis de casos: $\color{pink}{(\rho \Rightarrow \rho) \Rightarrow (\neg \tau \Rightarrow \rho) \Rightarrow \rho}$








$\color{pink}{vii.}$ Implicación vs. disyunción: $\color{pink}{(\tau \Rightarrow \rho) \Leftrightarrow (\neg \tau \lor \rho)}$




