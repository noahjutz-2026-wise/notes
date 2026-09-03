#import "/template.typ": *

#set document(
  title: [Code Notes],
  date: datetime(year: 2026, month: 8, day: 22),
)

#show: template_base

#title()

#outline()

#pagebreak()

= Overview

#{
  show: template_doc_part
  include "overview/main.typ"
}

= Tools

#{
  show: template_doc_part
  include "tools/main.typ"
}
