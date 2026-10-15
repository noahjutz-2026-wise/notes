#import "/src/deps.typ": cetz
#import "symbols.typ"

#let symbol(body, canvas-size: 1cm, symbol-size: auto) = {
  let unit = if symbol-size == auto { 1em } else { symbol-size }
  box(
    width: canvas-size,
    height: canvas-size,
    align(center + horizon, cetz.canvas(length: unit, body)),
  )
}

#let uml-component(body, name: [component], symb: symbol(symbols.symbol_module, canvas-size: auto)) = box({
  stack(
    stack(
      dir: ltr,
      spacing: 1fr,
      hide(symb),
      h(4pt),
      text(gray)[«#name»],
      h(4pt),
      symb,
    ),
    v(4pt),
    v(1fr),
    body,
    v(1fr),
  )
})
