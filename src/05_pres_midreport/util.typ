#import "/src/deps.typ": cetz
#import "symbols.typ"

#import "@preview/cetz:0.3.4": draw as fletcher-draw

#let symbol(body, canvas-size: 1cm, symbol-size: 1cm) = box(
  width: canvas-size,
  height: canvas-size,
  align(center + horizon, cetz.canvas(length: symbol-size, body)),
)

#let uml_component(node, extrude) = {
  let r = node.corner-radius
  let (w, h) = node.size.map(i => i / 2 + extrude)
  fletcher-draw.rect(
    (-w, -h),
    (+w, +h),
    radius: if r != none { r + extrude },
  )
}
