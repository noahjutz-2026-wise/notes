#import "/src/deps.typ": cetz

#let symbol(body, symbol-size: 1cm) = box(
  width: symbol-size,
  height: symbol-size,
  align(center + horizon, cetz.canvas(body)),
)
