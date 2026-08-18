#import "../config/schedule.typ": *
#import "colors.typ": colors

#{
  let max_height = 350pt
  let col_width = 80pt

  let lo = datetime(hour: 6, minute: 0, second: 0)
  let hi = datetime(hour: 23, minute: 0, second: 0)

  let color_map = (
    "bib": colors.at(1),
    "gym": colors.at(2),
    "teammeeting": colors.at(3),
    "Q&A": colors.at(3),
    "merle": colors.at(4),
    "shawarmen": colors.at(4),
    "sarah": colors.at(4),
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
    ticks.push(hi)

    layout(((width, height)) => {
      for tick in ticks {
        let body = tick.display("[hour]")
        let size = measure(body)
        let ty = (tick - lo) / (hi - lo) * height
        place(dx: 16pt, dy: ty - 0.25pt)[
          #line(length: 7 * col_width + 8pt, stroke: .5pt + colors.at(0)._30)
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
    margin: 32pt,
    fill: colors.at(0)._20,
  )
  set text(font: "DejaVu Sans Mono", fill: white)
  show table.cell.where(x: 0): strong
  show table.cell.where(x: 0): set text(colors.at(0)._50)
  show table.cell.where(y: 0): box.with(inset: (x: 4pt))
  show table.cell.where(y: 0): strong
  show table.cell.where(y: 0): set text(colors.at(0)._90)
  show table.cell.where(y: 1): box.with(height: max_height, width: col_width)
  show table.cell.where(x: 0): box.with(width: 24pt)

  table(
    columns: 8,
    stroke: none,
    inset: (x: 1pt, y: 4pt),
    [], [Mon], [Tue], [Wed], [Thu], [Fri], [Sat], [Sun],
    time_col(), col(mon), col(tue), col(wed), col(thu), col(fri), col(sat), col(sun),
  )
}
