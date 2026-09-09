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
  let val = if sort_by == "citationKey" {
    if e.label != none and e.label != "" { e.label } else { e.citationKey }
  } else {
    e.at(sort_by, default: none)
  }
  if val == none { "" } else { lower(str(val)) }
})

#table(
  columns: 4,
  table.header([*Citation Key*], [*Stage*], [*Decision*], [*Cluster*]),
  ..sorted_entries
    .map(e => {
      let key_or_label = if e.label != none and e.label != "" { e.label } else { e.citationKey }
      (
        table.cell[#key_or_label],
        table.cell(fill: cell_fill("stage", e.stage))[#(if e.stage != none { e.stage } else { [] })],
        table.cell(fill: cell_fill("decision", e.decision))[#(if e.decision != none { e.decision } else { [] })],
        table.cell(fill: cell_fill("cluster", e.cluster))[#(if e.cluster != none { e.cluster } else { [] })],
      )
    })
    .flatten(),
)
