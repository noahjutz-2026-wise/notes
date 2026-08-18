#import "/deps.typ": cetz, lilaq as lq
#import "../config/macro_schedule.typ": daterange, sections

#let p10 = lq.color.map.petroff10

#cetz.canvas(length: 10cm, {
  import cetz.draw: *

  rect((0, 0), (16pt, 1))
  //set-style(stroke: none)
  let current_date = daterange.from
  for i in range(sections.len()) {
    let (d, c) = sections.at(i)
    let h = (d - current_date) / (daterange.to - daterange.from)
    let y = (daterange.to - current_date) / (daterange.to - daterange.from)

    let name = "r" + str(i)

    rect(
      (0, y),
      (16pt, h + y),
      fill: p10.at(calc.rem(i, 10)),
      name: name,
    )

    content(
      name + ".east",
      anchor: "west",
      padding: 8pt,
      c,
    )
    current_date = d
  }
})
