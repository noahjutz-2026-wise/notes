#import "/src/deps.typ": treet

RQ: How well does a #text(gray)[Unity] simulation trained model work in reality #text(gray)[on the BRIO labyrinth]?

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
    [X], [Run], [Conf], [EnvTransfer], ${"S2S", "S2R", ..., "S", "R"}$, [-], [-],
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
