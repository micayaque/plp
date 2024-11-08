Sintaxis
---

Determinar qué expresiones son sintácticamente válidas (es decir, pueden ser generadas con las `gramáticas`
presentadas) y determinar a qué categoría pertenecen (`expresiones de términos` o `expresiones de tipos`):

`expresiones de términos:`

$a) x$

$b) x\ x$

$e) true\ false$

$f ) true\ succ(false\ true)$

$i) λx: Bool.\ succ(x)$

$p) λx:\ Bool.\ if\ zero\ then\ true\ else\ zero\ succ(true)$

`expresiones de tipos:`

$l) Bool$

$m) Bool \rightarrow Bool$

$n) Bool \rightarrow Bool \rightarrow Nat$

$ñ) (Bool \rightarrow Bool) \rightarrow Nat$

`inválidas:`

$c) M$ M no es un término en sí mismo.

$d) M\ M$ M no es un término en sí mismo.

$g) λx.\ isZero(x)$ x no tiene tipo.

$h) λx: σ.\ succ(x)$ $\sigma$ no es un tipo en sí mismo.

$j) λx: if\ true\ then\ Bool\ else\ Nat.\ x$ Ni Bool ni Nat son términos.

$k) \sigma$ No es un tipo en sí mismo.

$o) succ\ true$ Faltan los paréntesis.