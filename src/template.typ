#let template_base(body) = {
  set document(
    author: "Noah Jutz",
    date: datetime.today(),
  )
  set page(header: {
    set text(black.lighten(25%))
    stack(dir: ltr, spacing: 1fr)[
      #context document.author.join("")
    ][
      Bachelorarbeit -- CyberRunner Sim2Real
    ][
      #context document.date.display()
    ]
  })
  set text(
    lang: "de",
    font: "New Computer Modern",
  )
  body
}

#let template_doc_part(body) = {
  set heading(
    offset: 1,
    numbering: (..x) => {
      let x = x.pos()
      numbering(
        "1.1",
        ..x.slice(1),
      )
    },
  )
  body
}
