#import "/src/deps.typ": cetz, lilaq as lq
#import "/vendor/planning/macro_schedule.typ": daterange, milestones, sections

#let p10 = lq.color.map.petroff10

#let hatch = tiling(size: (10pt, 10pt))[
  #place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.5pt))
]

#cetz.canvas(length: 23cm, {
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
      fill: p10.at(calc.rem(i, 10)).lighten(50%),
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

  // --- Milestone labels: equally-spaced column to the left ---
  let n = milestones.len()
  // x position of the label column (left of the bar)
  let label_x = -80pt
  // vertical spacing between labels (fraction of canvas height)
  let label_spacing = 1.0 / (n + 1)

  for i in range(n) {
    let (d, c) = milestones.at(i)
    // actual date position on the bar
    let ruler_y = (d - daterange.from) / (daterange.to - daterange.from)
    // equally spaced label position
    let label_y = label_spacing * (i + 1)

    let label_name = "milestone-label-" + str(i + 1)
    let ruler_name = "milestone-ruler-" + str(i + 1)

    // dot on the bar at the actual date
    circle(
      (width / 2, ruler_y),
      radius: 2pt,
      stroke: none,
      fill: black,
      name: ruler_name,
    )

    // label in the equally-spaced column
    content(
      (label_x, label_y),
      anchor: "east",
      padding: pad,
      text(size: 8pt, str(i + 1) + "  " + d.display("[year]-[month]-[day]")),
      name: label_name,
    )

    // orthogonal connector: label → vertical channel → ruler dot
    line(
      (label_x + pad, label_y),
      (-2 * pad, label_y),
      (-2 * pad, ruler_y),
      (width / 2, ruler_y),
      stroke: 0.75pt + black.lighten(40%),
    )
  }


  let tick = daterange.from + duration(days: 1)
  while true {
    if tick >= daterange.to { break }
    let y = (tick - daterange.from) / (daterange.to - daterange.from)
    let name = "tick" + tick.display()
    let days = (tick - daterange.from).days()

    let mid = width / 2

    if tick.day() == 1 {
      line(
        (mid - pad, y),
        (mid + pad, y),
        stroke: 1pt,
        name: name,
      )
      content(
        name + ".end",
        anchor: "west",
        padding: pad,
        [*#tick.display("[month repr:short]")*],
      )
    } else if calc.rem(days, 10) == 0 {
      line(
        (mid - pad / 2, y),
        (mid + pad / 2, y),
        stroke: 1pt + black.transparentize(50%),
        name: name,
      )
    } else {
      circle(
        (mid, y),
        stroke: none,
        radius: 1pt,
        fill: black.transparentize(75%),
      )
    }
    if calc.rem(days, 10) == 0 {
      content(
        name + ".start",
        anchor: "east",
        padding: pad,
        str(days),
      )
    }

    tick += duration(days: 1)
  }

  let elapsed = calc.min(1, (datetime.today() - daterange.from) / (daterange.to - daterange.from))
  rect(
    fill: hatch,
    (0, 0),
    (width, elapsed),
  )
})
