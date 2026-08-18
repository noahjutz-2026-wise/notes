#import "/template.typ": template_base, template_doc_part

#show: template_base

#set document(
  title: [Time Plan],
  date: datetime(year: 2026, month: 8, day: 18),
)

#title()
#outline()

#pagebreak()

= Stundenplan

#{
  show: template_doc_part
  include "timetable/table.typ"
}

#pagebreak()

= Statistik

#{
  show: template_doc_part
  include "stats/main.typ"
}
