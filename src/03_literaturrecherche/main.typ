#import "/template.typ": *

#set document(
  title: [Literaturrecherche],
  date: datetime(year: 2026, month: 8, day: 12),
)

#show: template_base

#title()

#outline()

#pagebreak()

= Übersicht

#{
  show: template_doc_part
  include "overview/main.typ"
}

#pagebreak()

= Notizen

#{
  show: template_doc_part
  include "books/barto_sutton.typ"
}
