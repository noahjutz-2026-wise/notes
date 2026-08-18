#import "/template.typ": template_base

#show: template_base

#set document(
  title: [Time Plan],
  date: datetime(year: 2026, month: 8, day: 18),
)

#title()
#outline()

#pagebreak()

#include "timetable/main.typ"

#include "stats/main.typ"
