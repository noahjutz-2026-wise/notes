#import "/src/deps.typ": fletcher

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
  {
    import fletcher: edge, node
    node((0, 0), [Component], shape: rect, name: <comp>)

    // provided interface (lollipop): small circle just outside the east edge
    node((rel: (16pt, 0pt), to: <comp.east>), [], inset: 0pt, name: <iface>)

    edge(<comp>, <iface>, "-Oc")

    node((rel: (-16pt, -16pt), to: <comp.west>), [], inset: 1pt, stroke: 2pt, name: <sock>)

    edge(<comp>, <sock>, "-(c", snap-to: (auto, none))

    node(<comp.north>, rect(width: 16pt, height: 6pt, fill: white), inset: 0pt, name: <port>)

    node((1, 1), name: <if>)
    node((-1, 2), name: <hi>)[hiiiiiiiiiiiii]

    edge(<if>, <hi>, ")c-")
    edge(<iface>, <if>, "<-", dash: "dashed", stroke: gray)
    edge(<hi>, <sock>, "-Oc", snap-to: (auto, none))
  },
)
