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
```math
\frac{}{(\rho \Rightarrow \bot), \rho \vdash \rho \Rightarrow \bot}ax \ \ \ \ \ \ \ \ \ \ \ \frac{}{(\rho \Rightarrow \bot), \rho \vdash \rho}ax
```
```math
\frac{}{(\rho \Rightarrow \bot), \rho \vdash \bot } \Rightarrow_e
```
```math
\frac{}{(\rho \Rightarrow \bot) \vdash \neg \rho} \neg_i
```
```math
\frac{}{\vdash (\rho \Rightarrow \bot) \Rightarrow \neg \rho} \Rightarrow_i
```

$\color{pink}{iii.}$ Introducción de la doble negación: $\color{pink}{\rho \Rightarrow \neg \neg \rho}$
```math
\frac{}{\rho, \neg \rho \vdash \rho} ax \ \ \ \ \ \frac{}{\rho, \neg \rho \vdash \neg \rho} ax
```
```math
\frac{}{\rho, \neg \rho \vdash \bot} \neg_e
```
```math
\frac{}{\rho \vdash \neg \neg \rho} \neg_i
```
```math
\frac{}{\vdash \rho \Rightarrow \neg \neg \rho} \ \Rightarrow_i
```

$\color{pink}{iv.}$ Eliminación de la triple negación: $\neg \neg \neg \rho \Rightarrow \neg \rho$
```math
\frac{}{\neg \neg \neg \rho, \rho, \neg \rho \vdash \rho} ax \ \ \ \frac{}{\neg \neg \neg \rho, \rho, \neg \rho \vdash \neg \rho} ax \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
```
```math
\frac{}{\neg \neg \neg \rho, \rho, \neg \rho \vdash \bot} \neg_e \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
```
```math
\frac{}{\neg \neg \neg \rho, \rho \vdash \neg \neg \rho} \neg_i \ \ \ \frac{}{\neg \neg \neg \rho, \rho \vdash \neg \neg \neg \rho} ax
```
```math
\frac{}{\neg \neg \neg \rho, \rho \vdash \bot} \neg_e
```
```math
\frac{}{\neg \neg \neg \rho \vdash \neg \rho} \neg_i
```
```math
\frac{}{\vdash \neg \neg \neg \rho \Rightarrow \neg \rho}\Rightarrow_i
```

$\color{pink}{v.}$ Contraposición: $\color{pink}{(\rho \Rightarrow \sigma) \Rightarrow (\neg \sigma \Rightarrow \neg \rho)}$
```math
\frac{}{(\rho \Rightarrow \sigma), \neg \sigma  , \rho\vdash \rho \Rightarrow \sigma} ax \ \ \frac{}{(\rho \Rightarrow \sigma), \neg \sigma  , \rho\vdash \rho} ax \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
```
```math
\frac{}{(\rho \Rightarrow \sigma), \neg \sigma  , \rho\vdash \sigma} \Rightarrow_e \ \ \ \frac{}{(\rho \Rightarrow \sigma), \neg \sigma  , \rho\vdash \neg \sigma} ax 
```
```math
\frac{}{(\rho \Rightarrow \sigma), \neg \sigma  , \rho\vdash \bot} \neg_e
```
```math
\frac{}{(\rho \Rightarrow \sigma), \neg \sigma \vdash \neg \rho} \neg_i
```
```math
\frac{}{(\rho \Rightarrow \sigma) \vdash \neg \sigma \Rightarrow \neg \rho} \Rightarrow_i
```
```math
\frac{}{\vdash (\rho \Rightarrow \sigma) \Rightarrow (\neg \sigma \Rightarrow \neg \rho)} \Rightarrow_i
```

$\color{pink}{vi.}$ Adjunción: $((\rho \land \sigma) \Rightarrow \tau) \Leftrightarrow (\rho \Rightarrow \sigma \Rightarrow \tau)$

Pruebo $\color{violet}{((\rho \land \sigma) \Rightarrow \tau) \Rightarrow (\rho \Rightarrow \sigma \Rightarrow \tau)}$ y $\color{cyan}{((\rho \Rightarrow \sigma \Rightarrow \tau) \Rightarrow (\rho \land \sigma) \Rightarrow \tau)}$

