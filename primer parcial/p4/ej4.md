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

```math
((u\ x)\ (y\ z)) (\lambda \textcolor{red}v: Bool.\ \textcolor{red}v\ y)
```
```math
((u\ x)\ (y\ z)) \hspace{1cm} (\lambda \textcolor{red}v: Bool.\ \textcolor{red}v\ y) 
```
```math
(u\ x) \hspace{2cm} (y\ z) \hspace{1cm}  (v\ y)
```
```math
u \hspace{1cm} x \hspace{2cm} y \hspace{1cm} z \hspace{1cm}  v \hspace{1cm} y
```

---

```math
(((\lambda \textcolor{red}x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda \textcolor{red}y: Bool \rightarrow Nat.\ \lambda \textcolor{red}z: Bool.\ \textcolor{red}x\ \textcolor{red}z\ (\textcolor{red}y\ \textcolor{red}z))\ u)\ v)\ w
```
```math
(((\lambda x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z))\ u)\ v) \hspace{1.8cm} w
```
```math
\textcolor{violet}{((\lambda x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z))\ u)} \hspace{1.2cm} v \hspace{1cm} w
```
```math
(\lambda x: Bool \rightarrow Nat \rightarrow Bool. \ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z)) \hspace{0.5cm} u \hspace{1cm} v \hspace{1cm} w
```
```math
(x\ z)\ (y\ z) \hspace{9cm} u \hspace{1cm} v \hspace{1cm} w
```
```math
(x\ z) \hspace{1cm} (y\ z) \hspace{8cm} u \hspace{1cm} v \hspace{1cm} w
```
```math
x \hspace{1cm} z \hspace{1cm} y \hspace{1cm} z \hspace{6.7cm} u \hspace{1cm} v \hspace{1cm} w
```

---

```math
((w\ (\lambda \textcolor{red}x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda \textcolor{red}y: Bool \rightarrow Nat.\ \lambda \textcolor{red}z: Bool.\ (\textcolor{red}x\ \textcolor{red}z)\ (\textcolor{red}y\ \textcolor{red}z)))\ u)\ v
```
```math
((w\ (\lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ (x\ z)\ (y\ z)))\ u) \hspace{1.7cm} v
```
```math
(w\ (\lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ (x\ z)\ (y\ z))) \hspace{2.2cm} u \hspace{0.9cm} v
```
```math
w \hspace{1cm} (\lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ (x\ z)\ (y\ z)) \hspace{1.6cm} u \hspace{0.9cm} v
```
```math
w \hspace{1cm} \lambda x: Bool\ \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ (x\ z) \hspace{1cm} (y\ z) \hspace{1cm} u \hspace{0.9cm} v
```
```math
w \hspace{9.5cm} (x\ z) \hspace{1cm} (y\ z) \hspace{1cm} u \hspace{0.9cm} v
```
```math
w \hspace{9.5cm} x \hspace{0.5cm} z \hspace{1cm} y \hspace{0.5cm} z \hspace{0.7cm} u \hspace{0.9cm} v
```

$\color{violet}{iii}$ Indicar en el árbol cuáles ocurrencias de variables aparecen ligadas y cuáles libres.



$\color{violet}{iv}$ ¿En cuál o cuáles de los términos anteriores ocurre la siguiente expresión como subtérmino?

$(\lambda x: Bool \rightarrow Nat \rightarrow Bool.\ \lambda y: Bool \rightarrow Nat.\ \lambda z: Bool.\ x\ z\ (y\ z))\ u$

`b)`