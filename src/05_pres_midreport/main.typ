#import "/src/deps.typ": touying
#import "/src/deps.typ": cheq
#import "/src/deps.typ": gh-minimal-slides as gh
#import touying: *

#show link: set text(blue)

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
  badges: ("v1.0.0-alpha02",),
  footer-left: [
    #{ context document.author.join() } #sym.dot #{ context document.date.display() }
  ],
  footer-right: none,
)

#gh.section-slide(number: "01", title: [Previous Work])

#gh.content-slide(title: [Code projects])[
  #table(
    columns: 3,
    stroke: none,
    inset: 12pt,
    table.header([*Project*], [*Description*], [*Status*]),
    table.hline(),
    link("https://codeberg.org/CyberRunner/cr-container")[cr-container], [Containerized Legacy CR], [$arrow.r.hook$ Superseded by cr-robostack],
    link("https://codeberg.org/CyberRunner/cr-patched")[cr-patched], [Hacky fixes], [$arrow.r.hook$ Superseded by cr-robostack],
    link("https://codeberg.org/CyberRunner/cr-autostart")[cr-autostart], [Bash helper scripts], [$arrow.r.hook$ Superseded by cr-robostack],
    link("https://codeberg.org/CyberRunner/cr-robostack")[cr-robostack], [Portable, reproducible, CR fork], [$arrow.r.loop$ Migrate to crs2r-system-real],
  )
]

#gh.content-slide(title: [Hardware Projects])[
  #table(
    columns: 3,
    stroke: none,
    inset: 12pt,
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
  How well does a unity trained model work in reality?

  #include "experiment.typ"
]

#gh.closing-slide(
  title: [Thanks.],
  links: ("github.com/xingjian-zhang/gh-minimal-slides", "typst.app/universe"),
)