```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \frac{}{ ((\rho \land \sigma) \Rightarrow \tau) , \rho, \sigma \vdash \rho}ax \ \ \ \frac{}{ ((\rho \land \sigma) \Rightarrow \tau) , \rho, \sigma \vdash \sigma} ax
```
```math
\frac{}{ ((\rho \land \sigma) \Rightarrow \tau) , \rho, \sigma \vdash (\rho \land \sigma) \Rightarrow \tau}ax \ \ \ \frac{}{ ((\rho \land \sigma) \Rightarrow \tau) , \rho, \sigma \vdash \rho \land \sigma} \land_i
```
```math
\frac{}{ ((\rho \land \sigma) \Rightarrow \tau) , \rho, \sigma \vdash \tau} \Rightarrow_e
```
```math
\frac{}{ ((\rho \land \sigma) \Rightarrow \tau) , \rho \vdash \sigma \Rightarrow \tau} \Rightarrow_i
```
```math
\frac{}{ ((\rho \land \sigma) \Rightarrow \tau) \vdash \rho (\Rightarrow \sigma \Rightarrow \tau)} \Rightarrow_i
```
```math
\frac{}{\vdash \color{violet}{((\rho \land \sigma) \Rightarrow \tau) \Rightarrow (\rho \Rightarrow \sigma \Rightarrow \tau)}} \Rightarrow_i
```






```math
\ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \frac{}{((\rho \Rightarrow (\sigma \Rightarrow \tau)), (\rho \land \sigma) \vdash \rho \land \sigma} ax
```
```math
\frac{}{ ((\rho \Rightarrow (\sigma \Rightarrow \tau)), (\rho \land \sigma) \vdash \rho \Rightarrow ( \sigma \Rightarrow \tau)}ax \ \ \frac{}{((\rho \Rightarrow (\sigma \Rightarrow \tau)), (\rho \land \sigma) \vdash \rho} \land_{e_1} \ \ \ \ \ \ \ \ \ \ \ \frac{}{ ((\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \land \sigma) \vdash \rho \land \sigma} ax
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ ((\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \land \sigma) \vdash \sigma \Rightarrow \tau} \Rightarrow_e \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \frac{}{ ((\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \land \sigma) \vdash \sigma} \land_{e_2}
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ ((\rho \Rightarrow \sigma \Rightarrow \tau), (\rho \land \sigma) \vdash \tau} \Rightarrow_e
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ ((\rho \Rightarrow \sigma \Rightarrow \tau) \vdash (\rho \land \sigma) \Rightarrow \tau} \Rightarrow_i
```
```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{\vdash \color{cyan}{((\rho \Rightarrow \sigma \Rightarrow \tau) \Rightarrow (\rho \land \sigma) \Rightarrow \tau)}} \Rightarrow_i
```

$\color{pink}{vii.}$ de Morgan (I): $\color{pink}{\neg (\rho \lor \sigma ) \Leftrightarrow (\neg \rho \land \neg \sigma)}$

Pruebo $\color{violet}{\neg (\rho \lor \sigma ) \Rightarrow (\neg \rho \land \neg \sigma)}$ y $\color{cyan}{(\neg \rho \land \neg \sigma) \Rightarrow \neg (\rho \lor \sigma )}$

```math
 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \frac{}{ \Gamma_1 \vdash \rho} ax  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \frac{}{ \Gamma_2 \vdash \sigma} ax
```
```math
\frac{}{ \Gamma \vdash \neg(\rho \lor \sigma)} ax \ \frac{}{ \Gamma_1 \vdash \rho \lor \sigma} \lor_{i_1} \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ \Gamma_2 \vdash \neg (\rho \lor \sigma)} ax \ \frac{}{ \Gamma_2 \vdash\rho \lor \sigma} \lor{i_2}
```
```math
\color{red}{
\Gamma_1 = \neg (\rho \lor \sigma ), \rho \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \Gamma_2 = \neg (\rho \lor \sigma ), \sigma}
```
```math
\frac{}{ \neg (\rho \lor \sigma ), \rho \vdash \bot} \neg_e \ \ \frac{}{ \neg (\rho \lor \sigma ), \sigma \vdash \bot} \neg_e
```
```math
\frac{}{ \neg (\rho \lor \sigma ) \vdash \neg \rho}     \neg_i \ \ \frac{}{ \neg (\rho \lor \sigma ) \vdash \neg \sigma} \neg_i
```
```math
\frac{}{ \neg (\rho \lor \sigma ) \vdash \neg \rho \land \neg \sigma} \land_i
```
```math
\frac{}{\vdash \color{violet}{\neg (\rho \lor \sigma ) \Rightarrow (\neg \rho \land \neg \sigma)}} \Rightarrow_i
```




