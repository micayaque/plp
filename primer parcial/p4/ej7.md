Se modifica la regla de tipado de la abstracción ($\rightarrow_{ABS}$) y se la cambia p or la siguiente regla:

```math
\frac{\Gamma \vdash M : \tau}{\Gamma \vdash \lambda x : \sigma . M : \sigma \rightarrow \tau} \rightarrow_{ABS_2}
\ \
\frac{\Gamma, x : \tau ⊢ M : \sigma}{\Gamma \vdash \lambda x : \sigma . M : \sigma \rightarrow \tau} \rightarrow_{ABS}
```

Exhibir un juicio de tipado que sea derivable en el sistema original pero que no lo sea en el sistema actual.
