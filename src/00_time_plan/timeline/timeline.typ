#import "/deps.typ": cetz, lilaq as lq
#import "../config/macro_schedule.typ": daterange, milestones, sections

#let p10 = lq.color.map.petroff10

#cetz.canvas(length: 15cm, {
  import cetz.draw: *

  let width = 32pt
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
    let target = (0, y)
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
      stroke: 1pt,
    )

    content(
      source,
      anchor: "east",
      padding: pad,
      c,
    )
  }

  let elapsed = (datetime.today() - daterange.from) / (daterange.to - daterange.from)
  rect(
    fill: black.transparentize(50%),
    (0, 0),
    (width, elapsed),
  )
})
