#import "/src/deps.typ": fletcher, cetz
#import "symbols.typ"
#import "util.typ": symbol

#set text(size: 14pt)

#fletcher.diagram(
  node-stroke: 1pt,
  node-shape: fletcher.shapes.rect,
  node-inset: 6pt,
  spacing: (64pt, 32pt),
  label-sep: 0pt,
  label-size: 12pt,
  {
    import fletcher: node, edge

    // Learner (left, yellow house)
    node((0, 0), name: "learner_label", stroke: none)[Learner]
    node((0, 1), name: "learner_traj")[#symbol(symbols.symbol_buffer)]
    edge(<learner_traj>, <learner_model>, "->")[optim]
    node((0, 2), name: "learner_model")[#symbol(symbols.symbol_neural_net)]
    node(
      enclose: (<learner_label>, <learner_traj>, <learner_model>),
      name: "learner",
      shape: fletcher.shapes.house,
      stroke: 2pt + yellow,
    )

    // RunnerServer (middle, empty blue house, as tall as the others)
    node((1, 0), name: "rs_label", stroke: none)[RunnerServer]
    node((1, 1), name: "rs_traj", stroke: none, width: 0pt)[#hide[#symbol(symbols.symbol_buffer)]]
    node((1, 2), name: "rs_model", stroke: none, width: 0pt)[#hide[#symbol(symbols.symbol_neural_net)]]
    node(
      enclose: (<rs_label>, <rs_traj>, <rs_model>),
      name: "runner_server",
      shape: fletcher.shapes.house,
      stroke: 2pt + blue,
    )

    // RunnerClient (right of RunnerServer, blue-ish house)
    node((2, 0), name: "rc_label", stroke: none)[RunnerClient]
    node((2, 1), name: "rc_buffer")[#symbol(symbols.symbol_buffer)]
    node((2, 1.5), name: "rc_gym")[gym.Env]
    node((2, 2), name: "rc_model")[#symbol(symbols.symbol_neural_net)]
    node(
      enclose: (<rc_label>, <rc_buffer>, <rc_gym>, <rc_model>),
      name: "runner_client",
      shape: fletcher.shapes.house,
      stroke: 2pt + blue.lighten(40%),
    )

    // System (right-most, gray/black house)
    // Four equal-height nodes forming a 2x2 grid:
    // left column = rotated interface cells, right column = unity/cyberrunner
    node((3.5, 0), name: "sys_label", stroke: none)[System]
    node((3, 1), name: "sys_ml")[#rotate(90deg, reflow: true)[mlagents gym]]
    node((4, 1), name: "sys_unity")[#symbol(symbols.symbol_unity) \ unity]
    node((3, 2), name: "sys_gym")[#rotate(90deg, reflow: true)[gym]]
    node((4, 2), name: "sys_cr")[#symbol(symbols.symbol_iso_square_rod) \ CR]
    node(
      enclose: (<sys_label>, <sys_ml>, <sys_unity>, <sys_gym>, <sys_cr>),
      name: "system",
      shape: fletcher.shapes.house,
      stroke: 2pt + luma(80),
    )

    // Arrows
    // Learner <-> RunnerClient: sample + model transfer via RunnerServer,
    // each split into two arrows meeting at the hidden server nodes
    edge(<learner_model>, <rs_model>, "->")
    edge(<rs_model>, <rc_model>, "->")[tcp]
    edge(<rc_buffer>, <rs_traj>, "->")[tcp]
    edge(<rs_traj>, <learner_traj>, "->")

    // RunnerClient internals: model acts, env steps, results stored
    edge(<rc_model>, <rc_gym>, "<->")[explore]
    edge(<rc_gym>, <rc_buffer>, "->")[trajectory]

    // RunnerClient <-> System: orthogonal ZMQ fork to both interface cells
    edge(<rc_gym>, (2.5, 1.5), (2.5, 1), <sys_ml>, "->")[ZMQ]
    edge((2.5, 1.5), (2.5, 2), <sys_gym>, "->")

    // Process boundaries (dashed vertical lines)
    edge((1.5, -0.6), (1.5, 2.6), stroke: (paint: gray, dash: "dashed"))
    edge((2.5, -0.6), (2.5, 2.6), stroke: (paint: gray, dash: "dashed"))
  },
)
