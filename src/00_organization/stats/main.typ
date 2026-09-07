#import "/deps.typ": lilaq as lq
#import "../config/weekly_schedule.typ": days

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

#let expected_work = (
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
)

#figure(caption: [Expected Work])[
  #import "bars_expected_work.typ"
  #bars_expected_work.d(expected_work)
]

// #expected_work.values().map(((work, ..)) => work).sum()

#figure(caption: [Success rate])[
  #let raw_data = csv("../assets/tomato.tsv", delimiter: "\t")
  #import "bars_success_rate.typ"
  #bars_success_rate.d(raw_data, expected_work)
]
