#import "/deps.typ": lilaq as lq
#import "../config/schedule.typ": days

#let d(expected_work) = lq.diagram(
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
