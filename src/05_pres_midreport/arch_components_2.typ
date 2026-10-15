#import "/src/deps.typ": cetz, fletcher
#import "symbols.typ"
#import "util.typ": symbol, uml-component

#set text(size: 14pt)

#fletcher.MARKS.update(m => (
  m
    + (
      "Oc": (inherit: "O", tip-origin: 0, tail-origin: 0),
      "(c": (inherit: "(", tip-origin: 0, tail-origin: 0),
      ")c": (inherit: ")", tip-origin: 0, tail-origin: 0),
      "|>h": (inherit: "latex", fill: none, stroke: 1pt),
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

    node(enclose: ((-1, 0), (0, 0)), name: "algo_label")[#uml-component[Algorithm]]
    node(enclose: ((-1, 3), (-1, 5)), name: "learner_label", stroke: yellow)[#uml-component[Learner]]
    node(enclose: ((0, 3), (0, 5)), name: "rs_label", stroke: blue)[#uml-component[EnvRunnerServer]]
    node(enclose: ((3, 3), (3, 5)), name: "rc_label")[#uml-component[EnvRunnerClient]]
    node(enclose: ((6, 3), (6, 5)), name: "env_base")[#uml-component[env-base]]

    node((7, 3), name: "env_sim")[#uml-component[env-sim]]
    node((7, 5), name: "env_real")[#uml-component[env-real]]
    node((10, 3), name: "backend_sim")[#uml-component[backend-sim]]
    node((10, 5), name: "backend_real")[#uml-component[backend-real]]

    edge((-1, 0), "d", "-(")
    edge((0, 0), "d", "-(")
    edge((-1, 3), "u", "-O")
    edge((0, 3), "u", "-O")
    edge((-1, 2), "u", "<--", stroke: gray)
    edge((0, 2), "u", "<--", stroke: gray)

    edge((0, 5), "r", "-(")
    edge((1, 5), "r", "-->", stroke: gray)
    edge((2, 5), "r", "O-")

    edge((0, 3), "r", "-O")
    edge((1, 3), "r", "<--", stroke: gray)
    edge((2, 3), "r", ")-")

    edge((3, 4), "r", "-(")
    edge((4, 4), "r", "-->", stroke: gray)
    edge((5, 4), "r", "O-")

    edge(<env_sim>, <env_base>, "-|>h")
    edge(<env_real>, <env_base>, "-|>h")

    edge((7, 5), "r", "-(")
    edge((8, 5), "r", "-->", stroke: gray)
    edge((9, 5), "r", "O-")

    edge((7, 3), "r", "-O")
    edge((8, 3), "r", "<--", stroke: gray)
    edge((9, 3), "r", ")-")
  },
)
