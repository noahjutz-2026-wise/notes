#import "/src/deps.typ": cetz, fletcher
#import "symbols.typ"
#import "util.typ": symbol

#set text(size: 14pt)

#fletcher.MARKS.update(m => m + (
  "Oc": (inherit: "O", tip-origin: 0, tail-origin: 0),
  "(c": (inherit: "(", tip-origin: 0, tail-origin: 0),
  ")c": (inherit: ")", tip-origin: 0, tail-origin: 0),
))

#fletcher.diagram(
  node-stroke: 1pt,
  node-inset: 5pt,
  spacing: (32pt, 32pt),
  label-sep: 0pt,
  label-size: 10pt,
  {
    import fletcher: edge, node

    node((-1, 0), name: "algo_label", stroke: none)[Algorithm]
    node(enclose: (<algo_label>), name: "algo")

    node((-2, 2), name: "learner_label", stroke: none)[Learner]
    node(enclose: (<learner_label>), name: "learner", stroke: 1pt + yellow.darken(15%))

    node((0, 2), name: "rs_label", stroke: none)[EnvRunnerServer \
      ForExternalInference]
    node(enclose: (<rs_label>), name: "envrunner", stroke: 1pt + blue)

    node((2, 2), name: "rc_label", stroke: none)[EnvRunnerClient]
    node(enclose: (<rc_label>), name: "rc")

    node((4, 2), name: "env_base")[env-base]
    node((7, 1), name: "env_sim")[env-sim]
    node((7, 3), name: "env_real")[env-real]
    node((9, 1), name: "backend_sim")[
      #symbol(symbols.symbol_unity, symbol-size: 0.55cm) \ backend-sim
    ]
    node((9, 3), name: "backend_real")[
      #symbol(symbols.symbol_iso_square_rod, symbol-size: 0.55cm) \ backend-real
    ]

    node((-2, 1), name: "if_alg_learner")
    node((0, 1), inset: 0pt, name: "if_alg_runner")
    node((3, 2), inset: 0pt, name: "if_zmq")
    node((8, 1), inset: 0pt, name: "if_bs_sim")
    node((8, 3), inset: 0pt, name: "if_bs_real")

    edge(<algo>, <if_alg_learner>, "-(c", snap-to: (auto, none), corner: left)
    edge(<learner>, <if_alg_learner>, "-Oc", snap-to: (auto, none))
    edge(<algo>, <if_alg_runner>, "-(c", snap-to: (auto, none), corner: right)
    edge(<envrunner>, <if_alg_runner>, "-Oc", snap-to: (auto, none))

    let if-ep = (rel: (0, -0.25), to: (<envrunner.east>, 50%, <rc.west>))
    let if-gs = (rel: (0, 0.25), to: (<envrunner.east>, 50%, <rc.west>))
    edge(vertices: ((rel: (0, -0.25), to: <envrunner.east>), if-ep), "-(c", snap-to: (none, none))[EPISODES]
    edge(vertices: ((rel: (0, -0.25), to: <rc.west>), if-ep), "-Oc", snap-to: (none, none))
    edge(vertices: ((rel: (0, 0.25), to: <envrunner.east>), if-gs), "-Oc", snap-to: (none, none))[GET_STATE]
    edge(vertices: ((rel: (0, 0.25), to: <rc.west>), if-gs), "-(c", snap-to: (none, none))

    edge(<rc>, <if_zmq>, "-(c", snap-to: (auto, none), label-side: left)[ZMQ]
    edge(<env_base>, <if_zmq>, "-Oc", snap-to: (auto, none))

    edge(<env_base>, (rel: (1, 0)), "-(c")
    edge(<env_sim>, (rel: (-1, 0)), "-Oc")
    edge(<env_real>, (rel: (-1, 0)), "-Oc")
    edge((5, 2), (6, 1), "->", dash: "dashed", stroke: gray)
    edge((5, 2), (6, 3), "->", dash: "dashed", stroke: gray)

    edge(<env_sim>, <if_bs_sim>, "-(c", snap-to: (auto, none))
    edge(<backend_sim>, <if_bs_sim>, "-Oc", snap-to: (auto, none))
    edge(<env_real>, <if_bs_real>, "-(c", snap-to: (auto, none))
    edge(<backend_real>, <if_bs_real>, "-Oc", snap-to: (auto, none))
  },
)
