#let pomodoro(
  slot,
  focus: duration(minutes: 25),
  break_: duration(minutes: 5),
  long_break: duration(minutes: 15),
  sessions: 4,
  break_body: [],
  long_break_body: [],
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
  let lb_body = if long_break_body != none { long_break_body } else { break_body }

  if focus_dur <= duration(seconds: 0) or slot.from >= slot.to {
    return ()
  }

  let cur = slot.from
  let end = slot.to
  let result = ()

  while cur < end {
    // 1. Initial focus session of the cycle
    let next_cur = calc.min(cur + focus_dur, end)
    result.push((..slot, from: cur, to: next_cur, body: slot.body))
    if cur + focus_dur >= end {
      break
    }
    cur = next_cur

    // 2. (sessions - 1) pairs of (break, focus)
    let finished_early = false
    let pair_count = calc.max(0, sessions_cnt - 1)
    for _ in range(pair_count) {
      // Short break
      if break_dur > duration(seconds: 0) {
        next_cur = calc.min(cur + break_dur, end)
        result.push((..slot, from: cur, to: next_cur, body: break_body))
        if cur + break_dur >= end {
          finished_early = true
          break
        }
        cur = next_cur
      }

      // Focus
      next_cur = calc.min(cur + focus_dur, end)
      result.push((..slot, from: cur, to: next_cur, body: slot.body))
      if cur + focus_dur >= end {
        finished_early = true
        break
      }
      cur = next_cur
    }

    if finished_early {
      break
    }

    // 3. Long break after completing all focus sessions in the cycle
    if long_break_dur > duration(seconds: 0) {
      next_cur = calc.min(cur + long_break_dur, end)
      result.push((..slot, from: cur, to: next_cur, body: lb_body))
      if cur + long_break_dur >= end {
        break
      }
      cur = next_cur
    }
  }

  result
}
