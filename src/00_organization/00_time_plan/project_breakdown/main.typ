#import "/src/deps.typ": treet

RQ: How well does a #text(gray)[Unity] simulation trained model work in reality #text(gray)[on the BRIO labyrinth]?

Answer:
- It works to this _extent_
  - accuracy
  - speed
  - distance
  - s2r gap
- With the _robustness_
  - to physics, visual noise, latency, ... (up to X%)
- It works _because_
  - ...
- It doesn't work _because_
  - difficult maze section
  - jerky movement (Act)
  - estimator / reality mismatch
  - inaccurate learned dynamics model (loss)
  - inaccurate physics parameters
- under the following _prerequisites_
  - DR
  - accurate modeling of friction, vel, acc, latency
  - frequency
  - reward shape
  - observation shape
  - Lighting conditions
  - Prioritized sampling & sample augmentation
  - Hardware (gpu, ram, bus, ...)
- _performance_ is influenced by
  - hyperparameters
  - algorithm
  - curriculum learning
- At the _cost_ of
  - compute time vs real time saved
- _limitations_ are
  - e.g., dynamics changes dynamically during an episode
  - Frequency limited by Round-trip control loop time
- _preliminary results_ include
  - sim $->$ sim2
  - real $->$ real2
- It _compares_ to previous work (in terms of performance, cost)
  - CyberRunner, marble-maze baseline performances


#show figure: set block(breakable: true)
#figure(caption: [Data dimensions])[
  #table(
    columns: 7,
    stroke: none,
    fill: (x, y) => if x == 3 { yellow } else {},
    table.header([*X/Y*], [*Gran.*], [*Group*], [*Dimension*], [*Domain*], [*Aggr.*], [*Derived*]),
    table.hline(),
    [X], [Step], [Time], [_Step_], $NN_0$, [-], [-],
    [X], [Step], [Time], [Wall-Clock], $NN_0$, [-], [-],
    [X], [Step], [Time], [StepBudget], $NN$, [-], [-],
    table.hline(),
    [X], [Episode], [Time], [_Episode_], $NN_0$, [-], [-],
    [X], [Episode], [Phys], [BallFriction], $?$, [-], [-],
    [X], [Episode], [Phys], [BoardFriction], $?$, [-], [-],
    [X], [Episode], [Phys], [MotorVel], $?$, [-], [-],
    [X], [Episode], [Phys], [MotorAcc], $?$, [-], [-],
    [X], [Episode], [Phys], [ObsLatency], $[0,1] [s]$, [-], [-],
    [X], [Episode], [Phys], [ActLatency], $[0,1] [s]$, [-], [-],
    [X], [Episode], [Phys], [[...]Rand], ${plus.minus 15%, plus.minus 30%, ...}$, [-], [-],
    table.hline(),
    [X], [Update], [], [], $$, [], [],
    table.hline(),
    [X], [Run], [Conf], [_Seed_], $NN_0$, [-], [-],
    [X], [Run], [Conf], [Algo], ${"PPO", "Dreamer"}$, [-], [-],
    [X], [Run], [Conf], [Env], ${"sim:easy", ..., "real"}$, [-], [-],
    [X], [Run], [Conf], [TransferFromEnv], ${"..Env", "none"}$, [-], [-],
    [X], [Run], [Conf], [Sim:Parallelization], $NN$, [-], [-],
    [X], [Run], [Conf], [ObsSpace], `gym.spaces`, [-], [-],
    [X], [Run], [Conf], [RewFn], $f:"Obs"->RR$, [-], [-],
    [X], [Run], [Conf], [Inference], ${"train","eval"}$, [-], [-],
    [X], [Run], [Hyp], [Dreamer:TrainRatio], ${32, 128, 512}$, [-], [-],
    [X], [Run], [Hyp], [Dreamer:ModelSize], ${"XS", "S", "M", "L"}$, [-], [-],
    [X], [Run], [Hyp], [PPO:LR], $<<1$, [-], [-],
    [X], [Run], [Hyp], [PPO:Discount], $[0.9,1]$, [-], [-],
    [X], [Run], [Hyp], [Frequency], ${5, 15, 30, 50} [1 slash s]$, [-], [-],
    table.hline(stroke: 2pt),
    [Y], [Step], [Act], [Action], $[-1,1]^2$, [-], [-],
    [Y], [Step], [Obs], [Pos], $[-1,1]^2$, [-], [Img],
    [Y], [Step], [Obs], [Rot], $[-1,1]^2$, [-], [Img],
    [Y], [Step], [Obs], [Img], $RR^(1920,1080,3)$, [-], [Img],
    [Y], [Step], [Obs], [Subimg], $RR^(64,64,1)$, [-], [-],
    [Y], [Step], [Obs], [PixelEntropy], $?$, [-], [Img],
    [Y], [Step], [Rew], [Progress], $NN_0$, [-], [-],
    [Y], [Step], [Rew], [Reward], $RR$, $floor(dot) ceil(dot) dash(dot)$, [Progress],
    table.hline(),
    [Y], [Episode], [], [S2RGap], $?$, [-], [Pos],
    table.hline(),
    [Y], [Update], [Algo], [Dreamer:DynLoss], $?$, $?$, [-],
    [Y], [Update], [Algo], [Dreamer:RecLoss], $?$, $?$, [-],
    [Y], [Update], [Algo], [Dreamer:PolLoss], $?$, $?$, [-],
    [Y], [Update], [Algo], [PPO:Loss], $?$, $?$, [-],
    [Y], [Update], [Algo], [PolEntropy], $?$, $?$, [-],
    table.hline(),
    [Y], [Run], [Rew], [Accuracy], $[0, 1]$, $floor(dot) ceil(dot) dash(dot)$, [Progress],
  )
]

RQ \
#treet.tree-list(marker-font: "JetBrains Mono")[
  -
]
