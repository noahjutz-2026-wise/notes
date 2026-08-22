= hafnerMasteringDiverseControl2025 (dreamerv3)

#link("https://www.youtube.com/watch?v=vfpZu0R1s1Y")[Summary Video]

#link("https://www.youtube.com/watch?v=s8RqGlU5HEs")[Other Video]

_Vector Quantized Variational Autoencoder (VQ-VAE):_ Discrete 0-1 matrix as parameters / latent state

_Sequence Model:_ Similar to Dreamerv1's Transition model

_Straight-Through Gradients:_ Approximation for backpropagating

_Scene:_ Observation $o_t$

#table(
  columns: 2,
  [_Loss_],
  $
    cal(L)(theta) = -J(theta)
  $,

  [_Latent State_],
  $
    h_t
  $,

  [_Recurrent State_],
  $
    z_t
  $,
)

== Unfamiliar Terms

- Logistic Regression
- Stop-Gradient Operator
- free bits
- Kullback–Leibler (KL) divergence
- replay buffer
- entropy regularizer
- two-hot
