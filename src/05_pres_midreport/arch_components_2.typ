#import "/src/deps.typ": cetz, fletcher
#import "symbols.typ"
#import "util.typ": symbol

#set text(size: 14pt)

#fletcher.MARKS.update(m => (
  m
    + (
      "Oc": (inherit: "O", tip-origin: 0, tail-origin: 0),
      "(c": (inherit: "(", tip-origin: 0, tail-origin: 0),
      ")c": (inherit: ")", tip-origin: 0, tail-origin: 0),
    )
))

#fletcher.diagram(
  node-stroke: 1pt,
  node-inset: 8pt,
  spacing: (16pt, 16pt),
  label-size: 10pt,
  mark-scale: 150%,
  {
    import fletcher: edge, node

    node(enclose: ((-1, 0), (0, 0)), name: "algo_label")[Algorithm]

    node(enclose: ((-1, 3), (-1, 6)), name: "learner_label", stroke: yellow)[Learner]

    node(enclose: ((0, 3), (0, 6)), name: "rs_label", stroke: blue)[EnvRunnerServer]

    node(enclose: ((2, 3), (2, 6)), name: "rc_label")[EnvRunnerClient]

    node(enclose: ((4, 3), (4, 6)), name: "env_base")[env-base]
    node((7, 1), name: "env_sim")[env-sim]
    node((7, 3), name: "env_real")[env-real]
    node((9, 1), name: "backend_sim")[backend-sim]
    node((9, 3), name: "backend_real")[backend-real]

    node((rel: (0pt, -32pt), to: (-1, 0)), name: "if_alg_learner")
    node((rel: (0pt, -32pt), to: (0, 0)), name: "if_alg_runner")
    node((3, 3), name: "if_zmq")
    node((8, 1), name: "if_bs_sim")
    node((8, 3), name: "if_bs_real")

    edge((-1, 0), "d", "-(c", snap-to: (auto, none))
    edge((0, 0), "d", "-(c", snap-to: (auto, none))
    edge((-1, 3), "u", "-Oc", snap-to: (auto, none))
    edge((0, 3), "u", "-Oc", snap-to: (auto, none))
    edge((-1, 2), "u", snap-to: (auto, none), "-->", stroke: gray)
    edge((0, 2), "u", snap-to: (auto, none), "-->", stroke: gray)

    let if-ep = (rel: (0, -0.25), to: (<rs_label.east>, 50%, <rc_label.west>))
    let if-gs = (rel: (0, 0.25), to: (<rs_label.east>, 50%, <rc_label.west>))
    edge(vertices: ((rel: (0, -0.25), to: <rs_label.east>), if-ep), "-(c", snap-to: (none, none))[EPISODES]
    edge(vertices: ((rel: (0, -0.25), to: <rc_label.west>), if-ep), "-Oc", snap-to: (none, none))
    edge(vertices: ((rel: (0, 0.25), to: <rs_label.east>), if-gs), "-Oc", snap-to: (none, none))[GET_STATE]
    edge(vertices: ((rel: (0, 0.25), to: <rc_label.west>), if-gs), "-(c", snap-to: (none, none))

    edge(<rc_label>, <if_zmq>, "-(c", snap-to: (auto, none), label-side: left)[ZMQ]
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
