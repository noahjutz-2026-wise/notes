#let template_base(body) = {
  set document(
    author: "Noah Jutz",
    date: datetime.today(),
  )
  set page(
    header: [
      #stack(dir: ltr, spacing: 1fr)[
        #context document.author.join("") \
        Bachelorarbeit -- CyberRunner Sim2Real
      ][
        #context document.date.display()
      ]
    ],
  )
  body
}
