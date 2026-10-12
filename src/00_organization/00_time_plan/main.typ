= Timetable

#include "timetable/main.typ"

= Timeline

#include "timeline/main.typ"

= Statistics

#include "stats/main.typ"
#pagebreak()

= Deadlines

#table(
  columns: 2,
  table.header([Date], [Goal]),
  datetime(year: 2026, month: 10, day: 12).display(),
  [
    - [ ] Define spaces and run on unity
      - [ ] crs2r-labyrinth-gymnasium
      - [ ] crs2r-mlagents
  ],

  datetime(year: 2026, month: 10, day: 13).display(),
  [
    - [ ] crs2r-learn
    - [ ] crs2r-control-loop
  ],

  datetime(year: 2026, month: 10, day: 14).display(),
  [
    - [ ] containerize & ship
  ],
)
