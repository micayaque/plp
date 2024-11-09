Unir con fechas los tipos que unifican entre sí (entre una fila y la otra). 

Para cada par unificable, exhibir el
mgu (most general unifier).

```math
\textcolor{orange}{X_1 \to X_2} \hspace{1cm} 
\textcolor{red}{Nat} \hspace{1cm} \textcolor{pink}{X_2 \to Bool} \hspace{1cm} 
\textcolor{green}{X_3 \to X_4 \to X_5}
```

```math
\textcolor{red}{X_1} \hspace{1cm} \textcolor{pink}{Nat \to Bool} \hspace{1cm} 
\textcolor{orange}{(Nat \to X_2 ) \to Bool} \hspace{1cm} 
\textcolor{green}{Nat \to X_2 \to Bool}
```

```math
\{X_1 \doteq Nat\}_{elim} = \{\}_{ \{X_1 := Nat \}}
```
$\text{MGU = } \{ X_1 := Nat \}$


```math
\{Nat \to Bool \doteq X_2 \to Bool\}_{Decompose} = \{Nat \doteq X_2, Bool \doteq Bool\}_{delete} = \{Nat \doteq X_2\}_{swap} = \{X_2 \doteq Nat\}_{elim} = \{\}_{ \{ X_2 := Nat\} }
```

$\text{MGU = } \{ X_2 := Nat \}$

```math
\{X_1 \to X_2 \doteq (Nat \to X_2 ) \to Bool \}_{decompose} = \{X_1 \doteq Nat \to X_2,  X_2 \doteq Bool \}_{decompose} = \{X_1 \doteq Nat \to X_2,  X_2 \doteq Bool \}_{elim\ X_2 := Bool} = \{X_1 \doteq Nat \to Bool \}_{elim \{X_2 := Bool \}} = \{\}_{elim \{X_1 := Nat \to Bool\}}
```

$\text{MGU = } \{X_2 := Bool, X_1 := Nat \to Bool \}$


```math
\{X_3 \to (X_4 \to X_5) \doteq Nat \to (X_2 \to Bool) \}_{decompose} = 
\{X_3 \doteq Nat, X_4 \to X_5 \doteq X_2 \to Bool \}_{\color{lime}elim \{ X_3 := Nat \}} = 
```

```math
= \{ X_4 \to X_5 \doteq X_2 \to Bool  \}_{decompose} = \{ X_4 \doteq X_2, X_5 \doteq Bool  \}_{\color{lime}elim \{ X_5 := Bool \}} = \{ X_4 \doteq X_2 \}_{\color{lime}elim \{ X_4 := X_2 \}} = \{\}
```

$\text{MGU = } \{ X_3 := Nat, X_5 := Bool, X_4 := X_2 \}$
