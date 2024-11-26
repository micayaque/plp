Determinar el resultado de aplicar la sustitución $\text{S}$ a las siguientes expresiones

$\text{i. S = } \{ X_1 := Nat \} \hspace{2.9cm} \text{ S(x : } X_1 \rightarrow \text{Bool)}$

Resultado:

$\{ x:Nat \rightarrow Bool \}$

$\text{ii. S =} \{X_1 := X_2 \rightarrow X_3, X_4 := \text{Bool} \}$

$\text{S(x : } X_4 \rightarrow \text{Bool}) \vdash \text{S(} \lambda \text{x:} X_1 \rightarrow \text{Bool.x) : S(Nat} \rightarrow X_2)$

Resultado:

$\{ \text{(x : } Bool \rightarrow \text{Bool}) \vdash \text{S(} \lambda \text{x:} X_1 \rightarrow \text{Bool.x) : S(Nat} \rightarrow X_2) \}_{X_4 := Bool}$

$\{ \text{(x : } Bool \rightarrow \text{Bool}) \vdash \text{S(} \lambda \text{x:} X_2 \to X_3 \rightarrow \text{Bool.x) : S(Nat} \rightarrow X_2) \}_{X_1 := X_2 \to X_3}$

