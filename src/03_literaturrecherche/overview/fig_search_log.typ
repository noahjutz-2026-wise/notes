#import "/deps.typ": lilaq as lq

#let tools = (
  "google_scholar",
  "semantic_scholar",
  "research_rabbit",
  "litmaps",
  "consensus",
  "elicit",
  "openalex",
  "oth",
  // "base",
  // "acm_dl",
  // "ieee_xplore",
)
#let palette = lq.color.map.petroff10

// custom tiling: n vertical stripes, one per color
#let color-tiling(..colors, cell-width: 4pt) = {
  let cs = colors.pos()
  let stripe-width = cell-width / cs.len()
  tiling(
    size: (cell-width, cell-width),
    relative: "self",
    {
      cs
        .enumerate()
        .map(((i, c)) => place(
          dx: stripe-width * i,
          rect(width: stripe-width, height: cell-width, fill: c, stroke: none),
        ))
        .join()
    },
  )
}

// ---------- data ----------
#let searches = toml("../data/search_log.toml").search
#let xs = searches.map(s => s.screened - s.duplicates)
#let ys = searches.map(s => (s.to - s.from).minutes())

#let tool-fill(tools) = {
  let colors = tools.filter(t => tools.contains(t)).map(t => palette.at(tools.position(x => x == t)))
  if colors.len() == 0 { gray } else if colors.len() == 1 { colors.first() } else { colors }
}
#let fills = searches.map(s => tool-fill(s.tools))

#let custom-circle(fill-color) = {
  mark => {
    let radius = mark.size / 2
    let fill = if type(fill-color) == array {
      color-tiling(..fill-color, cell-width: mark.size)
    } else {
      fill-color
    }
    move(
      dx: -radius,
      dy: -radius,
      std.ellipse(width: radius * 2, height: radius * 2, fill: fill, stroke: none),
    )
  }
}

#let legend-icon(fill-color) = {
  box(width: 1.2em, height: 1em, align(center + horizon, std.circle(
    radius: 3pt,
    fill: fill-color,
    stroke: 0.5pt + gray,
  )))
}

// ---------- plot ----------
#lq.diagram(
  width: 12cm,
  height: 8cm,
  xlabel: [screened $-$ duplicates],
  ylabel: [duration (min)],
  legend: lq.legend(
    position: top + left,
    ..tools
      .enumerate()
      .map(((i, name)) => (
        legend-icon(palette.at(calc.rem(i, 10))),
        tools.at(i),
      ))
      .join(),
  ),
  ..range(xs.len()).map(i => {
    lq.scatter(
      (xs.at(i),),
      (ys.at(i),),
      mark: custom-circle(fills.at(i)),
      size: 16pt,
    )
  }),
)
