#import "../util/pomodoro.typ": pomodoro

#let pomodoro_rules = (
  focus: duration(minutes: 50),
  break_: duration(minutes: 10),
  long_break: duration(minutes: 20),
  sessions: 4,
)

#let pomodoro = pomodoro.with(
  ..pomodoro_rules,
)

#let mon = (
  (
    from: datetime(hour: 6, minute: 30, second: 0),
    to: datetime(hour: 7, minute: 30, second: 0),
    body: [get ready],
  ),
  ..pomodoro((
    from: datetime(hour: 8, minute: 0, second: 0),
    to: datetime(hour: 11, minute: 0, second: 0),
    body: [bib],
  )),
  ..pomodoro((
    from: datetime(hour: 12, minute: 0, second: 0),
    to: datetime(hour: 13, minute: 30, second: 0),
    body: [bib],
  )),
  (
    from: datetime(hour: 13, minute: 30, second: 0),
    to: datetime(hour: 14, minute: 15, second: 0),
    body: [Q&A],
  ),
  ..pomodoro((
    from: datetime(hour: 14, minute: 15, second: 0),
    to: datetime(hour: 19, minute: 0, second: 0),
    body: [bib],
  )),
  (
    from: datetime(hour: 20, minute: 0, second: 0),
    to: datetime(hour: 22, minute: 0, second: 0),
    body: [merle],
  ),
)

#let tue = (
  (
    from: datetime(hour: 6, minute: 30, second: 0),
    to: datetime(hour: 7, minute: 30, second: 0),
    body: [get ready],
  ),
  ..pomodoro((
    from: datetime(hour: 8, minute: 0, second: 0),
    to: datetime(hour: 11, minute: 0, second: 0),
    body: [bib],
  )),
  ..pomodoro((
    from: datetime(hour: 12, minute: 0, second: 0),
    to: datetime(hour: 17, minute: 0, second: 0),
    body: [bib],
  )),
  (
    from: datetime(hour: 18, minute: 0, second: 0),
    to: datetime(hour: 20, minute: 0, second: 0),
    body: [gym],
  ),
)

#let wed = (
  (
    from: datetime(hour: 6, minute: 30, second: 0),
    to: datetime(hour: 7, minute: 30, second: 0),
    body: [get ready],
  ),
  ..pomodoro((
    from: datetime(hour: 8, minute: 0, second: 0),
    to: datetime(hour: 11, minute: 0, second: 0),
    body: [bib],
  )),
  ..pomodoro((
    from: datetime(hour: 12, minute: 0, second: 0),
    to: datetime(hour: 18, minute: 0, second: 0),
    body: [bib],
  )),
  (
    from: datetime(hour: 19, minute: 0, second: 0),
    to: datetime(hour: 20, minute: 0, second: 0),
    body: [gym],
  ),
)

#let thu = (
  (
    from: datetime(hour: 6, minute: 30, second: 0),
    to: datetime(hour: 7, minute: 30, second: 0),
    body: [get ready],
  ),
  ..pomodoro((
    from: datetime(hour: 8, minute: 0, second: 0),
    to: datetime(hour: 11, minute: 0, second: 0),
    body: [bib],
  )),
  ..pomodoro((
    from: datetime(hour: 12, minute: 0, second: 0),
    to: datetime(hour: 19, minute: 0, second: 0),
    body: [bib],
  )),
  (
    from: datetime(hour: 20, minute: 0, second: 0),
    to: datetime(hour: 22, minute: 0, second: 0),
    body: [shawarmen],
  ),
)

#let fri = tue

#let sat = (
  (
    from: datetime(hour: 6, minute: 30, second: 0),
    to: datetime(hour: 7, minute: 30, second: 0),
    body: [get ready],
  ),
  ..pomodoro((
    from: datetime(hour: 8, minute: 0, second: 0),
    to: datetime(hour: 11, minute: 45, second: 0),
    body: [bib],
  )),
  (
    from: datetime(hour: 12, minute: 0, second: 0),
    to: datetime(hour: 14, minute: 0, second: 0),
    body: [sarah],
  ),
)

#let sun = (
  (
    from: datetime(hour: 8, minute: 0, second: 0),
    to: datetime(hour: 9, minute: 0, second: 0),
    body: [get ready],
  ),
  (
    from: datetime(hour: 9, minute: 15, second: 0),
    to: datetime(hour: 12, minute: 0, second: 0),
    body: [clean],
  ),
  (
    from: datetime(hour: 13, minute: 0, second: 0),
    to: datetime(hour: 16, minute: 0, second: 0),
    body: [gym],
  ),
  (
    from: datetime(hour: 17, minute: 0, second: 0),
    to: datetime(hour: 19, minute: 0, second: 0),
    body: [meal prep],
  ),
  (
    from: datetime(hour: 20, minute: 0, second: 0),
    to: datetime(hour: 22, minute: 0, second: 0),
    body: [merle],
  ),
)

#let days = (
  "mon": mon,
  "tue": tue,
  "wed": wed,
  "thu": thu,
  "fri": fri,
  "sat": sat,
  "sun": sun,
)
