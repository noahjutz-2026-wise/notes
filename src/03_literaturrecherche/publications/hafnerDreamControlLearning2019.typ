= hafnerDreamControlLearning2019 (dreamerv1)

_Horizon:_ Number of time steps into the future considered

_World Model:_ Continuous vector-values encoded by NN

_Latent State:_ Compressed versions of observations

_Imagination:_ Simulated estimated rewards from previous states

_Reconstruction:_ Turning latent state back into $(o,r)$

_Recurrent State-space Model (RSSM):_ See PlaNet

_Contrastive:_ Match latent state to observation using positive/negative scores

_Marginal:_ Distribution for one variable by averaging over others

#table(
  columns: 2,
  [_Objective Function_ (performance measure $J$)],
  $
    cal(J)
  $,

  [_Recurrent_ Model],
  $
    h_t = f(h_(t-1), x_t)
  $,
)
