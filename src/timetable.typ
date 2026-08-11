#let hue = 150deg

#set page(
  width: auto,
  height: auto,
  margin: 0pt,
  fill: color.hsv(hue, 50%, 20%),
)

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

  set text(font: "DejaVu Sans Mono", fill: white)
  show table.cell.where(y: 0): strong

  let fg = color.hsv(hue, 5%, 96%)
  let fg_light = color.hsv(hue, 10%, 60%)
  let s_bg = 60%
  let v_bg = 40%
  let hue_dw = 105deg
  let dw_bg = color.hsv(hue_dw, s_bg, v_bg)
  let work_bg = gradient.linear(
    color.hsv(40deg, s_bg, v_bg),
    color.hsv(220deg, s_bg, v_bg),
  )
  let hue_cg = 220deg
  let cg_bg = color.hsv(hue_cg, s_bg, v_bg)
  let hue_cr = 225deg
  let cr_bg = color.hsv(hue_cg, 10%, v_bg)
  let hue_os = 40deg
  let os_bg = color.hsv(hue_os, s_bg, v_bg)
  let hue_or = 55deg
  let or_bg = color.hsv(hue_or, s_bg, v_bg)
  let hue_friends = 300deg
  let friends_bg = color.hsv(hue_friends, s_bg, v_bg)

  show table.cell: it => {
    show "relax": emph
    show "bib": strong
    let fill = if it.body.has("text") {
      (
        "DW": (dw_bg, fg),
        "OS": (os_bg, fg),
        "OR": (or_bg, fg),
        "CR": (cr_bg, fg),
        "CG": (cg_bg, fg),
        "SAPPZ": (work_bg, fg),
        "MEM": (work_bg, fg),
        "friends": (friends_bg, fg),
        "bib": (none, fg),
        "wake up": (none, fg_light),
        "go to bed": (none, fg_light),
        "sleep": (none, fg_light),
      )
        .pairs()
        .find(((entry, ..)) => entry in it.body.text)
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
