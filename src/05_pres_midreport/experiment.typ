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
    // Sim block
    node((0, 0), name: "sim_learner_label", stroke: none)[Learner]
    node((0, 1), name: "sim_learner_traj")[#cetz.canvas(symbols.symbol_buffer)]
    edge("->")
    node((0, 2), name: "sim_learner_model")[#cetz.canvas(symbols.symbol_neural_net)]
    node(
      enclose: (<sim_learner_label>, <sim_learner_traj>, <sim_learner_model>),
      name: "sim_learner",
      shape: fletcher.shapes.house,
      stroke: 2pt + yellow
    )

    node((1, 0), name: "sim_runner_label", stroke: none)[Runner]
    node((1, 1), name: "sim_runner_system")[#cetz.canvas(symbols.symbol_unity)]
    node((1, 2), name: "sim_runner_model")[#cetz.canvas(symbols.symbol_neural_net)]
    node(
      enclose: (<sim_runner_label>, <sim_runner_system>, <sim_runner_model>),
      name: "sim_runner",
      shape: fletcher.shapes.house,
      stroke: 2pt + blue
    )
    edge(<sim_runner_system>, <sim_learner_traj>, "->")[#text(0.5em)[samples]]
    edge(<sim_learner_model>, <sim_runner_model>, "->")

    node((0.5, -1), name: "sim_label", stroke: none)[Sim]
    node(
      enclose: (<sim_learner>, <sim_runner>, <sim_label>),
      stroke: 2pt,
      corner-radius: 8pt
    )

    // Sim Model between Sim and Real
    node((2, 1), name: "sim_model_label", stroke: none)[Sim Model]
    node((2, 2), name: "sim_model")[#cetz.canvas(symbols.symbol_neural_net)]

    // Real block
    node((3, 0), name: "real_learner_label", stroke: none)[Learner]
    node((3, 1), name: "real_learner_traj")[#cetz.canvas(symbols.symbol_buffer)]
    edge((3, 1), (3, 2), "->")
    node((3, 2), name: "real_learner_model")[#cetz.canvas(symbols.symbol_neural_net)]
    node(
      enclose: (<real_learner_label>, <real_learner_traj>, <real_learner_model>),
      name: "real_learner",
      shape: fletcher.shapes.house,
      stroke: 2pt + yellow
    )

    node((4, 0), name: "real_runner_label", stroke: none)[Runner]
    node((4, 1), name: "real_runner_system")[#cetz.canvas(symbols.symbol_iso_square_rod)]
    node((4, 2), name: "real_runner_model")[#cetz.canvas(symbols.symbol_neural_net)]
    node(
      enclose: (<real_runner_label>, <real_runner_system>, <real_runner_model>),
      name: "real_runner",
      shape: fletcher.shapes.house,
      stroke: 2pt + blue
    )
    edge(<real_runner_system>, <real_learner_traj>, "->")[#text(0.5em)[samples]]
    edge(<real_learner_model>, <real_runner_model>, "->")

    node((3.5, -1), name: "real_label", stroke: none)[Real]
    node(
      enclose: (<real_learner>, <real_runner>, <real_label>),
      stroke: 2pt,
      corner-radius: 8pt
    )

    // Connect sim and real via sim_model
    edge(<sim_runner_model>, <sim_model>, "->")
    edge(<sim_model>, <real_runner_model>, "->")
})
