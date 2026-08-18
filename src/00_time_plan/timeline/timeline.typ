#import "/deps.typ": cetz, lilaq as lq
#import "../config/macro_schedule.typ": daterange, milestones, sections

#let p10 = lq.color.map.petroff10

#cetz.canvas(length: 10cm, {
  import cetz.draw: *

  let width = 16pt
  let pad = 8pt

  rect((0, 0), (width, 1))
  //set-style(stroke: none)
  let current_date = daterange.from
  for i in range(sections.len()) {
    let (d, c) = sections.at(i)
    let h = (d - current_date) / (daterange.to - daterange.from)
    let y = (daterange.to - current_date) / (daterange.to - daterange.from)

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
    let y = (daterange.to - d) / (daterange.to - daterange.from)
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
    )

    content(
      source,
      anchor: "east",
      padding: pad,
      c,
    )
  }
})
