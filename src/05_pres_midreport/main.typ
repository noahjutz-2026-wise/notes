#import "/src/deps.typ": touying
#import "/src/deps.typ": cheq
#import "/src/deps.typ": gh-minimal-slides as gh
#import "/vendor/planning/macro_schedule.typ": milestones
#import touying: *

#show link: set text(blue)
#set table(stroke: none, inset: 12pt)

#show: gh.register
#show: cheq.checklist

#let name = "Sim2Real Transfer of Deep Reinforcement Learning Algorithms to solve a Labyrinth Game"

#set document(
  title: [Interim Report],
  keywords: (),
  author: "Noah Jutz",
  date: datetime(year: 2026, month: 10, day: 19),
)

#gh.cover-slide(
  kicker: quote(name),
  title: context document.title,
  badges: (
    "v1.0.0-alpha02",
    context sys.inputs.at("revision", default: none),
  ).filter(it => it != none),
  footer-left: [
    #{ context document.author.join() } #sym.dot #{ context document.date.display() }
  ],
  footer-right: none,
)

#gh.section-slide(number: "01", title: [Previous Work])

#gh.content-slide(title: [Code projects])[
  #table(
    columns: 3,
    table.header([*Project*], [*Description*], [*Status*]),
    table.hline(),
    link("https://codeberg.org/CyberRunner/cr-container")[cr-container],
    [Containerized Legacy CR],
    [$arrow.r.hook$ Superseded by cr-robostack],
    link("https://codeberg.org/CyberRunner/cr-patched")[cr-patched],
    [Hacky fixes],
    [$arrow.r.hook$ Superseded by cr-robostack],
    link("https://codeberg.org/CyberRunner/cr-autostart")[cr-autostart],
    [Bash helper scripts],
    [$arrow.r.hook$ Superseded by cr-robostack],
    link("https://codeberg.org/CyberRunner/cr-robostack")[cr-robostack],
    [Portable, reproducible, CR fork],
    [$arrow.r.loop$ Migrate to crs2r-system-real],
  )
]

#gh.content-slide(title: [Hardware Projects])[
  #table(
    columns: 3,
    table.header([*Project*], [*Description*], [*Status*]),
    table.hline(),
    link("https://codeberg.org/CyberRunner/cr-3d-models")[cr-3d-models],
    [
      Servo-based hardware setup

      TODO img
    ],
    [
      - [/] Reload mechanism
    ],

    link("https://codeberg.org/CyberRunner/cr-reload-mechanism")[cr-reload],
    [
      Light Sensor + Solenoid

      TODO img
    ],
    [#sym.checkmark Done],
  )
]

#gh.section-slide(number: "02", title: [Thesis])

#gh.content-slide(title: [Research Question])[
  *Does a unity trained model work in reality?*
  - How _performant_? (e.g. accuracy, speed, reward)
  - How _robust_? (e.g. to noise, latency)
  - At what _cost_? (e.g. samples, compute)
  - _Why_? (e.g. domain randomization, algorithm)
  - _Why_ not? (e.g. difficult sections, jerky movement)
]

#gh.content-slide(title: [Experiments])[
  #include "experiment.typ"
]

#gh.content-slide(title: [Architecture])[
  #include "arch_components.typ"
]

#gh.section-slide(number: "03", title: [Roadmap])

#gh.content-slide(title: [Milestones])[
  #include "/src/00_organization/00_time_plan/timeline/timeline.typ"
]

#let milestones_tbl = {
  milestones
    .enumerate()
    .map(((i, m)) => {
      let (d, c) = m
      (str(i + 1), d.display("[year]-[month]-[day]"), c)
    })
    .flatten()
}

#gh.content-slide(title: [Milestones])[
  #table(
    columns: 3,
    table.header([*\#*], [*Date*], [*Goal*]),
    table.hline(),
    ..milestones_tbl.slice(0, 3 * 7),
  )
]

#gh.content-slide(title: [Milestones])[
  #table(
    columns: 3,
    table.header([*\#*], [*Date*], [*Goal*]),
    table.hline(),
    ..milestones_tbl.slice(3 * 7),
  )
]

#gh.closing-slide(
  kicker: [],
  title: [Thank you],
  links: ("github.com/noahjutz-2026-wise", "codeberg.org/CyberRunner"),
)
