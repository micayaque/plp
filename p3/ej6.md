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
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau, \tau \vdash \tau} {}_{ax}
\ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau, \tau \vdash \neg \tau} {}_{ax}
\hspace{6cm}
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau, \tau \vdash \bot} \neg_e
\hspace{6cm}
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau, \tau \vdash \rho} \bot_e
\hspace{5.6cm}
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \tau \Rightarrow \rho} \Rightarrow_i
\ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash (\tau \Rightarrow \rho) \Rightarrow \tau} {}_{ax}
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \tau} \Rightarrow_e
\ \
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \neg \tau} {}_{ax} 
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau), \neg \tau \vdash \bot} \neg_e
```
```math
\frac{}{ ((\tau \Rightarrow \rho) \Rightarrow \tau) \vdash \tau} {}_{PBC}
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
\frac{}{ \Gamma \vdash \neg \tau \Rightarrow \rho } {}_{ax}

 \ \

 \frac{}{ \Gamma \vdash \neg  \rho } {}_{ax}

\hspace{6.7cm}

```
```math
\color{red} \Gamma = (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho
```
```math
\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho \vdash \neg \neg \tau} {}_{MT}

\hspace{2cm}

\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho \vdash \tau \Rightarrow \rho} {}_{ax}
\ \
\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho \vdash \neg \rho} {}_{ax}
```
```math
\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho \vdash \tau} \neg \neg_e
\hspace{3cm}
\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho \vdash \neg \tau} {}_{MT}
```
```math
\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho), \neg \rho \vdash \bot} \neg_e
```
```math
\frac{}{ (\tau \Rightarrow \rho) ,  (\neg \tau \Rightarrow \rho) \vdash \rho} {}_{PBC}
```
```math
\frac{}{ (\tau \Rightarrow \rho) \vdash (\neg \tau \Rightarrow \rho) \Rightarrow \rho} \Rightarrow_i
```
```math
\frac{}{\vdash \color{pink}{(\tau \Rightarrow \rho) \Rightarrow ((\neg \tau \Rightarrow \rho) \Rightarrow \rho)}} \Rightarrow_i
```


$\color{pink}{vii.}$ Implicación vs. disyunción: $\color{pink}{(\tau \Rightarrow \rho) \Leftrightarrow (\neg \tau \lor \rho)}$



```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho), \tau  \vdash  \tau \Rightarrow \rho} {}_{ax}
\ \
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho), \tau  \vdash  \tau}  {}_{ax}
\hspace{5cm}
```
```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho), \tau  \vdash  \rho} \Rightarrow_e
\hspace{4.5cm}
```
```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho), \tau  \vdash \neg \tau \lor \rho} \lor{i_2}
\ \
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho), \tau  \vdash \neg (\neg \tau \lor \rho)} {}_{ax}
\hspace{5.5cm}
```
```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho), \tau  \vdash \bot} \neg_e
\hspace{5.5cm} 
```
```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho)  \vdash \neg \tau} {}_{PBC}
\hspace{5.5cm} 
```                                    
```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho)  \vdash \neg \tau \lor \rho} \lor_{i_1}
\ \
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho)  \vdash \neg (\neg \tau \lor \rho) } {}_{ax}
```
```math
\frac{}{(\tau \Rightarrow \rho), \neg (\neg \tau \lor \rho)  \vdash \bot} \neg_e
```
```math
\frac{}{(\tau \Rightarrow \rho) \vdash (\neg \tau \lor \rho)} {}_{PBC}
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