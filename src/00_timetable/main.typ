#import "/deps.typ": suiji

#{
  let rng = suiji.gen-rng-f(4)
  let hue = 150deg
  let max_height = 150pt

  let lo = datetime(hour: 8, minute: 0, second: 0)
  let hi = datetime(hour: 23, minute: 0, second: 0)

  let zip_longest(..arrs, pad: []) = {
    let n = arrs.pos().fold(0, (acc, x) => calc.max(acc, x.len()))
    return range(n).map(i => {
      arrs
        .pos()
        .map(a => {
          a.at(i, default: pad)
        })
    })
  }

  let palette(n) = {
    return range(n).map(i => {
      let h = hue + 1deg * (360 / n) * i
      (
        _95: color.hsv(h, 5%, 95%),
        _90: color.hsv(h, 10%, 90%),
        _50: color.hsv(h, 60%, 50%),
        _10: color.hsv(h, 60%, 40%),
      )
    })
  }

  let colors = palette(4)

  let color_map = (
    "bib": colors.at(1),
  )

  let col(
    day,
    hi: hi,
    lo: lo,
  ) = {
    layout(((width, height)) => {
      for block in day {
        let ty = ((block.from - lo) / (hi - lo)) * height
        let hy = ((block.to - lo) / (hi - lo)) * height
        let c = color_map.at(block.body.text, default: none)
        place(dy: ty)[
          #box(
            height: hy,
            width: width,
            inset: 4pt,
            fill: c._10,
          )[
            #set text(fill: c._95)
            #set align(horizon)
            #block.body
          ]
        ]
      }
    })
  }

  set page(
    width: auto,
    height: auto,
    margin: 0pt,
    fill: color.hsv(hue, 50%, 20%),
  )
  set text(font: "DejaVu Sans Mono", fill: white)
  show table.cell.where(y: 0): set text(colors.at(0)._90)
  show table.cell.where(x: 0): set text(colors.at(0)._50)
  show table.cell.where(y: 1): box.with(height: max_height, width: 80pt)

  let times = (
    "06:45",
    "08:15",
    "10:00",
    "11:45",
    "13:45",
    "15:30",
    "17:15",
    "19:00",
    "20:30",
    "22:15",
    "22:45",
  )
  let mon = (
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [bib],
    ),
  )
  let tue = ()
  let wed = ()
  let thu = ()
  let fri = ()
  let sat = ()
  let sun = ()

  table(
    columns: 8,
    stroke: none,
    inset: (x: 8pt, y: 4pt),
    [], [Mon], [Tue], [Wed], [Thu], [Fri], [Sat], [Sun],
    stack(lo.display(), hi.display(), spacing: 1fr), col(mon),
  )
}
