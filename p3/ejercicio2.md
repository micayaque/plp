<font face="LaTeX">

*Mostrar que cualquier fórmula de la lógica proposicional que utilice los conectivos $¬$ (negación), $∧$ (conjunción), $∨$ (disyunción), $⇒$ (implicación), $⇔$ (equivalencia) puede reescribirse a otra fórmula equivalente que usa sólo los conectivos $¬$ y $∨$.*

*Sugerencia: hacer inducción en la estructura de la fórmula.*

*Nota: en los siguientes ejercicios de esta sección, recomendamos utilizar la semántica dada por la definición de valuación para proposiciones, y no tablas de verdad.*

Para demostrar que cualquier fórmula de la lógica proposicional que utilice los conectivos $¬$ (negación),  $∧$ (conjunción), $∨$ (disyunción), $⇒$ (implicación), $⇔$ (equivalencia) puede reescribirse a otra fórmula equivalente que usa solo los conectivos $¬$ y $∨$, podemos usar inducción estructural sobre la estructura de la fórmula como nos dice la sugerencia.

---

<u>Estructua de la fórmula:</u>

* Una variable proposicional 𝑝 es una fórmula.
* Si $\sigma$ es una fórmula, entonces ¬$\sigma$ es una fórmula.
* Si $\sigma$ y $\psi$ son fórmulas, entonces $\sigma$ ∧ $\psi$, $\sigma$ ∨ $\psi$, $\sigma$ ⇒ $\psi$ y 𝜑 ⇔ $\psi$ son fórmulas.

---

<u>*Demostración por inducción:*</u>

`HI`: Suponemos que cualquier fórmula que usa ¬, ∧, ∨, ⇒, ⇔ y tiene una estructura más simple que la actual puede ser reescrita usando solo ¬ y ∨. 
$p(\sigma)$: existe una fórmula $\sigma'$ que sólo usa $\neg$ y $\lor$ tal que $\sigma' \equiv \sigma$.

<u>**Caso Base**: </u>

***Caso base***: $\tau = p$

Una variable proposicional 𝑝 es una fórmula. 

Esta ya está en la forma deseada, usando solo ¬ y ∨ porque no usa ningún conectivo. 

$\tau' = \tau = p$

Por lo tanto, el caso base es verdadero.

<u>***Paso Inductivo:***</u>

Queremos demostrar que una fórmula más compleja también se puede reescribir de esta manera.

Por HI existe $\sigma'$ que sólo usa $\neg$ y $\lor$ tal que $\sigma' \equiv \sigma$.

Queremos ver que $\tau' \equiv \tau$. Sea $v$ una valuación cualquiera.

<u>Negación </u> $\tau = \neg\sigma$ Usa sólo ¬.

Queremos ver que $\tau' \equiv \tau$. Sea $v$ una valuación cualquiera.

$v \models \tau' \equiv $ 

$v \models \neg\sigma' \equiv $ 

$v \not\models \sigma' \equiv$ (por HI $\sigma' \equiv \sigma$) 

$v \not\models \sigma \equiv $ 

$v \models \neg\sigma \equiv $ 

$v \models \tau$

$\therefore \tau' \equiv \tau$

---

<u>Conjunción </u> $\tau = \sigma \land \psi $

Por HI existen $\sigma'$ y $\psi'$ que sólo usan $\neg$ y $\lor$ tal que $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$.

Usando la <strong>De Morgan</strong> para la negación de la conjunción:


$\tau' = \sigma' \land \psi' = \neg(\neg(\sigma' \land \psi')) = \neg(\neg\sigma' \lor \neg\psi')$

Queremos ver que $\tau' \equiv \tau$. Sea $v$ una valuación cualquiera.

$v \models \tau' \equiv$ \
$v \models \neg(\neg\sigma' \lor \neg\psi') \equiv$ \
¬ $(v \models \neg\sigma' \lor$  $v \models \neg\psi') \equiv$ \
¬( ¬( v $\models \sigma'$ ) $\lor$ ¬( v $\models \psi'$ ) ) $\equiv$

$ ¬a\lor ¬b=¬(a \land b) $

¬( ¬(v $\models \sigma'$ $\land$ v $\models \psi'$ )) $\equiv$

v $\models \sigma'$ $\land$ v $\models \psi'$ $\equiv$

(por HI $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$)

($v \models \sigma$ y $v \models \psi$)  $\equiv$\
$v \models \sigma \land \psi \equiv$ \
$v \models \tau \equiv$

$\therefore \tau' \equiv \tau$

---

<u>Disyunción </u> $\tau = \sigma \lor \psi $

Por HI existen $\sigma'$ y $\psi'$ que sólo usan $\neg$ y $\lor$ tal que $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$.

$\tau' = \sigma' \lor \psi'$

Queremos ver que $\tau' \equiv \tau$. Sea $v$ una valuación cualquiera.

$v \models \tau' \equiv $ \
$v \models \sigma' \lor \psi' \equiv $ 

(por HI $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$)

$v \models \sigma \lor \psi \equiv $ 
$v \models \tau \equiv$

$\therefore \tau' \equiv \tau$

---

<u>Implicación </u> $\tau = \sigma \Rightarrow \psi $

Por HI existen $\sigma'$ y $\psi'$ que sólo usan $\neg$ y $\lor$ tal que $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$.

$\tau' = \sigma' \Rightarrow \psi' = \neg\sigma' \lor \psi'$

Queremos ver que $\tau' \equiv \tau$. Sea $v$ una valuación cualquiera.

$v \models \tau' \equiv $ \
$v \models \neg\sigma' \lor \psi' \equiv $

(por HI $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$)

$v \models \neg\sigma \lor \psi \equiv $

$¬a\lor b=a\Rightarrow b$

$v \models \sigma \Rightarrow \psi \equiv $

$v \models \tau \equiv$

$\therefore \tau' \equiv \tau$

---

<u>Equivalencia </u> $\tau = \sigma \iff \psi $

Por HI existen $\sigma'$ y $\psi'$ que sólo usan $\neg$ y $\lor$ tal que $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$.

$\tau' = \sigma' \iff \psi' = (\sigma' \Rightarrow \psi') \land (\sigma' \Leftarrow \psi')$

Queremos ver que $\tau' \equiv \tau$. Sea $v$ una valuación cualquiera.

$v \models \tau' \equiv $ \
$v \models (\sigma' \Rightarrow \psi') \land (\sigma' \Leftarrow \psi') \equiv $

(por HI $\sigma' \equiv \sigma$ y $\psi' \equiv \psi$)

$v \models (\sigma \Rightarrow \psi) \land (\sigma \Leftarrow \psi) \equiv $


$v \models (\sigma \Rightarrow \psi) \land ( \psi \Rightarrow \sigma) \equiv $

$v \models \sigma \iff \psi \equiv $

$v \models \tau \equiv$

$\therefore \tau' \equiv \tau$

---

</font>