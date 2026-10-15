#import "/src/deps.typ": cetz
#import "symbols.typ"

// Draw a symbol inside a square box.
// canvas-size: the size of the surrounding box;
// symbol-size: the cetz unit length, i.e. the size the symbol drawing spans
// (the symbol canvases are drawn on a 0..1 coordinate grid).
#let symbol(body, canvas-size: 1cm, symbol-size: 1cm) = box(
  width: canvas-size,
  height: canvas-size,
  align(center + horizon, cetz.canvas(length: symbol-size, body)),
)

// UML component: rectangle with the component symbol in the top right,
// a «stereotype» in the top middle and a custom body below.
// Intended as the body of a fletcher `node`.
#let uml-component(body, name: [component], symbol-size: 0.5cm) = box(
  {
    place(top + right, dy: 2pt, dx: -2pt, symbol(symbols.symbol_module, symbol-size: symbol-size))
    pad(right: symbol-size * 1.4, align(center)[«#name»])
    v(6pt)
    body
  },
)
