= BartoSutton

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

_Exercise 2.5_
