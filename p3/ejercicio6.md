<font face="LaTex">

### <u>Deducción natural</u>

*Demostrar en deducción natural que las siguientes fórmulas son teoremas **sin usar principios de razonamiento clásicos** salvo que se indique lo contrario.*
#### Recordemos que una fórmula σ es un teorema si y sólo si vale $\vdash$ σ :*

*Nota: Las demostraciones se leen de abajo para arriba.*

---

### <u>*i.Modus ponens relativizado:*</u> (P ⇒ Q ⇒ R) ⇒ (P ⇒ Q) ⇒ P ⇒ R
---


$\frac{\Gamma \  \vdash \ (P ⇒ Q ⇒ R) \ \ \ \Gamma \ \vdash \ P }{\Gamma \ \vdash Q ⇒ R}{}⇒_e \frac{\Gamma \ \vdash \ P ⇒ Q \ \ \ \Gamma \ \vdash \ P}{\Gamma \ \vdash Q}⇒_e$
---

$\Gamma = (P ⇒ Q ⇒ R), \ (P ⇒ Q), \ P$\
Sabemos que P vale, entonces tenemos que: $\Gamma \vdash Q ⇒ R$,    $\Gamma \vdash Q$


![eliminación_implicacion](./img/elim_implicación.png)

$\frac{\Gamma \ \vdash Q ⇒ R\ \ \ \ \ \ \ \ \ \ \ \ \ \ \Gamma \ \vdash Q}{(P ⇒ Q ⇒ R),\ (P ⇒ Q), \ P \ \vdash R} ⇒_e$
---

Por: 
![introducción_implicación](./img/intro_implicación.png)

$\frac{(P ⇒ Q ⇒ R), \ (P ⇒ Q), \ P \ \vdash R}{(P ⇒ Q ⇒ R),\ (P ⇒ Q) \ \vdash P ⇒ R} ⇒_i$
---
$\frac{(P ⇒ Q ⇒ R), \ (P ⇒ Q) \ \vdash P ⇒ R}{(P ⇒ Q ⇒ R) \ \vdash (P ⇒ Q) ⇒ P ⇒ R} ⇒_i$
---
$\frac{(P ⇒ Q ⇒ R) \ \vdash (P ⇒ Q) ⇒ P ⇒ R}{\vdash (P ⇒ Q ⇒ R) ⇒ (P ⇒ Q) ⇒ P ⇒ R} ⇒_i$
---

---

### <u>*ii. Reducción al absurdo:*</u> (P ⇒ ⊥) ⇒ ¬P
---

$\frac{}{} $
---



</font>