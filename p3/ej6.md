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











$\color{pink}{iii.}$ Tercero excluido: $\color{pink}{\tau \lor \neg \tau}$











$\color{pink}{iv.}$ Consecuencia milagrosa: $\color{pink}{(\neg \tau \Rightarrow \tau) \Rightarrow \tau}$









$\color{pink}{v.}$ Contraposición clásica: $\color{pink}{(\neg \rho \Rightarrow \neg \tau) \Rightarrow (\tau \Rightarrow \rho)}$









$\color{pink}{vi.}$ Análisis de casos: $color{pink}{(\rho \Rightarrow \rho) \Rightarrow (\neg \tau \Rightarrow \rho) \Rightarrow \rho}$








$\color{pink}{vii.}$ Implicación vs. disyunción: $\color{pink}{(\tau \Rightarrow \rho) \Leftrightarrow (\neg \tau \lor \rho)}$




