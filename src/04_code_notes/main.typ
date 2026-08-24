#import "/template.typ": *

#set document(
  title: [Code Notes],
  date: datetime(year: 2026, month: 8, day: 22),
)

#show: template_base

#title()

#outline()

#pagebreak()

= DreamerV3

#{
  show: template_doc_part
  include "dreamerv3/main.typ"
}
