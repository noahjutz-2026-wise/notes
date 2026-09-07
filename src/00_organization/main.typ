#import "/template.typ": template_base, template_doc_part

#show: template_base

#set document(
  title: [Organisation],
  date: datetime(year: 2026, month: 8, day: 18),
)

#title()
#outline()

#pagebreak()

= Zeitplan

#{
  show: template_doc_part
  include "00_time_plan/main.typ"
}
