$∀ t::AEB\ a. ∀ xs::[a] . esPreRama\ t\ xs ⇒ length\ xs ≤ altura\ t$

$P(t) = ∀ xs::[a] . esPreRama\ t\ xs ⇒ length\ xs ≤ altura\ t = True$

`caso t = Hoja h`

$esPreRama\ (Hoja\ h)\ xs ⇒ length\ xs ≤ altura\ (Hoja\ h)$

Por $A_0$

$esPreRama\ (Hoja\ h)\ xs ⇒ length\ xs ≤ 1$

Por $E_0$

$(null\ xs\ ||\ (xs = [h])) \ xs \Rightarrow length\ xs\ \leq 1$

Por extensionalidad de listas, xs es [] o y:ys

caso xs = []:

$null\ []\ ||\ ... \Rightarrow lenght [] \leq 1 $

$N_0$

$True\ ||\ ... \Rightarrow  lenght [] \leq 1$

$L_0$

$... \Rightarrow  0 \leq 1$

$Int$

$... \Rightarrow  True$

$Bool$

caso xs = y:ys

$null\ (y:ys)\ ||\ ((y:ys) = [h])) \  \Rightarrow length\ (y:ys)\ \leq 1$

$N_1$

$False\ ||\ ((y:ys) = [h])) \  \Rightarrow length\ (y:ys)\ \leq 1$

$Bool$

$((y:ys) = [h])) \  \Rightarrow length\ (y:ys)\ \leq 1$

$L_1$

$((y:ys) = [h])) \  \Rightarrow 1 + length\ ys\ \leq 1$

$==_3$

$((y:ys) =\ (h:[])) \  \Rightarrow 1 + length\ ys\ \leq 1$

$y=\ h\ \land ys=[] \  \Rightarrow 1 + length\ ys\ \leq 1$

Por extensionalidad de listas, `ys=[]` o `ys=z:zs`

caso ys=[]

$y=h\ \land []=[] \  \Rightarrow 1 + length\ []\ \leq 1$

$L_0$

$y=h\ \land True \  \Rightarrow length\ []\ \leq 0$

$y=h\ \land True \  \Rightarrow 0 \leq 0$

$Int$

$y=h\ \land True \  \Rightarrow True$

$Bool$

$y = h \Rightarrow True$

caso ys = z:zs

$y=h\ \land z:zs=z:[] \  \Rightarrow 1 + length\ z:zs\ \leq 1$

$==_2$

$y=h\ \land False \Rightarrow 1 + lenght \ (z:zs) \leq 1  $

$Bool$

$False \Rightarrow 1 + lenght \ (z:zs) \leq 1  $


$\therefore$ vale el caso base

---

Caso t = Bin i r d

HI: $P(i) \land P(r) \land P(d)$

$esPreRama\ (Bin\ i\ r\ d)\ xs ⇒ length\ xs ≤ altura\ (Bin\ i\ r\ d)$

Por $A_1$

$esPreRama\ (Bin\ i\ r\ d)\ xs ⇒ \backslash xs \rightarrow null\ xs\ ||\ (r = head\ xs) \land esPreRama\ i\ (tail\ xs)\ ||\ esPreRama\ d\ (tail\ xs) \Rightarrow length\ xs ≤ altura\ (Bin\ i\ r\ d)$

Por $A_1$

$null\ xs\ ||\ ((r = head\ xs) \land esPreRama\ i\ (tail\ xs)\ ||\ esPreRama\ d\ (tail\ xs)) \Rightarrow length\ xs ≤ 1 + max\ (altura\ i)\ (altura\ d)$

Por extensionalidad de listas, xs es [] o y:ys

caso xs = []:

$null\ []\ ||\ ((r = head\ []) \land esPreRama\ i\ (tail\ [])\ ||\ esPreRama\ d\ (tail\ [])) \Rightarrow length\ [] ≤ 1 + max\ (altura\ i)\ (altura\ d)$

$L_0$

$True\ ||\ ((r = head\ []) \land esPreRama\ i\ (tail\ [])\ ||\ esPreRama\ d\ (tail\ [])) \Rightarrow 0 ≤ 1 + max\ (altura\ i)\ (altura\ d)$

$Int$

Por LEMA: $altura\ i \geq 0 \land altura\ d \geq 0$

Por int, $1 + max\ (altura\ i)\ (altura\ d) \geq 1 + max\ 0\ 0 = 1 + 0 = 1 \geq 0$

Luego el consecuente es $true$ y por $bool$ la implicacion es verdadera

caso xs = y:ys

$null\ (y:ys)\ ||\ ((r = head\ (y:ys)) \land esPreRama\ i\ (tail\ (y:ys))\ ||\ esPreRama\ d\ (tail\ (y:ys))) \Rightarrow length\ (y:ys) ≤ 1 + max\ (altura\ i)\ (altura\ d)$

Por `tail`

$null\ (y:ys)\ ||\ ((r = (head\ y:ys) \land esPreRama\ i\ ys\ ||\ esPreRama\ d\ ys) \Rightarrow length\ (y:ys) ≤ 1 + max\ (altura\ i)\ (altura\ d)$

$N_1$

$False\ ||\ ((r = (head\ y:ys) \land esPreRama\ i\ ys\ ||\ esPreRama\ d\ ys) \Rightarrow length\ (y:ys) ≤ 1 + max\ (altura\ i)\ (altura\ d)$

$Bool$

$((r = (head\ y:ys) \land esPreRama\ i\ ys\ ||\ esPreRama\ d\ ys) \Rightarrow length\ (y:ys) ≤ 1 + max\ (altura\ i)\ (altura\ d)$

$L_1$

$((r = (head\ y:ys) \land esPreRama\ i\ ys\ ||\ esPreRama\ d\ ys) \Rightarrow 1 + length\ ys ≤ 1 + max\ (altura\ i)\ (altura\ d)$

$(\textcolor{orange}{(r = (head\ y:ys)} \land \textcolor{pink}{esPreRama\ i\ ys\ ||\ esPreRama\ d\ ys)} \Rightarrow  length\ ys ≤  max\ (altura\ i)\ (altura\ d)$

Por $bool$, si $B \Rightarrow C$ entonces $A \land B \Rightarrow C$

Probamos $B \Rightarrow C$

Por extensinalidad de bool, `esPreRama i ys = True o False`

$\color{green}{caso\ esPR\ i\ ys = True:}$

$True \ ||\ \Rightarrow length\ ys ≤  max\ (altura\ i)\ (altura\ d) = _{boolx2}$

$lenght \ ys ≤  max\ (altura\ i)\ (altura\ d)$

Por HI: $esPreRama\ i\ ys \Rightarrow length\ ys ≤ altura\ i$

Por int $esPreRama \ i\ ys \Rightarrow length\ ys ≤ max\ (altura\ i)\ (altura\ d)$

Por caso $esPreRama\ i\ ys = True$, $length\ ys ≤ max\ (altura\ i) \ (altura\ d)$ que es lo que queriamos demostrar.

$\color{green}{caso\ esPR\ i\ ys = False:}$

$False \ ||\ \Rightarrow length\ ys ≤  max\ (altura\ i)\ (altura\ d) = _{bool}$

$esPreRama\ d\ ys \Rightarrow length\ ys ≤ max\ (altura\ i) (altura\ d)$

Por HI: $esPreRama\ d\ ys \Rightarrow length\ ys ≤ altura\ d$

Por int $esPreRama \ d\ ys \Rightarrow length\ ys ≤ max\ (altura\ i)\ (altura\ d)$