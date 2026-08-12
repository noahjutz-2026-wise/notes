#import "/deps.typ": lilaq as lq
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

= Expected work

#lq.diagram(
  width: 100%,
  height: 200pt,
  xaxis: (
    ticks: range(7),
    format-ticks: (ticks, ..args) => {
      ticks.map(tick => {
        expected_work.keys().at(int(tick))
      })
    },
  ),
  yaxis: (
    format-ticks: lq.tick-format.linear,
  ),
  lq.bar(
    range(expected_work.keys().len()),
    expected_work.values().map(it => it.work.hours()),
    label: [Work],
  ),
  lq.bar(
    range(expected_work.keys().len()),
    expected_work.values().map(it => it.work.hours() + it.breaks.hours()),
    base: expected_work.values().map(it => it.work.hours()),
    label: [Breaks],
  ),
)

#expected_work.values().map(((work, ..)) => work).sum()

= Deviation

#let raw_data = csv("assets/tomato.tsv", delimiter: "\t")
#let data = (
  raw_data
    .map(row => {
      let (y, m, d) = row.at(0).split("-").map(int)
      let t = datetime(year: y, month: m, day: d)
      let dur = duration(seconds: int(1000 * float(row.at(1))))

      let weekday = t.weekday() - 1
      if weekday > 5 { return }
      let expected_dur = expected_work.values().at(weekday).work
      let dur_dev = dur - expected_dur
      (t, dur_dev.hours())
    })
    .filter(it => it != none)
)


#let x = data.map(it => it.at(0))
#let y = data.map(it => it.at(1))

#lq.diagram(
  width: 100%,
  height: 300pt,
  lq.plot(
    x,
    y,
  ),
)