```math
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{\Gamma, \rho \vdash \neg \rho \land \neg \sigma}ax \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{\Gamma, \sigma \vdash \neg \rho \land \neg \sigma}ax
```
```math
\frac{}{\Gamma, \rho \vdash \rho} ax \ \ \frac{}{\Gamma, \rho \vdash \neg \rho} \land_{e_1} \ \ \ \ \ \ \ \frac{}{\Gamma, \sigma \vdash \sigma} ax \ \ \frac{}{\Gamma, \sigma \vdash \neg \sigma}  \land_{e_2}
```
```math
\frac{}{\Gamma \vdash \rho \lor \sigma } ax \ \  \ \ \ \ \ \ \ \  \  \ \frac{}{\Gamma, \rho \vdash \bot} \neg_e \ \ \ \  \ \ \ \ \ \ \ \  \  \  \frac{}{\Gamma, \sigma \vdash \bot} \neg_e
```
```math
\color{red}{\Gamma = (\neg \rho \land \neg \sigma), (\rho \lor \sigma )}
```
```math
\frac{}{(\neg \rho \land \neg \sigma), (\rho \lor \sigma ) \vdash \bot} \lor_e
```
```math
\frac{}{(\neg \rho \land \neg \sigma) \vdash \neg (\rho \lor \sigma )} \neg_i 
```
```math
\frac{}{\vdash \color{cyan}{(\neg \rho \land \neg \sigma) \Rightarrow \neg (\rho \lor \sigma )}} \Rightarrow_i

```


$\color{pink}{viii.}$ de Morgan (II): $\color{pink}{\neg (\rho \land \sigma) \Leftrightarrow (\neg \rho \lor \neg \sigma)}$. 

Para la dirección $\Rightarrow$ es necesario usar principios de razonamiento clásicos.

Pruebo $\color{violet}{\neg (\rho \land \sigma) \Rightarrow (\neg \rho \lor \neg \sigma)}$ y $\color{cyan}{(\neg \rho \lor \neg \sigma) \Rightarrow \neg (\rho \land \sigma)}$

```math
\ \  \ \  \  \ \ \  \ \ \ \  \ \   \ \ \  \ \ \ \  \ \  \  \ \ \  \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg (\neg \rho \lor \neg \sigma)}ax  \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg (\neg \rho \lor \neg \sigma)} ax 
```
```math
\ \  \ \  \  \ \ \  \ \ \ \  \ \   \ \ \  \ \ \ \  \ \  \  \ \ \  \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg \neg \rho \land \neg \neg \sigma}DM(vii)  \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg \neg \rho \neg \neg \sigma} DM(vii)
```
```math
\ \  \ \  \  \ \ \  \ \ \ \  \ \  \  \ \ \  \  \ \  \  \ \ \  \ \ \ \  \ \  \  \ \ \  \ \ \ \  \ \  \  \ \ \  \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg \neg \rho} \land_{e_2} \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg \neg \sigma} \land_{e_1}
```
```math
\ \  \ \  \  \ \ \  \ \ \ \  \ \  \  \ \ \  \  \ \  \  \ \ \  \ \ \ \  \ \  \  \ \ \  \ \ \ \  \ \  \  \ \ \  \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \rho} \neg \neg_e \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \sigma} \neg \neg_e
```
```math
\frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \neg(\rho \land \sigma)} ax \ \ \frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \rho \land \sigma} \land_i
```
```math
\frac{}{\neg (\rho \land \sigma), \neg (\neg \rho \lor \neg \sigma) \vdash \bot} \neg_e
```
```math
\frac{}{\neg (\rho \land \sigma) \vdash \neg \rho \lor \neg \sigma} PBC
```
```math
\frac{}{\vdash \color{violet}{\neg (\rho \land \sigma) \Rightarrow (\neg \rho \lor \neg \sigma)}} \Rightarrow_i
```










