#import "/deps.typ": lilaq as lq

#let d(raw_data, expected_work) = {
  let data = (
    raw_data
      .map(row => {
        let (y, m, d) = row.at(0).split("-").map(int)
        let t = datetime(year: y, month: m, day: d)
        let dur = duration(seconds: int(1000 * float(row.at(1))))

        let weekday = t.weekday() - 1
        if weekday > 5 { return }
        let expected_dur = expected_work.values().at(weekday).work
        let part = dur / expected_dur
        (t, part)
      })
      .filter(it => it != none)
  )

  let x = data.map(it => it.at(0))
  let y = data.map(it => it.at(1))

  lq.diagram(
    width: 100%,
    height: 300pt,
    lq.bar(
      x,
      y,
    ),
  )
}
