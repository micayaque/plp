Para los siguientes términos:

$a) u\ x\ (y\ z) (\lambda v: Bool. v\ y)$

$b) (\lambda x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ 
z\ (y\ z))\ u\ v\ w$

$c) w\ (\lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z))\ u\ v$

Se pide:

$\color{violet}i$ Insertar todos los paréntesis de acuerdo a la convención usual.

$a) ((u\ x)\ (y\ z)) (\lambda v: Bool. v\ y)$

$b) (((\lambda x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ 
z\ (y\ z))\ u)\ v)\ w$

$c) ((w\ (\lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z)))\ u)\ v$


$\color{violet}{ii}$ Dibujar el árbol sintáctico de cada una de las expresiones.

$a) ((u\ x)\ (y\ z)) (\lambda v: Bool. v\ y)$

```math
\downarrow
```


$b) (((\lambda x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ 
z\ (y\ z))\ u)\ v)\ w$

$c) ((w\ (\lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z)))\ u)\ v$


$\color{violet}{iii}$ Indicar en el árbol cuáles ocurrencias de variables aparecen ligadas y cuáles libres.

$\color{violet}{iv}$ ¿En cuál o cuáles de los términos anteriores ocurre la siguiente expresión como subtérmino?

$(\lambda x: Bool \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z))\ u$

