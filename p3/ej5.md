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

vi i. de Morgan (I): ¬(ρ ∨σ) ⇔(¬ρ ∧¬σ)

vi i i. de Morgan (I I): ¬(ρ ∧σ) ⇔ (¬ρ ∨¬σ). Para la
dirección ⇒ es necesario usar principios de razo-
namiento clásicos.

ix. Conmutatividad (∧): (ρ ∧σ) ⇒(σ ∧ρ)

x. Aso ciatividad (∧): ((ρ ∧σ) ∧τ) ⇔(ρ ∧(σ ∧τ))

xi. Conmutatividad (∨): (ρ ∨σ) ⇒(σ ∨ρ)

xi i. Aso ciatividad (∨): ((ρ ∨σ) ∨τ) ⇔(ρ ∨(σ ∨τ))

¿Encuentra alguna relación entre teoremas de adjunción, aso ciatividad y conmutatividad con algunas de las
propiedades demostradas en la práctica 2?

