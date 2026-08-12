#import "schedule.typ": fri, mon, sat, sun, thu, tue, wed

#let days = (
  "mon": mon,
  "tue": tue,
  "wed": wed,
  "thu": thu,
  "fri": fri,
  "sat": sat,
  "sun": sun,
)

#let break_ratio = 2.5 / 1 // work to breaks

#let units = {
  days
    .pairs()
    .fold((:), (acc, day) => {
      let (k, v) = day
      for block in v {
        let unit = block.body.text
        let dict = acc.at(unit, default: (:))
        dict.insert(k, dict.at(k, default: ()) + (block,))
        acc.insert(unit, dict)
      }
      acc
    })
}

#let expected_work = {
  units
    .bib
    .pairs()
    .map(((k, v)) => {
      let dur = v.map(((from, to, ..)) => to - from).sum()
      let durs = (
        breaks: 1 / (break_ratio + 1) * dur,
        work: break_ratio / (break_ratio + 1) * dur,
        total: dur,
      )
      (k, durs)
    })
    .to-dict()
}

#expected_work
