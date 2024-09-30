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

$\color{pink}{iii.}$ Introducción de la doble negación: $\rho \Rightarrow \neg \neg \rho$

iv. Eliminación de la triple negación: ¬¬¬ρ ⇒¬ρ
v. Contrap osición: (ρ ⇒σ) ⇒(¬σ ⇒¬ρ)
vi. Adjunción: ((ρ ∧σ) ⇒τ) ⇔(ρ ⇒σ ⇒τ)
vi i. de Morgan (I): ¬(ρ ∨σ) ⇔(¬ρ ∧¬σ)
vi i i. de Morgan (I I): ¬(ρ ∧σ) ⇔ (¬ρ ∨¬σ). Para la
dirección ⇒ es necesario usar principios de razo-
namiento clásicos.
ix. Conmutatividad (∧): (ρ ∧σ) ⇒(σ ∧ρ)
x. Aso ciatividad (∧): ((ρ ∧σ) ∧τ) ⇔(ρ ∧(σ ∧τ))
xi. Conmutatividad (∨): (ρ ∨σ) ⇒(σ ∨ρ)
xi i. Aso ciatividad (∨): ((ρ ∨σ) ∨τ) ⇔(ρ ∨(σ ∨τ))
¾Encuentra alguna relación entre teoremas de adjunción, aso ciatividad y conmutatividad con algunas de las
propiedades demostradas en la práctica 2?

