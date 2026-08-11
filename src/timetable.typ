#{
  let hue = 150deg

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
        _90: color.hsv(h, 10%, 90%),
        _50: color.hsv(h, 60%, 50%),
        _10: color.hsv(h, 60%, 40%),
      )
    })
  }

  let choose_color(s) = {
    // todo
  }

  let col(
    day,
    hi: datetime(hour: 6, minute: 0, second: 0),
    lo: datetime(hour: 23, minute: 0, second: 0),
  ) = {
    layout((width, height) => {
      for block in day {
        let ty = (day.from - lo) * (hi - lo)
        let hy = (day.to - lo) * (hi - lo)
        place(dy: ty, box(
          height: hy,
          day.body,
        ))
      }
    })
  }

  let colors = palette(4)

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
  let mon = ()
  let tue = ()
  let wed = ()
  let thu = ()
  let fri = ()
  let sat = ()
  let sun = ()

  set page(
    width: auto,
    height: auto,
    margin: 0pt,
    fill: color.hsv(hue, 50%, 20%),
  )
  set text(font: "DejaVu Sans Mono", fill: white)
  show table.cell.where(y: 0): set text(colors.at(0)._90)
  show table.cell.where(x: 0): set text(colors.at(0)._50)

  show table.cell: it => {
    show "relax": emph
    show "bib": strong
    let fill = if it.body.has("text") {
      (:).pairs().find(((entry, ..)) => entry in it.body.text)
    }

    if fill == none {
      it
    } else {
      let (_, bg, fg) = fill.flatten()
      set text(fill: fg)
      layout(((width, height)) => {
        box(width: width, height: height, fill: bg, inset: it.inset)[
          #it.body
        ]
      })
    }
  }

  table(
    columns: 8,
    stroke: none,
    inset: (x: 8pt, y: 4pt),
    [], [Mon], [Tue], [Wed], [Thu], [Fri], [Sat], [Sun],
    ..zip_longest(times, mon, tue, wed, thu, fri, sat, sun).flatten(),
  )
}
