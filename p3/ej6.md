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



```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
\frac{}{ (\neg \rho \Rightarrow \neg \tau), \tau \vdash   \tau} {}_{ax}
```
```math
\frac{}{ (\neg \rho \Rightarrow \neg \tau), \tau \vdash \neg \rho \Rightarrow \neg \tau} {}_{ax}
\ \
\frac{}{ (\neg \rho \Rightarrow \neg \tau), \tau \vdash  \neg \neg \tau} \neg \neg_i
```
```math
\frac{}{ (\neg \rho \Rightarrow \neg \tau), \tau \vdash \neg \neg \rho}  {}_{MT}
```
```math
\frac{}{ (\neg \rho \Rightarrow \neg \tau), \tau \vdash \rho} \neg \neg_e
```
```math
\frac{}{ (\neg \rho \Rightarrow \neg \tau) \vdash (\tau \Rightarrow \rho)} \Rightarrow_i
```
```math
\frac{}{\vdash \color{pink}{(\neg \rho \Rightarrow \neg \tau) \Rightarrow (\tau \Rightarrow \rho)}} \Rightarrow_i
```

$\color{pink}{vi.}$ Análisis de casos: $\color{pink}{(\rho \Rightarrow \rho) \Rightarrow (\neg \tau \Rightarrow \rho) \Rightarrow \rho}$







```math
????? consultar
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
\frac{}{ (\rho \Rightarrow \rho) , (\neg \tau \Rightarrow \rho), \tau \vdash \bot}
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
\frac{}{ (\rho \Rightarrow \rho) , (\neg \tau \Rightarrow \rho), \tau \vdash \bot} 
```
```math
\frac{}{ (\rho \Rightarrow \rho) , (\neg \tau \Rightarrow \rho) \vdash \neg \tau \Rightarrow \rho} {}_{ax}
\ \
\frac{}{ (\rho \Rightarrow \rho) , (\neg \tau \Rightarrow \rho) \vdash \neg \tau} \neg_i
```
```math
\frac{}{ (\rho \Rightarrow \rho) , (\neg \tau \Rightarrow \rho) \vdash \rho} \Rightarrow_e
```
```math
\frac{}{ (\rho \Rightarrow \rho) \vdash (\neg \tau \Rightarrow \rho) \Rightarrow \rho} \Rightarrow_i
```
```math
\frac{}{\vdash \color{pink}{(\rho \Rightarrow \rho) \Rightarrow ((\neg \tau \Rightarrow \rho) \Rightarrow \rho)}} 
```




$\color{pink}{vii.}$ Implicación vs. disyunción: $\color{pink}{(\tau \Rightarrow \rho) \Leftrightarrow (\neg \tau \lor \rho)}$




```math
\Rightarrow  ?????? consultar
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\frac{}{ (\tau \Rightarrow \rho), \neg \tau \vdash \bot} 
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\frac{}{ (\tau \Rightarrow \rho) \vdash \neg \neg \tau} {}_{PBC}
```
```math
\frac{}{ (\tau \Rightarrow \rho) \vdash \tau \Rightarrow \rho} {}_{ax}
\ \
\frac{}{ (\tau \Rightarrow \rho) \vdash \tau} \neg \neg_e
```
```math
\frac{}{ (\tau \Rightarrow \rho) \vdash \rho} \Rightarrow_e
```
```math
\frac{}{ (\tau \Rightarrow \rho) \vdash \neg \tau \lor \rho} \lor_{i_2}
```
```math
\frac{}{\vdash \color{orange}{(\tau \Rightarrow \rho) \Rightarrow (\neg \tau \lor \rho)} } \Rightarrow_i
```
```math
\frac{}{\vdash \color{orange}{(\tau \Rightarrow \rho) \Rightarrow (\neg \tau \lor \rho)} }
\ \
\frac{}{\vdash \color{cyan}{(\neg \tau \lor \rho) \Rightarrow (\tau \Rightarrow \rho)}}
```
```math
\frac{}{\vdash \color{pink}{(\tau \Rightarrow \rho) \Leftrightarrow (\neg \tau \lor \rho)}}
```

---



```math
\frac{}{ (\neg \tau \lor \rho), \tau, \neg \tau, \neg \rho \vdash \tau}   {}_{ax}
\ \
\frac{}{ (\neg \tau \lor \rho), \tau, \neg \tau, \neg \rho \vdash \neg \tau}   {}_{ax}

```
```math
\frac{}{ (\neg \tau \lor \rho), \tau, \neg \tau, \neg \rho \vdash \bot}  \neg_e
```
```math
\frac{}{ (\neg \tau \lor \rho), \tau \vdash \neg \tau \lor \rho} {}_{ax}
\ \
\frac{}{ (\neg \tau \lor \rho), \tau, \neg \tau \vdash \rho} {}_{PBC}
\ \
\frac{}{ (\neg \tau \lor \rho), \tau, \rho \vdash \rho} {}_{ax}
```
```math
\frac{}{ (\neg \tau \lor \rho), \tau \vdash \rho} \lor_e

```
```math
\frac{}{ (\neg \tau \lor \rho) \vdash (\tau \Rightarrow \rho)} \Rightarrow_i

```
```math
\frac{}{\vdash \color{cyan}{(\neg \tau \lor \rho) \Rightarrow (\tau \Rightarrow \rho)}} \Rightarrow_i
```
```math
\frac{}{\vdash \color{orange}{(\tau \Rightarrow \rho) \Rightarrow (\neg \tau \lor \rho)} }
\ \
\frac{}{\vdash \color{cyan}{(\neg \tau \lor \rho) \Rightarrow (\tau \Rightarrow \rho)}}
```
```math
\frac{}{\vdash \color{pink}{(\tau \Rightarrow \rho) \Leftrightarrow (\neg \tau \lor \rho)}}
```