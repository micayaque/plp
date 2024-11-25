$\color{purple}W(z) \rightsquigarrow \{x : X_k\} \vdash x : X_k, \ \ X_k \text{incógnita fresca}$

$\color{orange} W(\lambda x. U) \rightsquigarrow \Gamma' \vdash  \lambda x : \tau'.M : \tau' \rightarrow \rho \text{, donde}$
* $\color{orange}W(U) = \Gamma \vdash M : \rho$
*   ```math
    \color{orange}
    \tau' = \begin{cases} 
    \alpha & \text{si } x : \alpha \in \Gamma  \\
    X_k \text{con } X_k \text{variable fresca} & \text{en otro caso}
    \end{cases}
    ```
* $\color{orange}\Gamma' = \Gamma \ominus	\{x\}$

$\color{violet}W(U V) \rightsquigarrow S(\Gamma_1) \cup S(\Gamma_2) \vdash S(M N) : S(X_k) \text{, donde}$
* $\color{violet}W(U) = \Gamma_1 \vdash M : \tau$
* $\color{violet}W(V) = \Gamma_2 \vdash N : \rho$
* $\color{violet}X_k \text{variable fresca}$
* $\color{violet}S = MGU\{\tau =^? \rho \rightarrow X_k\} \cup \{\sigma_1 =^? \sigma_2\ |\ x : \sigma_1 \in \Gamma_1, x : \sigma_2 \in \Gamma_2\}$

$\color{lime}W(succ(U)) \rightsquigarrow S(\Gamma) \vdash S(succ(M)) : Nat \text{, donde}$
* $\color{lime}W(U) = \Gamma \vdash M : \tau$
* $\color{lime}S = MGU\{\tau =^? Nat\}$

$\color{cyan}W(\text{if U then V else W)} \rightsquigarrow S(\Gamma_1) \cup S(\Gamma_2) \cup S(\Gamma_3) \vdash S(\text{if M then P else Q}) : S(\sigma) \text{, donde}$
* $\color{cyan}W(U) = \Gamma_1 \vdash M : \rho$
* $\color{cyan}W(V) = \Gamma_2 \vdash P : \sigma$
* $\color{cyan}W(W) = \Gamma_3 \vdash Q : \tau$
* $\color{cyan}S = MGU\{\sigma =^? \tau, \rho =^? Bool\} \cup {\sigma_1 =^? \sigma_2 | x : \sigma_1 \in \Gamma_i, x : \sigma_2 \in \Gamma_j , i, j \in \{1, 2, 3\}}$

$\color{brown}W(iszero(U)) \rightsquigarrow S(\Gamma) \vdash S(iszero(M)) : Bool \text{, donde}$
* $\color{brown}W(U) = \Gamma \vdash M : \tau$
* $\color{brown}S = MGU\{\tau =^? Nat\}$

