#let entries = parse_literature("../assets/literature.rdf")

#table(
  columns: 4,
  table.header([*Citation Key*], [*Stage*], [*Decision*], [*Cluster*]),
  ..entries
    .map(e => (
      if e.label != none and e.label != "" { e.label } else { e.citationKey },
      if e.stage != none { e.stage } else { [] },
      if e.decision != none { e.decision } else { [] },
      if e.cluster != none { e.cluster } else { [] },
    ))
    .flatten(),
)
