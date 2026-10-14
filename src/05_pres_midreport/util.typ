#import "/src/deps.typ": cetz

// Create a cetz canvas for a symbol drawing (see symbols.typ) and center it
// inside a fixed-size bounding box, so all symbols occupy the same footprint.
#let symbol-size = 1cm

#let symbol(body) = box(
  width: symbol-size,
  height: symbol-size,
  align(center + horizon, cetz.canvas(body)),
)
