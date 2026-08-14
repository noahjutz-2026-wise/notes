#set text(lang: "en")
#let argmax = $op("arg max", limits: #true)$

= BartoSutton

== Notes

_Page 55_

- *Action-Value methods*
  - _Weighted Average:_ $Q_(n+1)=Q_n+alpha_n (R_n-Q_n)$
  - _Sample Average:_ $alpha_n (a) = 1/n$
  - _Exponential recency-weighted Average:_ $alpha (1-alpha)^(n-i)$
    - _Constant step-size parameter:_ $alpha_n (a)=alpha$

_Page 64_

- *Balancing Exploitation and Exploration*
  - _Greedy:_ $ A_t = argmax_a Q_t (a) $
  - _Epsilon-Greedy:_
    $
      A_t <- cases(
        argmax_a Q(a) & "with" p(1-epsilon) "(breaking ties randomly)",
        "random" a & "with" p(epsilon)
      )
    $
  - _Upper Confidence Bound (UCB):_ $ A_t (a) = argmax_a (Q_t (a) + c sqrt((ln t)/(N_t (a)))) $
  - _Gradient Bandit:_ $ Pr(A_t=a) = e^(H_t (a))/(sum_(b=1)^k e^(H_t (b))) = pi_t (a) $

_Page 71_

*...*

#table(
  columns: 2,
  [_Dynamics_ of the MDP],
  $
    p(s', r | s, a) = Pr {S_t = s', R_t = r | S_(t-1) = s, A_(t-1) = a}
  $,

  [_State-Transition Probabilities_], [Todo],
)

_Page 81_

*Value Functions*

#table(
  columns: 2,
  [_Discounted Expected Return_],
  $
    G_t = sum_(k=t+1)^T gamma^(k-t-1) R_k
  $,

  [_Policy_],
  $
    sum_(a in cal(A)(s)) pi(a | s) = 1
  $,

  [_State-Value Function_],
  $
    v_pi (s) = EE_pi [G_t | S_t = s]
  $,

  [_Action-Value Function_],
  $
    q_pi (s, a) = EE_pi [G_t | S_t = s, A_t = a]
  $,

  [_Bellman Equation for $v_pi$_],
  $
    v_pi (s) = sum_a pi(a|s) sum_(s', r) ..."todo"
  $,
)

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

_Exercise 3.11_

$
  p(s', r | s, a) & eq.def Pr(S_t = s', R_t = r | S_(t-1)=s, A_(t-1)=a) \
          pi(a|s) & eq.def Pr(A_t=a | S_t=s)
$

$
  EE(R_(t+1) | S_t=s) = sum_(a in cal(A)(s)) pi(a|s) dot r(s, a)
$
