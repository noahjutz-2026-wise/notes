#import "/src/deps.typ": fletcher, cetz
#import "symbols.typ"

#fletcher.diagram(
  node-stroke: 1pt,
  node-shape: fletcher.shapes.rect,
  node-inset: 8pt,
  spacing: (32pt, 32pt),
  label-sep: 0pt,
  {
    import fletcher: node, edge
    node((0, 0), name: "learn_label", stroke: none)[Learner]
    node((0, 1), name: "learn_traj")[#cetz.canvas(symbols.symbol_buffer)]
    edge("->")
    node((0, 2), name: "learn_model")[#cetz.canvas(symbols.symbol_neural_net)]
    node(
      enclose: (<learn_label>, <learn_traj>, <learn_model>),
      name: "learn",
      shape: fletcher.shapes.house,
      stroke: 2pt + yellow
    )


    node((1, 0), name: "runner_label", stroke: none)[Runner]
    node((1, 1), name: "runner_system")[#cetz.canvas(symbols.symbol_unity)]
    node((1, 2), name: "runner_model")[#cetz.canvas(symbols.symbol_neural_net)]
    node(
      enclose: (<runner_label>, <runner_system>, <runner_model>),
      name: "runner",
      shape: fletcher.shapes.house,
      stroke: 2pt + blue
    )
    edge(<runner_system>, <learn_traj>, "->")[#text(0.5em)[samples]]
    edge(<learn_model>, <runner_model>, "->")

    node((0.5, -1), name: "sim_label", stroke: none)[Sim]
    node(
      enclose: (<learn>, <runner>, <sim_label>),
      stroke: 2pt,
      corner-radius: 8pt
    )


    node((2, 1), name: "sim_model_label", stroke: none)[Sim Model]
    node((2, 2), name: "sim_model")[#cetz.canvas(symbols.symbol_neural_net)]
})
