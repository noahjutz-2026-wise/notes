#let hue = 275deg
#let palette(n) = {
  return range(n).map(i => {
    let h = hue + 1deg * (360 / n) * i
    (
      _95: color.hsv(h, 5%, 95%),
      _90: color.hsv(h, 10%, 90%),
      _50: color.hsv(h, 60%, 50%),
      _30: color.hsv(h, 60%, 30%),
      _20: color.hsv(h, 50%, 20%),
    )
  })
}

#let colors = palette(5)
