#import "/deps.typ": cetz, lilaq as lq
#import "../config/macro_schedule.typ": daterange, milestones, sections

#let p10 = lq.color.map.petroff10

#let hatch = tiling(size: (10pt, 10pt))[
  #place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.5pt))
]

#cetz.canvas(length: 18cm, {
  import cetz.draw: *

  let width = 128pt
  let pad = 8pt

  scale(y: -1)

  let current_date = daterange.from
  set-style(stroke: none)
  rect((0, 0), (width, 1), fill: black.lighten(95%))

  for i in range(sections.len()) {
    let (d, c) = sections.at(i)
    let h = (d - current_date) / (daterange.to - daterange.from)
    let y = (current_date - daterange.from) / (daterange.to - daterange.from)

    let name = "r" + str(i)

    rect(
      (0, y),
      (width, h + y),
      fill: p10.at(calc.rem(i, 10)),
      name: name,
    )

    content(
      name + ".east",
      anchor: "west",
      padding: pad,
      c,
    )
    current_date = d
  }

  for i in range(milestones.len()) {
    let (d, c) = milestones.at(i)
    let y = (d - daterange.from) / (daterange.to - daterange.from)
    let target = (width / 2, y)
    let source = (rel: (-(width / 2 + 2 * pad), 0), to: target)
    circle(
      target,
      radius: 2pt,
      stroke: none,
      fill: black,
    )

    line(
      source,
      target,
      stroke: 1pt + black.lighten(40%),
    )

    content(
      source,
      anchor: "east",
      padding: pad,
      c,
    )
  }

  let tick = daterange.from + duration(days: 1)
  while true {
    if tick >= daterange.to { break }
    let y = (tick - daterange.from) / (daterange.to - daterange.from)
    let name = "tick" + tick.display()

    let mid = width / 2

    if tick.day() == 1 {
      line(
        (mid - pad, y),
        (mid + pad, y),
        stroke: 1pt,
        name: name,
      )
      content(
        name + ".start",
        anchor: "east",
        padding: pad,
        str((tick - daterange.from).days()),
      )
      content(
        name + ".end",
        anchor: "west",
        padding: pad,
        str(tick.display("[month]")),
      )
    } else {
      line(
        (mid - pad / 2, y),
        (mid + pad / 2, y),
        stroke: 1pt + black.transparentize(50%),
      )
    }

    tick += duration(days: 1)
  }

  let elapsed = (datetime.today() - daterange.from) / (daterange.to - daterange.from)
  rect(
    fill: hatch,
    (0, 0),
    (width, elapsed),
  )
})
