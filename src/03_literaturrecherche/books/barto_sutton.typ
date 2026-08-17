#import "/deps.typ": lilaq as lq, mannot
#import mannot: markhl

#set text(lang: "en")
#let argmax = $op("arg max", limits: #true)$

= BartoSutton

== Notes

#let p10 = lq.color.map.petroff10.enumerate().map(((i, c)) => ("_" + str(i), c)).to-dict()


*Step Size / Learning Rate (Action-Value methods)* _Page 55_
#table(
  columns: 2,
  [_Weighted Average_],
  $
    Q_(n+1)=Q_n+alpha_n (R_n-Q_n)
  $,

  [_Sample Average_],
  $
    alpha_n (a) = 1/n
  $,

  [_Exponential recency-weighted Average_],
  $
    alpha (1-alpha)^(n-i)
  $,

  [_Constant step-size parameter_],
  $
    alpha_n (a)=alpha
  $,
)


*Balancing Exploitation and Exploration* _Page 64_
#table(
  columns: (1fr, auto),
  [_Greedy_],
  $
    A_t = argmax_a Q_t (a)
  $,

  [_Epsilon-Greedy_],
  $
    A_t <- cases(
      argmax_a Q(a) & "with" p(1-epsilon) "(breaking ties randomly)",
      "random" a & "with" p(epsilon)
    )
  $,

  [_Upper Confidence Bound (UCB)_],
  $
    A_t (a) = argmax_a (Q_t (a) + c sqrt((ln t)/(N_t (a))))
  $,

  [_Gradient Bandit_],
  $
    Pr(A_t=a) = e^(H_t (a))/(sum_(b=1)^k e^(H_t (b))) = pi_t (a)
  $,
)

*Markov Decision Processes* _Page 71_

#table(
  columns: (1fr, auto),
  table.cell(fill: p10._0)[_Dynamics_ of the Environment],
  $
    p(s', r | s, a) = Pr {S_t = s', R_t = r | S_(t-1) = s, A_(t-1) = a}
  $,

  [_State-Transition Probabilities_],
  $
    p(s' | s, a) & = Pr(S_t = s' | S_(t-1)=s, A_(t-1)=a) \
                 & = sum_(r in cal(R)) p(s', r | s, a)
  $,

  [Expected Reward for (State, Action)],
  $
    r(s,a) & = EE [R_t | S_(t-1)=s, A_(t-1)=a] \
           & = sum_(r in cal(R)) ( r sum_(s' in cal(S)) p(s', r | s, a))
  $,

  [Expected reward for (State, Action, next State)],
  $
    r(s, a, s') & = EE[R_t | S_(t-1)=s, A_(t-1)=a, S_t = s'] \
                & = sum_(r in cal(R)) r underbrace((p(s', r | s, a))/(p(s' | s, a)), =p(r | s, a, s'))
  $,
)

*Value Functions* _Page 81_

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

  [_Bellman Equation for $v_pi$_],
  $
    v_pi (s) = sum_a pi(a|s) sum_(s', r) markhl(p(s', r | s, a), color: #p10._0) [r + gamma v_pi (s')]
  $,

  [_Optimal State-Value Function_],
  $
    v_* (s) = max_pi v_pi (s)
  $,

  [_Bellman Optimality Equation for $v_*$_],
  $
    v_* (s) & = max_(a in cal(A)(s)) q_* (a, s) \
            & = max sum_(s', r) p(s', r | s, a) [r + gamma v_* (s')]
  $,

  [_Action-Value Function_],
  $
    q_pi (s, a) = EE_pi [G_t | S_t = s, A_t = a]
  $,

  [_Bellman Equation for $q_pi$_],
  $
    q_pi (s, a) = sum_(s', r) p(s', r | s, a) [r + gamma sum_a' pi(s', a') q_pi (s', a') ]
  $,

  [_Optimal Action-Value Function_],
  $
    q_* (s, a) & = max_pi q_pi (s, a) \
               & = EE [R_(t+1) + gamma v_* (s) | S_t=s, A_t=a]
  $,

  [_Bellman Optimality Equation for $q_*$_],
  $
    q_* (s, a) & = sum_(s', r) p(s', r | s, a) [r + max_(a') q_*(s', a')]
  $,
)

*Dynamic Programming* _Page 96_

#table(
  columns: 2,
  [_Iterative Policy Evaluation_],
  $
    v_(k+1) (s) & = EE_pi [R_(t+1) + gamma v_k (S_(t+1)) | S_t = s]
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

_Exercise 3.14_

Assuming $pi(a | s) = 1/4; gamma=0.9; r=0;p(s',r|s,a)=1$, then

$
  v_pi (s) & eq.def sum_a pi(a | s) sum_(s', r) p(s',r|s,a)[r+gamma v_pi (s')] \
           & = sum_a 1/4 sum_(s',r) bb(1)_(s'=s_a) [0 + gamma v_pi (s')] \
           & = 1/4 dot gamma dot sum_(a in {arrow.t, <-, arrow.b, ->}) v_pi (s_a) \
           & = 1/4 dot 0.9 dot (0.7+2.3+0.4-0.4) \
           & = 0.675 approx 0.7 space square.filled
$

_Exercise 3.17_

$
  q_pi (s, a) = sum_(s', r) p(s', r | s, a) [r + gamma sum_a' pi(a' | s') q_pi (s', a') ]
$

_Exercise 4.1_

$
  q_pi (s, a) & = EE_pi (G_t | S_t=s, A_t=a) \
              & = sum_(s', r) p(s', r | s, a) [r + gamma sum_a' pi(a' | s') q_pi (s', a')] \
$

$
  q_pi (11, "down") & = 1 [ -1 + gamma 0 ] \
                    & = -1
$

$
  q_pi (7, "down") & = 1 [-1 + gamma v_pi (s')] \
                   & = -1 + gamma (-14) \
                   & = -1 + 1 (-14) \
                   & = -15
$
