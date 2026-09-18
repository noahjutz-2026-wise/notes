#import "../util/pomodoro.typ": pomodoro

#let parse_time(s) = {
  let parts = s.split(":")
  let h = int(parts.at(0))
  let m = int(parts.at(1))
  let sec = if parts.len() > 2 { int(parts.at(2)) } else { 0 }
  datetime(hour: h, minute: m, second: sec)
}

#let parse_dur(d) = {
  if type(d) == duration {
    d
  } else if type(d) == int {
    duration(minutes: d)
  } else if type(d) == str {
    if d.ends-with("m") {
      duration(minutes: int(d.slice(0, -1)))
    } else if d.ends-with("h") {
      duration(hours: int(d.slice(0, -1)))
    } else if d.ends-with("s") {
      duration(seconds: int(d.slice(0, -1)))
    } else {
      duration(minutes: int(d))
    }
  } else {
    panic("unknown duration format: " + repr(d))
  }
}

#let raw_data = yaml("weekly_schedule.yaml")
#let pomo_cfg = raw_data.at("pomodoro", default: (:))

#let default_pomodoro_rules = (
  focus: parse_dur(pomo_cfg.at("focus", default: 25)),
  break_: parse_dur(pomo_cfg.at("break", default: 5)),
  long_break: parse_dur(pomo_cfg.at("long_break", default: 15)),
  sessions: int(pomo_cfg.at("sessions", default: 4)),
)

#let parse_day(entries) = {
  let result = ()
  for entry in entries {
    let slot = (
      from: parse_time(entry.from),
      to: parse_time(entry.to),
      body: [#entry.body],
    )
    let pomo = entry.at("pomodoro", default: false)
    if pomo != false {
      let rules = default_pomodoro_rules
      let extra_args = (:)
      if type(pomo) == dictionary {
        if "focus" in pomo { rules.focus = parse_dur(pomo.focus) }
        if "break" in pomo { rules.break_ = parse_dur(pomo.at("break")) }
        if "long_break" in pomo { rules.long_break = parse_dur(pomo.long_break) }
        if "sessions" in pomo { rules.sessions = int(pomo.sessions) }
        if "offset" in pomo { extra_args.offset = parse_dur(pomo.offset) }
      }
      if "offset" in entry {
        extra_args.offset = parse_dur(entry.offset)
      }
      result += pomodoro(slot, ..rules, ..extra_args)
    } else {
      result.push(slot)
    }
  }
  result
}

#let schedule = raw_data.at("schedule", default: raw_data)

#let mon = parse_day(schedule.mon)
#let tue = parse_day(schedule.tue)
#let wed = parse_day(schedule.wed)
#let thu = parse_day(schedule.thu)
#let fri = parse_day(schedule.fri)
#let sat = parse_day(schedule.sat)
#let sun = parse_day(schedule.sun)

#let days = (
  "mon": mon,
  "tue": tue,
  "wed": wed,
  "thu": thu,
  "fri": fri,
  "sat": sat,
  "sun": sun,
)
