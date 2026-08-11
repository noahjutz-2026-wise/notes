#{
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

  let hue = 150deg

  let fg = color.hsv(hue, 5%, 96%)
  let fg_light = color.hsv(hue, 10%, 60%)

  set page(
    width: auto,
    height: auto,
    margin: 0pt,
    fill: color.hsv(hue, 50%, 20%),
  )
  set text(font: "DejaVu Sans Mono", fill: white)
  show table.cell.where(y: 0): strong
  show table.cell.where(x: 0): set text(fg_light)

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

  table(
    columns: 8,
    stroke: none,
    inset: (x: 8pt, y: 4pt),
    [], [Mon], [Tue], [Wed], [Thu], [Fri], [Sat], [Sun],
    ..zip_longest(times, mon, tue, wed, thu, fri, sat, sun).flatten(),
  )
}
