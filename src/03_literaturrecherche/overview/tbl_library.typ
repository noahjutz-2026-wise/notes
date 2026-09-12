#import "parse_literature.typ": parse_literature

#let schema_data = toml("../data/schema.toml")
#let color_mapping = schema_data.at("colors", default: (:))

#let cell_fill(category, value) = {
  if value == none or category not in color_mapping {
    return none
  }
  let hex = color_mapping.at(category).at(str(value), default: none)
  if hex != none { rgb(hex) } else { none }
}

#let sort_by = "stage"

#let entries = parse_literature("/vendor/literature/betterbibtex.json")

#let sorted_entries = entries.sorted(key: e => {
  let val = if sort_by == "label" {
    if e.label != none and e.label != "" { e.label } else { e.at("title", default: none) }
  } else {
    e.at(sort_by, default: none)
  }
  if val == none { "" } else { lower(str(val)) }
})

#table(
  columns: 4,
  table.header([*Label*], [*Stage*], [*Decision*], [*Cluster*]),
  ..sorted_entries
    .map(e => {
      let t = e.at("title", default: none)
      let label_or_title = if e.label != none and e.label != "" {
        e.label
      } else if t != none {
        text(gray)[#block(height: 1em, clip: true)[#t]]
      } else {
        []
      }
      (
        table.cell[#label_or_title],
        table.cell(fill: cell_fill("stage", e.stage))[#(if e.stage != none { e.stage } else { [] })],
        table.cell(fill: cell_fill("decision", e.decision))[#(if e.decision != none { e.decision } else { [] })],
        table.cell(fill: cell_fill("cluster", e.cluster))[#(if e.cluster != none { e.cluster } else { [] })],
      )
    })
    .flatten(),
)
