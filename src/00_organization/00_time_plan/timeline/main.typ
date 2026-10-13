#import "/vendor/planning/macro_schedule.typ": milestones

#figure(caption: [Timeline])[
  #include "timeline.typ"
]

== Milestones

#table(
  columns: 3,
  table.header([\#], [Date], [Goal]),
  ..milestones
    .enumerate()
    .map(((i, m)) => {
      let (d, c) = m
      (str(i + 1), d.display("[year]-[month]-[day]"), c)
    })
    .flatten(),
)
