#set text(lang: "en")

= BartoSutton

== Notes

_Page 55_

- *Action-Value methods*
  - _Weighted Average:_ $Q_(n+1)=Q_n+alpha_n (R_n-Q_n)$
  - _Sample Average:_ $alpha_n (a) = 1/n$
  - _Exponential recency-weighted Average:_ $alpha (1-alpha)^(n-i)$
    - _Constant step-size parameter:_ $alpha_n (a)=alpha$
- *Action selection*
  - _$epsilon$-Greedy methods:_ Exploit with $p(1-epsilon)$, explore with $p(epsilon)$.

== Exercises

_Exercise 2.4_

$
  Q_(n+1) & = Q_n + alpha (R_n - Q_n) \
          & = (1-alpha)^n Q_1 + sum_(i=1)^n alpha (1-alpha)^(n-i) R_i
$

With constant $alpha$, $Q_n$ is weighted by $alpha$. With a non constant sequence $alpha_n$, we have

$
  Q_(n+1) & = Q_n + alpha_n (R_n - Q_n) \
  & = Q_n + alpha_n R_n - alpha_n Q_n \
  & = alpha_n R_n + (Q_n - alpha_n Q_n) \
  & = alpha_n R_n + (1 - alpha_n) Q_n \
  & = alpha_n R_n + (1 - alpha_n) (alpha_(n-1) R_(n-1) + (1-alpha_(n-1)) Q_(n-1)) \
  & = alpha_n R_n + (1 - alpha_n) (alpha_(n-1) R_(n-1)) + (1-alpha_n)(1-alpha_(n-1)) Q_(n-1) \
  & = alpha_n R_n + (1 - alpha_n) (alpha_(n-1) R_(n-1)) + (1-alpha_n)(1-alpha_(n-1)) (alpha_(n-2)R_(n-2)) + ... \
  & ... + (1-alpha_n) (...) (1-alpha_2) (alpha_1 R_1 + (1 - alpha_1) Q_1) \
  & = alpha_n R_n + sum_(i=2)^n ( (alpha_(i-1) R_(i-1)) product_(j=i)^n (1-alpha_j) ) + product_(i=1)^n (1-alpha_i) Q_1
$

_Exercise 2.6_

It is guaranteed that every action is tried between steps $1..10$. At step 11, every run greedily chooses the action with the greatest estimated value, which is often the optimal choice.

The spike quickly decreases as the best options once again slip below the worse ones, however this time the best options begin to stabilize above the worse ones. This oscillation continues until $q$ approaches $q^*$.

_Exercise 2.7_

Unrelated: roll out $dash(o)$:

$
      dash(o)_n & eq.def dash(o)_(n-1) + alpha (1-dash(o)_(n-1)) \
  1 - dash(o)_n & = 1 - ( dash(o)_(n-1) + alpha (1-dash(o)_(n-1)) ) \
                & = (1-dash(o)_(n-1)) - alpha (1 - dash(o)_(n-1)) \
                & = (1-alpha)(1-dash(o)_(n-1)) \
                & = (1-alpha)((1-alpha)(1-dash(o)_(n-2))) \
                & = (1-alpha)((1-alpha)((1-alpha)(1-dash(o)_(n-3)))) \
                & = ... \
                & = (1-alpha)^n \
      dash(o)_n & = 1 - (1-alpha)^n
$

Solution:

$
                      beta_n & eq.def alpha / dash(o)_n \
                  1 - beta_n & = 1 - alpha / dash(o)_n \
                             & = (dash(o)_n - alpha) / dash(o)_n \
                             & = (dash(o)_(n-1) + alpha (1 - dash(o)_(n-1)) - alpha)/(dash(o)_n) \
                             & = (dash(o)_(n-1)-alpha(dash(o)_(n-1)))/dash(o)_n \
                             & = (dash(o)_(n-1) (1-alpha))/dash(o)_n \
  product_(i=1)^n 1 - beta_i & = product_(i=1)^n (dash(o)_(i-1) (1-alpha))/dash(o)_i \
$
