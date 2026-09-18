#let build_cycle(focus, break_dur, long_break_dur, sessions, body, break_body, long_break_body) = {
  let items = ()
  let pair_count = calc.max(0, sessions - 1)

  // 1. Initial focus session
  items.push((type: "focus", dur: focus, body: body))

  // 2. (sessions - 1) pairs of (break, focus)
  for _ in range(pair_count) {
    if break_dur > duration(seconds: 0) {
      items.push((type: "break", dur: break_dur, body: break_body))
    }
    items.push((type: "focus", dur: focus, body: body))
  }

  // 3. Long break after sessions focus sessions
  if long_break_dur > duration(seconds: 0) {
    items.push((type: "long_break", dur: long_break_dur, body: long_break_body))
  }

  items
}

#let pomodoro(
  slot,
  focus: duration(minutes: 25),
  break_: duration(minutes: 5),
  long_break: duration(minutes: 15),
  sessions: 4,
  break_body: none,
  long_break_body: none,
  offset: duration(seconds: 0),
  ..rest,
) = {
  // Support positional arguments and different naming conventions for break
  let pos = rest.pos()
  let focus_dur = if pos.len() > 0 { pos.at(0) } else { focus }
  let break_dur = if pos.len() > 1 {
    pos.at(1)
  } else if break_ != none {
    break_
  } else if "break" in rest.named() {
    rest.named().at("break")
  } else if "short_break" in rest.named() {
    rest.named().at("short_break")
  } else {
    duration(minutes: 5)
  }
  let long_break_dur = if pos.len() > 2 { pos.at(2) } else { long_break }
  let sessions_cnt = if pos.len() > 3 { pos.at(3) } else { sessions }
  let offset_dur = if "offset" in rest.named() {
    rest.named().at("offset")
  } else if offset != none {
    offset
  } else {
    duration(seconds: 0)
  }

  if focus_dur <= duration(seconds: 0) or slot.from >= slot.to {
    return ()
  }

  let items = build_cycle(focus_dur, break_dur, long_break_dur, sessions_cnt, slot.body, break_body, long_break_body)
  let cycle_sec = 0
  for it in items {
    cycle_sec += int(it.dur.seconds())
  }

  if cycle_sec <= 0 {
    return ()
  }

  // Shift the timeline according to offset
  let off_sec = int(offset_dur.seconds())
  let shift_sec = calc.rem(calc.rem(off_sec, cycle_sec) + cycle_sec, cycle_sec)
  let cur = slot.from - duration(seconds: shift_sec)

  let result = ()
  let done = false

  while not done {
    for it in items {
      let it_start = cur
      let it_end = cur + it.dur
      cur = it_end

      // Skip sessions completely before slot.from
      if it_end <= slot.from {
        continue
      }
      // Stop once sessions start past slot.to
      if it_start >= slot.to {
        done = true
        break
      }

      // Clamp interval to [slot.from, slot.to]
      let s = calc.max(it_start, slot.from)
      let e = calc.min(it_end, slot.to)

      if e > s and it.body != none {
        result.push((..slot, from: s, to: e, body: it.body))
      }

      if it_end >= slot.to {
        done = true
        break
      }
    }
  }

  result
}
