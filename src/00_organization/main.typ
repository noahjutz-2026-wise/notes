#import "/src/template.typ": template_base, template_doc_part

#show: template_base

#set document(
  title: [Organisation],
  date: datetime(year: 2026, month: 8, day: 18),
)

#title()
#outline()

#pagebreak()

= Time Plan

#{
  show: template_doc_part
  include "00_time_plan/main.typ"
  pagebreak()
}

= Project Breakdown

#{
  show: template_doc_part
  include "01_project_breakdown/main.typ"
  pagebreak()
}

= Meetings

#{
  show: template_doc_part
  include "02_meetings/main.typ"
  pagebreak()
}

= Miscellaneous


#{
  show: template_doc_part
  include "03_misc/main.typ"
}
