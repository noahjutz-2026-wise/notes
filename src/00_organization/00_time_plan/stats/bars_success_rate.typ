#import "/src/deps.typ": lilaq as lq

#let d(arg1, ..rest) = {
  let raw_data = rest.named().at("raw_data", default: none)
  let (expected_work, data_source) = if rest.pos().len() > 0 {
    (rest.pos().at(0), if raw_data != none { raw_data } else { arg1 })
  } else {
    (arg1, if raw_data != none { raw_data } else { json("../assets/super_productivity.json") })
  }

  let sp = if type(data_source) == str {
    json(data_source)
  } else {
    data_source
  }

  let active = if type(sp) == dictionary {
    sp.at("task", default: (:)).at("entities", default: (:)).values()
  } else { () }
  let young = if type(sp) == dictionary {
    sp.at("archiveYoung", default: (:)).at("task", default: (:)).at("entities", default: (:)).values()
  } else { () }
  let old = if type(sp) == dictionary {
    sp.at("archiveOld", default: (:)).at("task", default: (:)).at("entities", default: (:)).values()
  } else { () }
  let all_tasks = active + young + old

  let days_time = (:)
  for task in all_tasks {
    if type(task) == dictionary and task.at("parentId", default: none) == none {
      for (day_str, ms) in task.at("timeSpentOnDay", default: (:)) {
        days_time.insert(day_str, days_time.at(day_str, default: 0) + ms)
      }
    }
  }

  let day_names = ("mon", "tue", "wed", "thu", "fri", "sat", "sun")

  let data = (
    days_time
      .pairs()
      .sorted(key: it => it.at(0))
      .map(((day_str, ms)) => {
        let (y, m, d) = day_str.split("-").map(int)
        let t = datetime(year: y, month: m, day: d)
        let dur = duration(seconds: int(calc.round(ms / 1000)))

        let weekday_idx = t.weekday() - 1
        let expected_day = if type(expected_work) == dictionary {
          let day_name = day_names.at(weekday_idx)
          expected_work.at(day_name, default: none)
        } else if type(expected_work) == array {
          expected_work.at(weekday_idx, default: none)
        } else {
          none
        }
        if expected_day == none { return none }
        let expected_dur = if type(expected_day) == dictionary {
          expected_day.at("total", default: expected_day.at("work", default: none))
        } else {
          expected_day
        }
        if expected_dur == none or expected_dur == duration(seconds: 0) {
          return none
        }
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
    lq.hlines(1),
    lq.hlines(.8, stroke: black.transparentize(50%)),
  )
}
