#import "/deps.typ": suiji

#{
  let rng = suiji.gen-rng-f(4)
  let hue = 150deg
  let max_height = 350pt

  let lo = datetime(hour: 7, minute: 0, second: 0)
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
        _30: color.hsv(h, 60%, 30%),
      )
    })
  }

  let colors = palette(4)

  let color_map = (
    "bib": colors.at(1),
    "gym": colors.at(2),
  )

  let col(
    day,
    hi: hi,
    lo: lo,
  ) = {
    layout(((width, height)) => {
      for block in day {
        let ty = ((block.from - lo) / (hi - lo)) * height
        let hy = ((block.to - block.from) / (hi - lo)) * height
        let c = color_map.at(block.body.text, default: none)
        place(dy: ty)[
          #box(
            height: hy,
            width: width,
            inset: 4pt,
            fill: if c == none { colors.at(0)._30 } else { c._50 },
          )[
            #set text(fill: if c == none { colors.at(0)._95 } else { c._95 })
            #set align(center + horizon)
            #block.body
          ]
        ]
      }
    })
  }

  let time_col(lo: lo, hi: hi, tick_gap: duration(hours: 1)) = {
    let t = lo
    let ticks = ()
    while t < hi {
      ticks.push(t)
      t += tick_gap
    }

    layout(((width, height)) => {
      for tick in ticks {
        let body = tick.display("[hour]")
        let size = measure(body)
        let ty = (tick - lo) / (hi - lo) * height
        place(dx: 16pt, dy: ty - 0.25pt)[
          #line(length: 1000%, stroke: .5pt + colors.at(0)._30)
        ]
        place(dy: ty - size.height / 2)[
          #body
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
  show table.cell.where(x: 0): strong
  show table.cell.where(x: 0): set text(colors.at(0)._50)
  show table.cell.where(y: 0): box.with(inset: (x: 4pt))
  show table.cell.where(y: 0): strong
  show table.cell.where(y: 0): set text(colors.at(0)._90)
  show table.cell.where(y: 1): box.with(height: max_height, width: 80pt)
  show table.cell.where(x: 0): box.with(width: 24pt)

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
      from: datetime(hour: 7, minute: 0, second: 0),
      to: datetime(hour: 7, minute: 30, second: 0),
      body: [get ready],
    ),
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [bib],
    ),
    (
      from: datetime(hour: 13, minute: 30, second: 0),
      to: datetime(hour: 14, minute: 0, second: 0),
      body: [Q&A],
    ),

    (
      from: datetime(hour: 14, minute: 0, second: 0),
      to: datetime(hour: 20, minute: 0, second: 0),
      body: [bib],
    ),
  )
  let tue = (
    (
      from: datetime(hour: 7, minute: 0, second: 0),
      to: datetime(hour: 7, minute: 30, second: 0),
      body: [get ready],
    ),
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [bib],
    ),
    (
      from: datetime(hour: 13, minute: 0, second: 0),
      to: datetime(hour: 17, minute: 0, second: 0),
      body: [bib],
    ),
    (
      from: datetime(hour: 18, minute: 0, second: 0),
      to: datetime(hour: 20, minute: 0, second: 0),
      body: [gym],
    ),
  )
  let wed = (
    (
      from: datetime(hour: 7, minute: 0, second: 0),
      to: datetime(hour: 7, minute: 30, second: 0),
      body: [get ready],
    ),
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [bib],
    ),
    (
      from: datetime(hour: 13, minute: 0, second: 0),
      to: datetime(hour: 18, minute: 0, second: 0),
      body: [bib],
    ),
    (
      from: datetime(hour: 19, minute: 0, second: 0),
      to: datetime(hour: 20, minute: 0, second: 0),
      body: [gym],
    ),
  )
  let thu = (
    (
      from: datetime(hour: 7, minute: 0, second: 0),
      to: datetime(hour: 7, minute: 30, second: 0),
      body: [get ready],
    ),
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [bib],
    ),
    (
      from: datetime(hour: 13, minute: 0, second: 0),
      to: datetime(hour: 20, minute: 0, second: 0),
      body: [bib],
    ),
  )
  let fri = tue
  let sat = (
    (
      from: datetime(hour: 7, minute: 0, second: 0),
      to: datetime(hour: 7, minute: 30, second: 0),
      body: [get ready],
    ),
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [bib],
    ),
  )
  let sun = (
    (
      from: datetime(hour: 8, minute: 0, second: 0),
      to: datetime(hour: 9, minute: 0, second: 0),
      body: [get ready],
    ),
    (
      from: datetime(hour: 9, minute: 15, second: 0),
      to: datetime(hour: 12, minute: 0, second: 0),
      body: [clean],
    ),
    (
      from: datetime(hour: 13, minute: 0, second: 0),
      to: datetime(hour: 16, minute: 0, second: 0),
      body: [gym],
    ),
    (
      from: datetime(hour: 17, minute: 0, second: 0),
      to: datetime(hour: 19, minute: 0, second: 0),
      body: [meal prep],
    ),
  )

  table(
    columns: 8,
    stroke: none,
    inset: (x: 1pt, y: 4pt),
    [], [Mon], [Tue], [Wed], [Thu], [Fri], [Sat], [Sun],
    time_col(), col(mon), col(tue), col(wed), col(thu), col(fri), col(sat), col(sun),
  )
}