```math
 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \  \ \frac{}{ \Gamma, \neg \rho \vdash \rho \land \sigma} ax \ \ \ \ \ \ \ \  \ \  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ \Gamma, \neg \sigma \vdash \rho \land \sigma} ax
```
```math
 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ \Gamma, \neg \rho \vdash \neg \rho} ax \ \ \ \  \ \frac{}{ \Gamma, \neg \rho \vdash \rho} \land_{i_1} \ \ \ \ \ \ \ \  \ \ \frac{}{ \Gamma, \neg \sigma \vdash \neg \sigma} ax \ \ \frac{}{ \Gamma, \neg \sigma \vdash \sigma} \land_{i_2}
```
```math
\frac{}{ \Gamma \vdash \neg \rho \lor \neg \sigma} ax \  \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ \ \ \frac{}{ \Gamma, \neg \rho \vdash \bot} \neg_e \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \frac{}{ \Gamma, \neg \sigma \vdash \bot} \neg_e
```
```math
\color{red}{\Gamma = (\neg \rho \lor \neg \sigma), (\rho \land \sigma)}
```
```math
\frac{}{ (\neg \rho \lor \neg \sigma), (\rho \land \sigma) \vdash \bot} \lor_e
```
```math
\frac{}{ (\neg \rho \lor \neg \sigma) \vdash \neg (\rho \land \sigma)} \neg_i
```
```math
\frac{}{\vdash \color{cyan}{(\neg \rho \lor \neg \sigma) \Rightarrow \neg (\rho \land \sigma)}} \Rightarrow_i
```

$\color{pink}{ix.}$ Conmutatividad (∧): $\color{pink}{(\rho \land \sigma) \Rightarrow (\sigma \land \rho)}$



```math
\frac{}{ (\rho \land \sigma) \vdash \rho \land \sigma} ax \ \ \frac{}{ (\rho \land \sigma) \vdash  \rho \land \sigma}ax
```
```math
\frac{}{ (\rho \land \sigma) \vdash \sigma} \land_{e_2} \ \ \frac{}{ (\rho \land \sigma) \vdash  \rho} \land_{e_1}
```
```math
\frac{}{ (\rho \land \sigma) \vdash \sigma \land \rho} \land_i
```
```math
\frac{}{\vdash \color{pink}{(\rho \land \sigma) \Rightarrow (\sigma \land \rho)}} \Rightarrow_i
```

$\color{pink}{x.}$ Asociatividad (∧): $\color{pink}{((\rho \land \sigma) \land \tau) \Leftrightarrow (\rho \land(\sigma \land \tau))}$




```math
\frac{}{((\rho \land \sigma) \land \tau) \vdash \rho \land(\sigma \land \tau)}

\ \
\frac{}{(\rho \land(\sigma \land \tau)) \vdash (\rho \land \sigma) \land \tau}

```
```math
\frac{}{\vdash \color{orange}{((\rho \land \sigma) \land \tau) \Rightarrow (\rho \land(\sigma \land \tau))}} 
\Rightarrow_i
\ \
\frac{}{\vdash \color{cyan}{(\rho \land(\sigma \land \tau)) \Rightarrow ((\rho \land \sigma) \land \tau)}}
\Rightarrow_i
```
```math
\frac{}{\vdash \color{pink}{((\rho \land \sigma) \land \tau) \Rightarrow (\rho \land(\sigma \land \tau)) \land \color{pink}{(\rho \land(\sigma \land \tau)) \Rightarrow ((\rho \land \sigma) \land \tau)}}} \land_i
```
```math
\frac{}{\vdash \color{pink}{((\rho \land \sigma) \land \tau) \Leftrightarrow (\rho \land(\sigma \land \tau))}}
```

$\color{pink}{xi.}$ Conmutatividad (∨): $\color{pink}{(\rho \lor \sigma) \Rightarrow (\sigma \lor \sigma)}$

$\color{pink}{xii.}$ Asociatividad (∨): $\color{pink}{((\rho \lor \sigma) \lor \tau) \Leftrightarrow (\rho \lor (\sigma \lor \tau))}$

¿Encuentra alguna relación entre teoremas de $adjunción$, $asociatividad$ y $conmutatividad$ con algunas de las propiedades demostradas en la práctica $2$?