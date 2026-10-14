#import "/src/deps.typ": cetz, lilaq as lq
#import "/vendor/planning/macro_schedule.typ": daterange, milestones, sections

#let p10 = lq.color.map.petroff10

#let hatch = tiling(size: (10pt, 10pt))[
  #place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.5pt))
]

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let bar_w = 11.5cm
  let bar_h = 22pt
  let bar_x = 4.0cm
  let bar_y = 0cm
  let mid_y = bar_y + bar_h / 2
  let pad = 6pt

  let total_days = (daterange.to - daterange.from).days()

  // Base bar background
  set-style(stroke: none)
  rect((bar_x, bar_y), (bar_x + bar_w, bar_y + bar_h), fill: black.lighten(95%))

  // Sections
  let current_date = daterange.from
  for i in range(sections.len()) {
    let (d, c) = sections.at(i)
    let x_start = bar_x + bar_w * (current_date - daterange.from).days() / total_days
    let x_end = bar_x + bar_w * (d - daterange.from).days() / total_days

    rect(
      (x_start, bar_y),
      (x_end, bar_y + bar_h),
      fill: p10.at(calc.rem(i, 10)).lighten(50%),
      name: "r" + str(i),
    )
    current_date = d
  }

  // Elapsed time hatch
  let elapsed_days = calc.min(total_days, calc.max(0, (datetime.today() - daterange.from).days()))
  let elapsed_x = bar_x + bar_w * elapsed_days / total_days
  rect(
    (bar_x, bar_y),
    (elapsed_x, bar_y + bar_h),
    fill: hatch,
  )

  // Day & month ticks
  let tick = daterange.from + duration(days: 1)
  while true {
    if tick >= daterange.to { break }
    let days = (tick - daterange.from).days()
    let x = bar_x + bar_w * days / total_days
    let name = "tick" + tick.display()

    if tick.day() == 1 {
      line(
        (x, bar_y),
        (x, bar_y + bar_h),
        stroke: 1pt + black,
        name: name,
      )
      content(
        (x, bar_y + bar_h - 2pt),
        anchor: "north",
        box(fill: white.transparentize(15%), inset: (x: 2pt, y: 1pt), radius: 1.5pt)[
          #text(size: 6.5pt, weight: "bold", tick.display("[month repr:short]"))
        ],
      )
    } else if calc.rem(days, 10) == 0 {
      line(
        (x, mid_y - 3.5pt),
        (x, mid_y + 3.5pt),
        stroke: 0.75pt + black.transparentize(50%),
        name: name,
      )
      content(
        (x, mid_y - 6.5pt),
        anchor: "north",
        text(size: 5.5pt, fill: black.lighten(30%), str(days)),
      )
    } else {
      circle(
        (x, mid_y),
        stroke: none,
        radius: 0.7pt,
        fill: black.transparentize(75%),
      )
    }

    tick += duration(days: 1)
  }

  // --- Milestone dots and labels (BELOW the bar) ---
  let n_m = milestones.len()
  let m_col_x = bar_x - 10pt
  let m_spacing = 15pt

  for i in range(n_m) {
    let (d, c) = milestones.at(i)
    let m_days = (d - daterange.from).days()
    let ruler_x = bar_x + bar_w * m_days / total_days
    let label_y = -(i + 1) * m_spacing

    let ruler_name = "m-dot-" + str(i + 1)
    let label_name = "m-lbl-" + str(i + 1)

    // Dot on the bar centerline
    circle(
      (ruler_x, mid_y),
      radius: 2pt,
      stroke: none,
      fill: black,
      name: ruler_name,
    )

    // Milestone label to the left, anchor east
    content(
      (m_col_x, label_y),
      anchor: "east",
      padding: pad,
      text(size: 8pt)[#str(i + 1) #h(4pt) #d.display("[year]-[month]-[day]")],
      name: label_name,
    )

    // Non-overlapping orthogonal line: from dot -> down to label_y -> left to label
    line(
      (ruler_x, mid_y),
      (ruler_x, label_y),
      (m_col_x, label_y),
      stroke: 0.75pt + black.lighten(40%),
    )
  }

  // --- Section labels (ABOVE the bar) on the LEFT ---
  let n_s = sections.len()
  let s_col_x = bar_x - 10pt
  let s_spacing = 15pt
  let s_base_y = bar_y + bar_h + 10pt

  // Compute y positions taking into account multi-line labels (section 6 has 2 lines)
  let y_offsets = (0pt,)
  for i in range(1, n_s) {
    let prev_c = sections.at(i - 1).at(1)
    let extra = if i - 1 == 6 { 8pt } else { 0pt }
    y_offsets.push(y_offsets.at(i - 1) + s_spacing + extra)
  }

  let cur_d = daterange.from
  for i in range(n_s) {
    let (d, c) = sections.at(i)
    let s_start = cur_d
    let s_end = d
    let s_days = ((s_start - daterange.from).days() + (s_end - daterange.from).days()) / 2
    let ruler_x = bar_x + bar_w * s_days / total_days

    let label_y = s_base_y + y_offsets.at(i)
    let label_name = "sec-lbl-" + str(i)

    content(
      (s_col_x, label_y),
      anchor: "east",
      padding: pad,
      text(size: 7.5pt, c),
      name: label_name,
    )

    // Non-overlapping orthogonal line: from top of bar at ruler_x -> up to label_y -> left to label
    line(
      (ruler_x, bar_y + bar_h),
      (ruler_x, label_y),
      (s_col_x, label_y),
      stroke: 0.75pt + black.lighten(40%),
    )

    cur_d = d
  }
})
